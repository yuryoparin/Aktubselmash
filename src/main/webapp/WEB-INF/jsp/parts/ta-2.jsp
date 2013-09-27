<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--@elvariable id="browserClass" type="java.lang.String"--%>
<%--@elvariable id="country" type="java.lang.Boolean"--%>
<%--@elvariable id="productPrice" type="ru.aktubselmash.model.ProductPrice"--%>
<%--@elvariable id="dependantPrices" type="java.util.List<ru.aktubselmash.model.ProductPrice>"--%>
<c:set var="price">
    <c:choose>
        <c:when test="${productPrice.discount gt 0}">${productPrice.price - productPrice.discount}</c:when>
        <c:otherwise>${productPrice.price}</c:otherwise>
    </c:choose>
</c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${productPrice.product.name} - Актюбсельмаш</title>
    <meta content="Станок для заточни режущих пар машинки для стрижки овец - ${price} руб. Продажа по России наложенным платежом или самовывозом." name="description">
    <meta content="заточка режущих пар +для стрижки овец, доводка режущих пар +для стрижки овец" name="keywords">
    <meta content="Актюбсельмаш" name="author">

    <link href="<%=request.getContextPath()%>/favicon.ico" rel="shortcut icon"/>
    <link type="image/x-icon" href="<%=request.getContextPath()%>/favicon.ico" rel="icon"/>
    <link media="all" type="text/css" href="<%=request.getContextPath()%>/css/smoothness/jquery-ui-1.8.13.custom.css" rel="stylesheet"/>
    <link media="all" type="text/css" href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet"/>

    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.6.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-ui-1.8.13.custom.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/main.js"></script>
    <c:if test="${fn:contains(browserClass, 'ie6')}">
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/DD_belatedPNG.js"></script>
    </c:if>
    <script type="text/javascript">
        $(document).ready(function() {
            <c:if test="${fn:contains(browserClass, 'ie6')}">
            DD_belatedPNG.fix('.png');
            </c:if>

            /*var cnt = 1;
            var galInterval = setInterval(function() {
                if (cnt != -1) $($('.gallery-dots span').get(cnt++ % 3)).click();
            }, 5000);

            var blur = false;
            $(window).focus(function() {
                if (blur) {
                    galInterval = setInterval(function() {
                        if (cnt != -1) $($('.gallery-dots span').get(cnt++ % 3)).click();
                    }, 5000);
                    blur = false;
                }
            }).blur(function() {
                        clearInterval(galInterval);
                        blur = true;
                    }).focus();

            $('.gallery-dots span').mousedown(function() {
                if (!$(this).hasClass('active')) cnt = -1;
            });*/
            $('.buy-button').click(function() {
                return buy(${productPrice.product.id}, "<%=request.getContextPath()%>/cart/addPart");
            });
        });
    </script>
</head>
<body class="${browserClass}">
<div title="description" class="se-description" style="display: none;">
    Точильный аппарат ТА-2 предназначен для заточки (доводки) режущих пар
    машинок для стрижки овец, запрос пишите на <a href="mailto:info@aktubselmash.ru">info@aktubselmash.ru</a>
