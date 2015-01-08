<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--@elvariable id="browserClass" type="java.lang.String"--%>
<%--@elvariable id="country" type="java.lang.Boolean"--%>
<%--@elvariable id="cart" type="ru.aktubselmash.model.Cart"--%>
<%--@elvariable id="basket" type="ru.aktubselmash.model.Cart"--%>
<%--@elvariable id="shippingPayments" type="java.util.List<ru.aktubselmash.model.ShippingPayment>"--%>
<%--@elvariable id="partyTypes" type="ru.aktubselmash.model.constant.PartyType[]"--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Мой заказ - Актюбсельмаш</title>
	<meta content="Корзина, оформление заказа" name="description">
	<meta content="машинка +для стрижки овец оформление заказа, машинки +для стрижки овец покупка" name="keywords">
	<meta content="Актюбсельмаш" name="author">

	<link href="<%=request.getContextPath()%>/favicon.ico" rel="shortcut icon"/>
	<link type="image/x-icon" href="<%=request.getContextPath()%>/favicon.ico" rel="icon"/>
	<link media="all" type="text/css" href="<%=request.getContextPath()%>/css/smoothness/jquery-ui-1.8.13.custom.css" rel="stylesheet"/>
	<link media="all" type="text/css" href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet"/>

	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.6.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-ui-1.8.13.custom.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/main.js"></script>
    <script type="text/javascript">
        var sp = {}, prices = {};
        $(document).ready(function() {
//            $.ajax({
//                type: "GET",
//                url: "http://www.ya.ru"
//            })
//            .done(function(data) {
//                console.log(data);
//            })
//            .fail(function(jqXHR, textStatus, errorThrown) {
//                console.log("[cart] request failed: [%d] %s, %s", jqXHR.status, textStatus, errorThrown);
//            });


            $('.cart-table tbody tr').live({
                mouseenter: function() { $(this).addClass('hover'); },
                mouseleave: function() { $(this).removeClass('hover'); }
            });

            $('.row .field').hover(function() {
                $(this).addClass('hover');
            }, function() {
                $(this).removeClass('hover');
            });

            <c:if test="${fn:length(cart.cartProducts) eq 0}">$('.complete-button').css({opacity: '.3'});</c:if>
            $('.complete-button').click(function() {
                if (!$('.cart-table td div.text').length) {
                    $('.info-msg').dialog({
                        buttons: { Ok: function() { $(this).dialog('close'); } },
                        width: '450',
                        height: '170',
                        <c:if test="${!fn:contains(browserClass, 'ie6')}">modal: true,</c:if>
                        resizable: false
                    });
                    return false;
                }
                if ($('#building').hasClass('empty')) $('#building').val('');
//                if ($('#corp').hasClass('empty')) $('#corp').val('');
//                if ($('#str').hasClass('empty')) $('#str').val('');
                if ($('#apartment').hasClass('empty')) $('#apartment').val('');

                $(this).parent().parent().find(':submit').click();

                checkForStub($('#building')); checkForStub($('#apartment'));
//                checkForStub($('#corp')); checkForStub($('#str'));
                return false;
            });

            var shippingPayments = [<c:forEach var="sp" items="${shippingPayments}" varStatus="status">
                    {sid: ${sp.shipping.id}, sname : '${sp.shipping.name}', pid: ${sp.payment.id},
                        pname: '${sp.payment.name}', description: '${sp.payment.description}'}<c:if test="${not status.last}">,</c:if>
            </c:forEach>];

            for (var key in shippingPayments) {
                var value = shippingPayments[key];
                if (!sp[value.sid]) sp[value.sid] = [value];
                else {
                    var list = sp[value.sid];
                    list[list.length] = value;
                    sp[value.sid] = list;
                }
            }
            var cnt = 0, id = 0;
            for (key in sp) {
                value = (sp[key])[0];
                if (cnt == 2) id = key;
                $('#shippings').append('<option value="' + value.sid + '" ' + (cnt == 2 ? 'selected="selected"' : '') + '>' +
                        value.sname + '</option>');
                cnt++;
            }
            changeRequireFields(sp[id][0].sname);
            $('#shippings').change(function() {
                populatePayments($('#shippings option:selected').val());
                if ($('.cart-table td div.text').length)
                    updatePrices();
                changeRequireFields($('#shippings option:selected').text());
            });

            $('#building').data('stub', 'дом'); checkForStub($('#building'));
//            $('#corp').data('stub', 'корп.'); checkForStub($('#corp'));
//            $('#str').data('stub', 'стр.'); checkForStub($('#str'));
            $('#apartment').data('stub', 'офис/кв.'); checkForStub($('#apartment'));

            $('#building, #apartment').focus(function() {
                if ($(this).hasClass('empty')) {
                    $(this).val('');
                    $(this).removeClass('empty');
                }
            }).blur(function() { checkForStub($(this)); });

            <c:forEach var="cpp" items="${cart.cartProducts}" varStatus="status">
                prices[${cpp.product.id}] = {number : ${cpp.number}, price: ${cpp.price}};
            </c:forEach>

            $('.number').keyup(function() {
                var cpp = prices[$(this).closest('tr').find('td:first').text()];
                if (/^\d+$/.test($(this).val())) {
                    var delta = cpp.number - parseInt($(this).val());
                    cpp.number = $(this).val();
                    $(this).closest('tr').find('td:nth-child(6) span').html(formatNumber(cpp.number * cpp.price));
                    $('.total h1 span').html(formatNumber(calculateTotalPrice()));

                    var $count = $('#header div.cart .count');
                    $count.html((parseInt($count.html()) - delta) || 0);
                }
                else {
                    $(this).val(cpp.number);
                }
            });

            $('.trash-a').click(function() {
                var $tr = $(this).closest('tr');
                var productId = $tr.find('td:first').text();
                var url = "<%=request.getContextPath()%>/cart/removeProduct";
                $.getJSON(url, { productId: productId }, function(result) {
                    if (result.success) {
                        $tr.remove();
                        delete prices[productId];
                        $('.total h1 span').html(formatNumber(calculateTotalPrice()));

                        if ($('.cart-table td div.text').length == 0) {
                            $('.cart-table tbody').append('<tr><td colspan="6">Нет товаров</td></tr>');
                            $('#header div.cart .count').html('0');
                            $('.complete-button').css({opacity: '.3'});
                        }

                        var totalNumber = 0;
                        for (var id in prices) {
                            if (prices.hasOwnProperty(id))
                                totalNumber += parseInt(prices[id].number);
                        }
                        $('#header div.cart .count').html(totalNumber);
//                        var offset = $('.cart-popup').width() / 2;
//                        if (cartPopupTimeout) clearTimeout(cartPopupTimeout);
//                        $('.cart-popup').css({
//                            display: 'block',
//                            top: 25,
//                            left: $('div.cart').offset().left + 18 - $('#header').offset().left - offset
//                        }).animate({opacity: 1, top: 36}, function() {
//                            var $$ = $(this);
//                            cartPopupTimeout = setTimeout(function() {
//                                $$.animate({opacity: 0}, function() { $(this).hide() });
//                            }, 1000);
//                        });
                    }
                }).complete(function() {
                }).error(function() {
                    alert('Не удалось удалить товар из корзины. Обновите страницу.');
                });
            });

            checkTypeForCorporate($('#type'));
            $('#type').change(function() { checkTypeForCorporate($(this)); });
            <c:if test="${fn:contains(browserClass, 'ie7')}">
                $('#shippings').change();
            </c:if>
            populatePayments(id);
            updateAdditionalLabels(parseInt(id));

            $.validator.addMethod(
                "vrequired", function(value, element) {
                    return !$(element).closest('.field').find('span.required').is(':visible') || value.length > 0;
                },
                ""
            );
            $.validator.addMethod(
                "phoneNumber", function(value, element) {
                    return /[\d\+\-\(\)\s]+/.test(value);
                },
                ""
            );
            $('#cart-form').validate({
                rules: {
                    'client.fio': "required",
                    'client.email': {
                        email: true//,
//                        vrequired: true
                    },
                    'client.phoneNumber': {
                        required: true,
                        phoneNumber: true
                    },
                    'client.companyName': {
                        required: function(element) {
                            return $('#type').find('option:selected').val() == 'CORPORATE' &&
                                    $(element).closest('.field').find('span.required').is(':visible');
                        }
                    },
                    'client.property': {
                        required: function(element) {
                            return $('#type').find('option:selected').val() == 'CORPORATE' &&
                                    $(element).closest('.field').find('span.required').is(':visible');
                        }
                    },
                    'client.addresses[0].city': {
                        vrequired: true
                    },
                    'client.addresses[0].street': {
                        vrequired: true
                    }//,
//                    'client.addresses[0].building': {
//                        vrequired: true
//                    },
//                    'client.addresses[0].apartment': {
//                        vrequired: true
//                    },
//                    'client.addresses[0].postalCode': {
//                        vrequired: true
//                    }
                },
                messages: {
                    'client.fio': "Поле не может быть пустым",
                    'client.email': {
                        vrequired: "Эл. почта необходима для связи с вами",
                        email: "Эл. почта должна быть в формате name@domain.com"
                    },
                    'client.phoneNumber': {
                        required: "Укажите телефонный номер для связи с вами",
                        phoneNumber: "Номер может состоять из цифр, '(', ')', '+' и '-'"
                    },
                    'client.companyName': "Укажите название организации",
                    'client.property': "Укажите реквизиты банковского счета",
                    'client.addresses[0].region': "Укажите область",
                    'client.addresses[0].city': "Укажите город",
                    'client.addresses[0].county': "Укажите населенный пункт",
                    'client.addresses[0].street': "Укажите улицу",
                    'client.addresses[0].building': "Укажите номер дома",
                    'client.addresses[0].apartment': " и номер квартиры или офиса",
                    'client.addresses[0].postalCode': "Укажите почтовый индекс"
                },
                errorClass: 'error',
                highlight: function(element, errorClass) {
                    $(element).closest('.field').addClass(errorClass);
                    if ($(element).attr('id') == 'building' && $('#apartment').hasClass('empty'))
                        $(element).closest('.row').find('div.message label:last-child').html(' и номер квартиры или офиса');
                },
                unhighlight: function(element, errorClass) {
                    if ($(element).attr('id') == 'building' && $('#apartment').hasClass('empty'))
                        $(element).closest('.row').find('div.message label:last-child').html('Укажите номер квартиры или офиса');
                    $(element).closest('.field').removeClass(errorClass).find('div.message').empty().hide();
                },
                errorPlacement: function(error, element) {
                    if ($(element).attr('id') == 'apartment' && !$('#building').hasClass('empty'))
                        error.html('Укажите номер квартиры или офиса');
                    $(element).closest('.row').find('div.message').append(error).show();
                },
                submitHandler: function(form) {
                    $('.complete-button').hide();
                    $('.blue-button-loading').parent().show();
   	                form.submit();
                }
            });

            bindMaxLength($('#property'), 1024);
            bindMaxLength($('#details'), 255);
        });

        function populatePayments(id) {
            var cnt = 0;
            $('#payments option').remove();
            for (key in sp[id]) {
                value = (sp[id])[key];
                $('#payments').append('<option value="' + value.pid + '" ' + (cnt == 0 ? 'selected="selected"' : '') + '>' +
                        value.pname + '</option>');
                cnt++;
            }
            $('#payments').change();
        }

        function updatePrices() {
            var url = "<%=request.getContextPath()%>/cart/updatePrices";
            $.getJSON(url, { shippingId: $('#shippings option:selected').val() }, function(result) {
                for (var key in result) {
                    var pr = result[key];
                    prices[pr.productId].price = pr.price;
                }
                $('.cart-table tbody tr td:first-child').each(function(index, val) {
                    var o = prices[$(val).text()];
                    $(val).closest('tr').find('td.sum-item-price span').html(formatNumber(o.price * o.number));
                    $(val).closest('tr').find('td.one-item-price .price').val(o.price);
                    $(val).closest('tr').find('td.one-item-price span').html(formatNumber(o.price));

                    // + запасная пара в подарок для Liscop & F7
//                    if (parseInt($(val).text()) == 1 &&
//                        $.inArray(parseInt($('#shippings option:selected').val()), [3,4,5]) > -1)
//                    {
//                        var $td = $(val).closest('tr').find('td:eq(2)');
//                        if ($td.find('span').length == 0)
//                            $td.append(
//                                    '<span style="">+ запасная режущая пара в подарок</span>');
//                    }
//                    else if (parseInt($(val).text()) == 12 &&
 //                            $.inArray(parseInt($('#shippings option:selected').val()), [1,2,3,4,5]) > -1)
  //                  {
   //                     $td = $(val).closest('tr').find('td:eq(2)');
//                        if ($td.find('span').length == 0)
//                            $td.append(
//                                    '<span style="">+ запасная режущая пара в подарок</span>');
//                    }
//                    else {
                        $(val).closest('tr').find('td:eq(2) span').remove();
//                    }
                });
                $('.total h1 span').html(formatNumber(calculateTotalPrice()));
            }).complete(function() {
            }).error(function() {
                alert('error');
            });
        }

        function updateAdditionalLabels(shippingId) {
            $('.cart-table tbody tr td:first-child').each(function(index, val) {
                // + запасная пара в подарок для Liscop & F7
//                if (parseInt($(val).text()) == 1 &&
//                    $.inArray(shippingId, [3,4,5]) > -1)
//                {
//                    var $td = $(val).closest('tr').find('td:eq(2)');
//                    if ($td.find('span').length == 0)
//                        $td.append(
//                                '<span style="">+ запасная режущая пара в подарок</span>');
//                }
//                else
//                if (parseInt($(val).text()) == 12 &&
//                        $.inArray(shippingId, [1,2,3,4,5]) > -1)
//                {
//                    var $td = $(val).closest('tr').find('td:eq(2)');
//                    if ($td.find('span').length == 0)
//                        $td.append(
//                                '<span style="">+ запасная режущая пара в подарок</span>');
//                }
//                else {
                    $(val).closest('tr').find('td:eq(2) span').remove();
//                }
            });
        }

        function calculateTotalPrice() {
            var total = 0;
            for (var key in prices) {
                var value = prices[key];
                total += value.number * value.price;
            }
            return total;
        }

        function formatNumber(number) {
            var str = number + '',
                n = str.length,
                f = Math.floor(n / 3),
                output = f == 0 ? str : '';
            for (var i = 0; i < f; i++) {
                var j = n - 3 * (f - i);
                if (i == 0 && j > 0) output += str.substr(0, j);
                output += (output.length > 0 ? '&nbsp;' : '') + str.substr(j, 3);
            }
            return output;
        }

        function checkForStub($element) {
            if ($element.val().length == 0) {
                $element.addClass('empty');
                $element.val($element.data('stub'));
            }
        }

        function checkTypeForCorporate($element) {
            if ($element.find('option:selected').val() == 'CORPORATE') {
                $('#companyName, #property').closest('.field').find('span.required').show();
                $('#companyName, #property').closest('.row').show('slow');
            } else {
                $('#companyName, #property').closest('.field').find('span.required').hide();
                $('#companyName, #property').closest('.row').hide('slow');
            }
        }

        function changeRequireFields(text) {
            if (text == 'Самовывоз') {
                $('.row .field span.required').hide();
                $('#fio, #phoneNumber').closest('.field').find('span.required').show();
                if ($('#type').find('option:selected').val() == 'CORPORATE') {
                    $('#companyName, #property').closest('.field').find('span.required').show();
                }
            }
            else {
                $('.row .field span.required').show();
            }
        }

        function bindMaxLength(textarea, maxlength) {
            textarea.keyup(function () {
                var text = $(this).val();
                var textLength = text.length;
                console.log(textLength);
                if (textLength > maxlength) {
                    $(this).val(text.substring(0, (maxlength)));
                }
            }).keydown(function () {
                var text = $(this).val();
                var textLength = text.length;
                if (textLength > maxlength) {
                    $(this).val(text.substring(0, (maxlength)));
                }
            });
        }
    </script>