</div>
<div id="wrapper">
    <fmt:setLocale value="RU"/>
    <c:set var="selected" value="parts" scope="request"/>
    <c:set var="selectedLink" value="true" scope="request"/>
    <jsp:include page="../header.jsp" />
    <jsp:useBean id="now" class="java.util.Date" />
    <div id="content">
        <div class="main-content-sidebar">
            <div class="box box-container">
                <h1>${productPrice.product.name}</h1>
                <p>
                <div class="box-heading" style="height: 433px;">
                    <div class="gallery" style="float:left; margin-left: 5px; height: 433px; width: 400px;">
                        <div class="gallery-box" style="width: 400px;">
                            <ul class="gallery-box-ul" style="width: 840px;">
                                <li><img src="<%=request.getContextPath()%>/images/parts/TA-2/1b.jpg" alt="Точильный аппарат для ножей и гребенок" border="0" width="400" height="414"/></li>
                            </ul>
                        </div>
                        <div class="gallery-dots" style="width: 38px;">
                            <span class="active"></span>
                        </div>
                    </div>
                    <div style="float:left; padding-left: 3em;">
                        <h2 style="margin-top: 1em;">Характеристики</h2>
                        <ul class="char-ul">
                            <li>— производительность <br/><span style="padding-left: 1.3em;">не менее 24 реж. пар/ч</span></li>
                            <li>— диаметр дисков 365 мм</li>
                            <li>— вес брутто 52 кг, нетто 40 кг</li>
                            <li>— напряжение 220 В или 3 фазы * 380 В</li>
                            <li>— частота 50 Гц</li>
                            <li>— мощность 750 Вт</li>
                            <li>— число оборотов в минуту 3000</li>
                            <li>— размеры<br/><span style="padding-left: 1.3em;">(Ш х В х Дл.) 620х386х405 мм</span></li>
                        </ul>
                        <div style="text-align: center; margin-top: 2em;">
                            <h1 style="margin-left: 0;">
                                <c:choose>
                                    <c:when test="${country}">
                                        <c:choose>
                                            <c:when test="${productPrice.discount gt 0 and productPrice.discountDueDate.time ge now.time}">
                                                <span class="old-price-s"><fmt:formatNumber value="${productPrice.foreignPrice}"/></span>
                                                <fmt:formatNumber value="${productPrice.foreignPrice - productPrice.foreignDiscount}"/> руб.
                                            </c:when>
                                            <c:otherwise>
                                                <fmt:formatNumber value="${productPrice.foreignPrice}"/> руб.
                                            </c:otherwise>
                                        </c:choose>
                                    </c:when>
                                    <c:otherwise>
                                        <c:choose>
                                            <c:when test="${productPrice.discount gt 0 and productPrice.discountDueDate.time ge now.time}">
                                                <span class="old-price-s"><fmt:formatNumber value="${productPrice.price}"/></span>
                                                <fmt:formatNumber value="${productPrice.price - productPrice.discount}"/> руб.
                                            </c:when>
                                            <c:otherwise>
                                                <fmt:formatNumber value="${productPrice.price}"/> руб.
                                            </c:otherwise>
                                        </c:choose>
                                    </c:otherwise>
                                </c:choose>
                            </h1>
                            <c:choose>
                                <c:when test="${productPrice.product.unavailableFlag}">
                                    <h2 style="padding-top: 10px;">Нет в наличии</h2>
                                </c:when>
                                <c:otherwise>
                                    <div style="margin: 10px auto; width: 110px;">
                                        <a class="buy-button blue-button" href="">
                                            <span class="label">Купить</span>
                                            <span class="r"></span>
                                        </a>
                                        <span style="display: none;" class="blue-button-loading"></span>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <c:choose>
                        <c:when test="${productPrice.product.newFlag}">
                            <div class="corner-en">
                                <img src="<%=request.getContextPath()%>/images/new-l.png" alt="Новинка" border="0" class="png" width="152" height="143"/>
                            </div>
                        </c:when>
                        <c:when test="${productPrice.discount gt 0 and productPrice.discountDueDate.time ge now.time}">
                            <c:set var="date">
                                <fmt:formatDate value="${productPrice.discountDueDate}" pattern="ddMM" />
                            </c:set>
                            <c:if test="${fn:contains(browserClass, 'ie6')}"><br/></c:if>
                            <div class="corner-en">
                                <img src="<%=request.getContextPath()%>/images/discounts/discount-l-${date}.png"
                                     alt="Скидка до <fmt:formatDate value="${productPrice.discountDueDate}" pattern="dd MMM" />"
                                     border="0" width="152" height="143"
                                     class="png "/>
                            </div>
                        </c:when>
                    </c:choose>
                </div>
                </p>
            </div>
            <div class="box box-container" style="margin-top: 1em;">
                <ul class="vertical-ul">
                    <li>
                        <h2>Описание</h2>
                        <p style="margin-top: 12px;">Точильный аппарат ТА-2 предназначен для заточки (доводки) режущих пар
                            к машинкам для стрижки овец.</p>
                        <p>Это новый мощный точильный аппарат с двумя точильными дисками диаметром 365 мм, на которые можно
                        наклеивать сменяемые круги наждачной бумаги. Причем на один диск можно наклеить грубую наждачную бумагу
                        с зернистостью Р40, а на другой - чистовую , с зернистостью Р80. На посадочных штифтах маятника закрепляется
                        затачиваемый нож или гребенка. При одновременном вращении диска и качании маятника вдоль поверхности диска
                        происходит качественная заточка режущих пар со строгой плоскостностью их рабочих поверхностей. В отличие
                        от ТА-1, где в качестве абразивного материала используется шлифовальный порошок, разведенный в смеси масла
                        и керосина и разлетающийся во все стороны при вращении диска, работа на аппарате ТА-2 доставит удовольствие
                        возможностью сохранить чистоту рабочего места.</p>
                        <p>Для умельцев, способных самостоятельно изготовить привод заточного станка, предлагаем по выгодным ценам
                        отдельные детали от ТА-2: точильные диски из алюминия диаметром 365 мм, диски наждачного полотна диаметром
                        370 мм с зернистостью Р40 и Р80, маятник с державкой и тягой, стойку для крепления маятника, защитный кожух,
                        на котором можно без дополнительных доработок закрепить однофазный электродвигатель серии АИСЕ71
                        (смотрите <a href="http://www.moselect.ru/st44.html" target="_blank">здесь</a> и
                            <a href="http://www.kontmotor.ru/index.php?cat=2" target="_blank">здесь</a>) и др. детали.
                        Комплект деталей для сборки станка с одним точильным диском, но без двигателя стоит 14 900 руб. С двумя точильными дисками — 24 900 руб.</p>
                    </li>
                    <li>
                        <h2>Комплектация</h2>
                        <ul class="sc-case-ul">
                            <li class="first">Точильный аппарат с двумя точильными дисками &mdash; 1 шт.</li>
                            <li>Маятник с державкой и регулируемой тягой &mdash; 1 шт.</li>
                            <li>Опорные резиновые ножки &mdash; 4 шт.</li>
                            <li>Двусторонний зажимной диск для наклеивания наждачного полотна &mdash; 1 шт.</li>
                            <li>Нажимной болт с гайкой и шайбой &mdash; 1 комплект.</li>
                            <li>Диск наждачного полотна диаметром 365 мм с зернистостью Р40 и Р80 &mdash; по 1  шт.</li>
                            <li>Гаечный ключ 32 х 36 &mdash; 1 шт.</li>
                            <li>Инструкция &mdash; 1 шт.</li>
                            <li>Тара &mdash; деревянный ящик из фанеры &mdash; 1 шт.</li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <div class="sidebar">
            <div class="portlet">
                <h3>Файлы</h3>
                <div class="content description">
                    <ul class="ul-clean ul-li-mb-1em">
                        <li class="first"><a class="pdf" href="<%=request.getContextPath()%>/files/TA-2_manual_rus.pdf">Инструкция на точильный аппарат ТА-2</a></li>
                    </ul>
                </div>
            </div>
            <div class="portlet">
                <h3><span>Режущие пары</span></h3>
                <div class="content description">
                    <ul class="vertical-d-ul">
                        <c:forEach var="dp" items="${dependantPrices}" varStatus="status">
                            <c:choose>
                                <c:when test="${dp.product.shortName ne 'ta-1'}">
                                    <li <c:if test="${status.first}">class="first"</c:if>>
                                        <c:set var="path">
                                            <c:choose>
                                                <c:when test="${dp.product.partsFlag}">parts</c:when>
                                                <c:otherwise>clippers</c:otherwise>
                                            </c:choose>
                                        </c:set>
                                        <a href="<%=request.getContextPath()%>/${path}/${dp.product.shortName}">
                                            <p style="text-align: center; margin-bottom: 0;">
                                                <img src="<%=request.getContextPath()%>${dp.product.smallImagePath}"
                                                     alt="${dp.product.name}" border="0" class="png" width="100"/>
                                            </p>
                                            <h4 class="name">${dp.product.name}</h4>
                                            <h4 class="price">
                                                <c:choose>
                                                    <c:when test="${country}">
                                                        <c:choose>
                                                            <c:when test="${dp.discount gt 0 and dp.discountDueDate.time ge now.time}">
                                                                <span class="old-price-s" style="font-size: 10pt; color: #808080;"><fmt:formatNumber value="${dp.foreignPrice}"/></span>
                                                                <fmt:formatNumber value="${dp.foreignPrice - dp.foreignDiscount}"/> руб.
                                                            </c:when>
                                                            <c:otherwise>
                                                                <fmt:formatNumber value="${dp.foreignPrice}"/> руб.
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:choose>
                                                            <c:when test="${dp.discount gt 0 and dp.discountDueDate.time ge now.time}">
                                                                <span class="old-price-s" style="font-size: 10pt; color: #808080;"><fmt:formatNumber value="${dp.price}"/></span>
                                                                <fmt:formatNumber value="${dp.price - dp.discount}"/> руб.
                                                            </c:when>
                                                            <c:otherwise>
                                                                <fmt:formatNumber value="${dp.price}"/> руб.
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:otherwise>
                                                </c:choose>
                                            </h4>
                                        </a>
                                            <%--<c:choose>--%>
                                            <%--<c:when test="${dp.product.newFlag}">--%>
                                            <%--<div class="corner-en">--%>
                                            <%--<img src="<%=request.getContextPath()%>/images/new-s.png" alt="Новинка" border="0"/>--%>
                                            <%--</div>--%>
                                            <%--</c:when>--%>
                                            <%--<c:when test="${dp.discount gt 0}">--%>
                                            <%--<div class="corner-en">--%>
                                            <%--<img src="<%=request.getContextPath()%>/images/discount-s.png"--%>
                                            <%--alt="Скидка до <fmt:formatDate value="${dp.discountDueDate}" pattern="dd MMM" />"--%>
                                            <%--border="0"/>--%>
                                            <%--</div>--%>
                                            <%--</c:when>--%>
                                            <%--</c:choose>--%>
                                    </li>
                                </c:when>
                            </c:choose>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../footer.jsp" />
</div>
<jsp:include page="../error-msg.jsp" />
</body>
</html>