</head>
<body class="${browserClass}">
<div id="wrapper">
    <fmt:setLocale value="RU"/>
    <c:set var="selected" value="" scope="request"/>
    <jsp:include page="header.jsp" />
	<div id="content">
        <div class="main-content">
            <div class="box box-container">
                <h1>
                    <span style="float: left;">Мой заказ</span>
                    <a href="<%=request.getContextPath()%>/home" class="home-icon blue" style="color: #08c;">Продолжить покупки →</a>
                    <div style="clear: both;"></div>
                </h1>
                <div style="margin: 15px 10px;">
                    <c:set var="url"><%=request.getContextPath()%>/cart/complete</c:set>
                    <form:form commandName="cart" id="cart-form" action="${url}" method="POST">
                        <div>
                            <ul class="vertical-ul contacts-ul cart-ul">
                                <li>
                                    <div class="num"><span>1</span></div>
                                    <div class="address">
                                        <h2 style="font-weight: normal; margin-bottom: 20px;">Перечень товаров</h2>
                                        <table class="cart-table">
                                            <thead>
                                                <tr>
                                                    <th width="30" class="index first">№</th>
                                                    <th>Наименование товара</th>
                                                    <th>Кол-во</th>
                                                    <th width="80">Цена</th>
                                                    <th width="90">Сумма</th>
                                                    <th class="last"></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:set var="totalPrice" value="0"/>
                                                <c:forEach var="cpp" items="${cart.cartProducts}" varStatus="status">
                                                    <tr class="<c:choose><c:when test="${status.count % 2 eq 0}">even</c:when><c:otherwise>odd</c:otherwise></c:choose>">
                                                        <td style="display:none;">${cpp.product.id}</td>
                                                        <td class="index first">${status.count}</td>
                                                        <td>
                                                            <c:set var="link">
                                                                <c:choose>
                                                                    <c:when test="${cpp.product.partsFlag}">parts</c:when>
                                                                    <c:otherwise>clippers</c:otherwise>
                                                                </c:choose>
                                                            </c:set>
                                                            <a href="<%=request.getContextPath()%>/${link}/${cpp.product.shortName}" style="font-size: 10pt;">${cpp.product.name}</a>
                                                        </td>
                                                        <td>
                                                            <div style="float: right;">
                                                                <div class="text" style="float: left;">
                                                                    <span class="l">
                                                                        <form:input path="cartProducts[${status.index}].number"
                                                                                    cssStyle="width: 30px; text-align: right;"
                                                                                    cssClass="number"/>
                                                                    </span>
                                                                    <span class="r"></span>
                                                                </div>
                                                                <span style="margin: 3px 0 0 3px; display: block; float: left;">${cpp.product.unit}</span>
                                                            </div>
                                                        </td>
                                                        <td class="index one-item-price">
                                                            <span><fmt:formatNumber value="${cpp.price}"/></span> руб.
                                                            <form:input path="cartProducts[${status.index}].price" cssClass="price" cssStyle="display: none;"/>
                                                        </td>
                                                        <td class="index sum-item-price" style="white-space: nowrap;"><span><fmt:formatNumber value="${cpp.price * cpp.number}"/></span> руб.</td>
                                                        <td><span class="trash-a" title="Удалить"></span></td>
                                                    </tr>
                                                    <c:set var="totalPrice" value="${totalPrice + cpp.price * cpp.number}"/>
                                                </c:forEach>
                                                <c:if test="${fn:length(cart.cartProducts) eq 0}">
                                                    <tr>
                                                        <td colspan="6">Нет товаров</td>
                                                    </tr>
                                                </c:if>
                                            </tbody>
                                            <tfoot>
                                                <tr><td colspan="6"></td></tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </li>
                                <li>
                                    <div class="num"><span>2</span></div>
                                    <div class="address">
                                        <h2 style="font-weight: normal; margin-bottom: 20px;">Доставка и оплата</h2>
                                        <div style="overflow: hidden; margin-bottom: 10px; padding-top: 1px;">
                                            <label for="shippings" style=""><span class="label">Доставка</span>
                                                <c:choose>
                                                    <c:when test="${fn:contains(browserClass, 'ie6') or fn:contains(browserClass, 'ios')}">
                                                        <div style="float: left;">
                                                            <select name="shipping.id" id="shippings"></select>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="select" style="float:left;">
                                                            <span class="l"></span>
                                                            <span class="r">
                                                                <select name="shipping.id" id="shippings"></select>
                                                                <span class="option-text">${cart.shipping.name}</span>
                                                            </span>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </label>
                                            <label for="payments"><span class="label" style="margin-left: 7px;">Оплата</span>
                                                <c:choose>
                                                    <c:when test="${fn:contains(browserClass, 'ie6') or fn:contains(browserClass, 'ios')}">
                                                        <select name="payment.id" id="payments"></select>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="select" style="float:left;">
                                                            <span class="l"></span>
                                                            <span class="r">
                                                                <select name="payment.id" id="payments"></select>
                                                                <span class="option-text">${cart.payment.name}</span>
                                                            </span>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </label>
                                            <div style="clear: left;"></div>
                                        </div>
                                        <div>
                                            <div style="float: left; margin-top: 19px;">Подробнее о комиссии в разделах
                                                <a style="font-size: 10pt;" href="<%=request.getContextPath()%>/payment" target="_blank">Оплата</a>
                                                и <a style="font-size: 10pt;"
                                                     href="<%=request.getContextPath()%>/shipping" target="_blank">Доставка</a>.
                                            </div>
                                            <div class="total" style="float:right;">
                                                <span class="title"><span style="font-size: 14pt;">Итого</span> без учета доставки:</span>
                                                <h1><span><fmt:formatNumber value="${totalPrice}"/></span> руб.</h1>
                                            </div>
                                            <div style="clear: both;"></div>
                                        </div>
                                    </div>
                                </li>
                                <li style="margin-bottom: 10px;">
                                    <div class="num"><span>3</span></div>
                                    <div class="address">
                                        <h2 style="font-weight: normal; margin-bottom: 20px;">Контактная информация</h2>
                                        <div style="margin-left: -8px;">
                                            <div class="row">
                                                <div class="field">
                                                    <span class="label">
                                                        <label for="fio">ФИО получателя</label>
                                                        <span class="required">*</span>
                                                    </span>
                                                    <div class="text" style="float: left;">
                                                        <span class="l">
                                                            <form:input path="client.fio" id="fio"
                                                                        maxlength="255" cssStyle="width: 240px;"/>
                                                        </span>
                                                        <span class="r"></span>
                                                        <div style="clear: both;"></div>
                                                    </div>
                                                    <div style="clear: both;"></div>
                                                </div>
                                                <div class="message">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="field">
                                                    <span class="label">
                                                        <label for="email">Эл. почта</label>
                                                        <%--<span class="required" style="display: none;">*</span>--%>
                                                    </span>
                                                    <div class="text" style="float: left;">
                                                        <span class="l">
                                                            <form:input path="client.email" id="email"
                                                                        maxlength="255" cssStyle="width: 240px;"/>
                                                        </span>
                                                        <span class="r"></span>
                                                        <div style="clear: both;"></div>
                                                    </div>
                                                    <div style="clear: both;"></div>
                                                </div>
                                                <div class="message">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="field">
                                                    <span class="label">
                                                        <label for="phoneNumber">Телефон</label>
                                                        <span class="required">*</span>
                                                    </span>
                                                    <div class="text" style="float: left;">
                                                        <span class="l">
                                                            <form:input path="client.phoneNumber" id="phoneNumber" maxlength="255"
                                                                        cssStyle="width: 240px;" title="Номер с кодом страны и города, например, +7 495 123-45-67"/>
                                                        </span>
                                                        <span class="r"></span>
                                                        <div style="clear: both;"></div>
                                                    </div>
                                                    <div style="clear: both;"></div>
                                                </div>
                                                <div class="message">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="field">
                                                    <span class="label">Частное/Юр. лицо</span>
                                                    <c:choose>
                                                        <c:when test="${fn:contains(browserClass, 'ie6') or fn:contains(browserClass, 'ios')}">
                                                            <c:set var="mb">
                                                                <c:choose>
                                                                    <c:when test="${fn:contains(browserClass, 'ie6')}">margin-bottom: 8px;</c:when>
                                                                    <c:otherwise>margin-bottom: 0;</c:otherwise>
                                                                </c:choose>
                                                            </c:set>
                                                            <form:select path="client.type" items="${partyTypes}"
                                                                         itemLabel="label" id="type"
                                                                         cssStyle="width: 251px; ${mb}"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="select">
                                                                <span class="l"></span>
                                                                <span class="r">
                                                                    <form:select path="client.type" items="${partyTypes}"
                                                                                 itemLabel="label" cssStyle="width: 247px;" id="type"/>
                                                                    <span class="option-text">${cart.client.type.label}</span>
                                                                </span>
                                                                <div style="clear: both;"></div>
                                                            </div>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <div style="clear: both;"></div>
                                                </div>
                                                <div class="message">
                                                </div>
                                            </div>
                                            <div class="row" style="display: none;">
                                                <div class="field">
                                                    <span class="label">
                                                        <label for="companyName">Название организации</label>
                                                        <span class="required">*</span>
                                                    </span>
                                                    <div class="text" style="float: left;">
                                                        <span class="l">
                                                            <form:input path="client.companyName" id="companyName"
                                                                        maxlength="255" cssStyle="width: 240px;"/>
                                                        </span>
                                                        <span class="r"></span>
                                                        <div style="clear: both;"></div>
                                                    </div>
                                                    <div style="clear: both;"></div>
                                                </div>
                                                <div class="message">
                                                </div>
                                            </div>
                                            <div class="row" style="display: none;">
                                                <div class="field">
                                                    <span class="label">
                                                        <label for="property">Реквизиты</label>
                                                        <span class="required">*</span>
                                                    </span>
                                                    <div class="textarea" style="float: left;">
                                                        <div class="t"><div class="tr"></div></div>
                                                        <div class="l" style="height: 70px;"></div>
                                                        <form:textarea path="client.property" id="property"
                                                                    cssStyle="width: 241px; height: 70px;"/>
                                                        <div class="r" style="height: 70px;"></div>
                                                        <div style="clear: both;"></div>
                                                        <div class="b"><div class="br"></div></div>
                                                    </div>
                                                    <div style="clear: both;"></div>
                                                </div>
                                                <div class="message">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="field">
                                                    <span class="label">
                                                        <label for="region">Область / Край</label>
                                                        <%--<span class="required" style="display: none;">*</span>--%>
                                                    </span>
                                                    <div class="text" style="float: left;">
                                                        <span class="l">
                                                            <form:input path="client.addresses[0].region" id="region"
                                                                        maxlength="255" cssStyle="width: 240px;"/>
                                                        </span>
                                                        <span class="r"></span>
                                                        <div style="clear: both;"></div>
                                                    </div>
                                                    <div style="clear: both;"></div>
                                                </div>
                                                <div class="message">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="field">
                                                    <span class="label">
                                                        <label for="city">Город / Район</label>
                                                        <span class="required" style="display: none;">*</span>
                                                    </span>
                                                    <div class="text" style="float: left;">
                                                        <span class="l">
                                                            <form:input path="client.addresses[0].city" id="city"
                                                                        maxlength="255" cssStyle="width: 240px;"/>
                                                        </span>
                                                        <span class="r"></span>
                                                        <div style="clear: both;"></div>
                                                    </div>
                                                    <div style="clear: both;"></div>
                                                </div>
                                                <div class="message">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="field">
                                                    <span class="label">
                                                        <label for="city">Населенный пункт</label>
                                                        <%--<span class="required" style="display: none;">*</span>--%>
                                                    </span>
                                                    <div class="text" style="float: left;">
                                                        <span class="l">
                                                            <form:input path="client.addresses[0].county" id="county"
                                                                        maxlength="255" cssStyle="width: 240px;"/>
                                                        </span>
                                                        <span class="r"></span>
                                                        <div style="clear: both;"></div>
                                                    </div>
                                                    <div style="clear: both;"></div>
                                                </div>
                                                <div class="message">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="field">
                                                    <span class="label">
                                                        <label for="street">Улица</label>
                                                        <span class="required" style="display: none;">*</span>
                                                    </span>
                                                    <div class="text" style="float: left;">
                                                        <span class="l">
                                                            <form:input path="client.addresses[0].street" id="street"
                                                                        maxlength="255" cssStyle="width: 240px;"/>
                                                        </span>
                                                        <span class="r"></span>
                                                        <div style="clear: both;"></div>
                                                    </div>
                                                    <div style="clear: both;"></div>
                                                </div>
                                                <div class="message">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="field">
                                                    <span class="label">
                                                        <label for="building">Дом,</label>
                                                        <%--<label for="corp" style="margin-left: 4px;">корпус,</label>--%>
                                                        <%--<label for="str" style="margin-left: 4px;">строение,</label>--%>
                                                        <label for="apartment" style="margin-left: 4px;">офис/кв.</label>
                                                        <%--<span class="required" style="display: none;">*</span>--%>
                                                    </span>
                                                    <div class="text" style="float: left;">
                                                        <span class="l">
                                                            <form:input path="client.addresses[0].building" id="building"
                                                                        maxlength="255" cssStyle="width: 110px;"/>
                                                        </span>
                                                        <span class="r"></span>
                                                        <div style="clear: both;"></div>
                                                    </div>
                                                    <%--<div class="text" style="float: left;">--%>
                                                        <%--<span class="l">--%>
                                                            <%--<form:input path="client.addresses[0].corp" id="corp"--%>
                                                                        <%--cssStyle="width: 45px;"/>--%>
                                                        <%--</span>--%>
                                                        <%--<span class="r"></span>--%>
                                                        <%--<div style="clear: both;"></div>--%>
                                                    <%--</div>--%>
                                                    <%--<div class="text" style="float: left;">--%>
                                                        <%--<span class="l">--%>
                                                            <%--<form:input path="client.addresses[0].str" id="str"--%>
                                                                        <%--cssStyle="width: 45px;"/>--%>
                                                        <%--</span>--%>
                                                        <%--<span class="r"></span>--%>
                                                        <%--<div style="clear: both;"></div>--%>
                                                    <%--</div>--%>
                                                    <div class="text" style="float: left;">
                                                        <span class="l">
                                                            <form:input path="client.addresses[0].apartment" id="apartment"
                                                                        maxlength="255" cssStyle="width: 114px;"/>
                                                        </span>
                                                        <span class="r"></span>
                                                        <div style="clear: both;"></div>
                                                    </div>
                                                    <div style="clear: both;"></div>
                                                </div>
                                                <div class="message">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="field">
                                                    <span class="label">
                                                        <label for="postalCode">Почтовый индекс</label>
                                                        <%--<span class="required" style="display: none;">*</span>--%>
                                                    </span>
                                                    <div class="text" style="float: left;">
                                                        <span class="l">
                                                            <form:input path="client.addresses[0].postalCode" id="postalCode"
                                                                        maxlength="255" cssStyle="width: 50px;"/>
                                                        </span>
                                                        <span class="r"></span>
                                                        <div style="clear: both;"></div>
                                                    </div>
                                                    <div style="clear: both;"></div>
                                                </div>
                                                <div class="message">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="field">
                                                    <span class="label"><label for="details">Дополнительная информация<br/>о заказе</label></span>
                                                    <div class="textarea" style="float: left;">
                                                        <div class="t"><div class="tr"></div></div>
                                                        <div class="l" style="height: 70px;"></div>
                                                        <form:textarea path="details" id="details"
                                                                    cssStyle="width: 241px; height: 70px;"/>
                                                        <div class="r" style="height: 70px;"></div>
                                                        <div style="clear: both;"></div>
                                                        <div class="b"><div class="br"></div></div>
                                                    </div>
                                                    <div style="clear: both;"></div>
                                                </div>
                                                <div class="message">
                                                </div>
                                            </div>
                                            <div style="clear: both;"></div>
                                            <div>
                                                <div style="margin: 15px 0 10px 224px; width: 220px; overflow: hidden;">
                                                    <a class="complete-button blue-button" href="">
                                                        <span class="label">Заказать</span>
                                                        <span class="r"></span>
                                                    </a>
                                                    <div style="margin: 0 auto; width: 45px; display: none;">
                                                        <span class="blue-button-loading"></span>
                                                    </div>
                                                </div>
                                                <input type="submit" value="Оформить заказ" style="display: none;"/>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
	</div>
	<jsp:include page="footer.jsp" />
</div>
<div class="info-msg" title="Информация" style="display: none;">
    <div>
        <p style="padding-top: 12px;">Для оформления заказа выберете товар(-ы) из разделов
           <a href="<%=request.getContextPath()%>/clippers">Машинки</a> или
           <a href="<%=request.getContextPath()%>/parts">Запчасти</a>.</p>
    </div>
</div>
</body>
</html>
