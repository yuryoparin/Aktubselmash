<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--@elvariable id="browserClass" type="java.lang.String"--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Доставка</title>
	<meta content="Доставка машинки для стрижки овец по России или самовывозом." name="description">
	<meta content="машинка +для стрижки овец доставка, машинки +для стрижки овец доставка" name="keywords">
	<meta content="Актюбсельмаш" name="author">

	<link href="<%=request.getContextPath()%>/favicon.ico" rel="shortcut icon"/>
	<link type="image/x-icon" href="<%=request.getContextPath()%>/favicon.ico" rel="icon"/>
	<link media="all" type="text/css" href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet"/>

	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.6.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/main.js"></script>
</head>
<body class="${browserClass}">
<div title="description" class="se-description" style="display: none;">
    Доставка машинки для стрижки овец по России или самовывозом. Самовывозом - бесплатно. Стоимость доставки по Москве 350 руб. Почтой EMS, Почтой России,
    Транспортной компанией "ПЭК" или "Энергия". Тарифы на сайтах компаний или пишите на <a href="mailto:info@aktubselmash.ru">info@aktubselmash.ru</a>
</div>
<div id="wrapper">
    <c:set var="selected" value="shipping" scope="request"/>
    <c:set var="selectedLink" value="false" scope="request"/>
    <jsp:include page="header.jsp" />
	<div id="content">
        <div class="main-content">
            <div class="box box-container">
                <h1>
                    <span style="float: left;">Доставка</span>
                    <a href="<%=request.getContextPath()%>/cart" class="cart-icon blue" style="color: #08c;">Мой заказ →</a>
                    <div style="clear: both;"></div>
                </h1>
                <div>
                    <ul class="vertical-ul">
                        <li>
                            <h2>Самовывозом</h2>
                            <p>Отгрузка машинок производится с <a href="<%=request.getContextPath()%>/contacts">3-х пунтов продажи</a> в Москве
                               после предварительного звонка по контактному тел.: +7 916 185-06-28
                            </p>
                        </li>
                        <li>
                            <h2>По Москве</h2>
                            <p>Стоимость доставки по Москве возле станции метро от 450 до 550 руб. в зависимости от удалённости от наших пунктов продажи.</p>
                        </li>
                        <li>
                            <h2>Почтой EMS</h2>
                            <p>В города и сельскую местность России быстро и недорого отправка производится наложенным
                               платежом экспресс-почтой ЕМS России (через обычные почтовые отделения) с доставкой
                               курьером до Ваших дверей и последующей оплатой почтовым переводом.
                               Рассчитать примерную стоимость и срок доставки почтой EMS можно воспользовавшись <a href="http://emspost.ru" target="_blank">калькулятором</a>.
                               Обычно вес отправляемой посылки с машинкой и запасной парой в кейсе составляет примерно 3,5–4 кг.
                                Оплата увеличивается на стоимость упаковки и доставки до центрального отделения в Москве.</p>
                        </li>
                        <li>
                            <h2>Почтой России</h2>
                            <p>Осуществляем доставку наложенным платежом Почтой России. Рассчитать примерную стоимость доставки можно воспользовавшись
                               <a href="http://russianpostcalc.ru/" target="_blank">калькулятором</a>, указав индекс отправления 101000, вес отправляемой посылки с
                               машинкой и запасной парой в кейсе примерно 3,5–4 кг и объявленную ценность из стоимости в <a href="<%=request.getContextPath()%>/cart">Моем заказе</a>.
                                Оплата увеличивается на стоимость упаковки и доставки до центрального почтового отделения в Москве.
                            </p>

                            <%--<p>Отправка обычными посылками стоит дешевле, если производится после предварительной оплаты.</p>--%>
                            <%--<p>При заказе товара на сумму свыше 10 000 руб. и при 100% <a href="<%=request.getContextPath()%>/payment">предоплате</a> на карточку Сбербанка РФ или--%>
                               <%--денежным переводом любой платежной системой, доставка товара по России осуществляется бесплатно.</p>--%>
                            <%--<p>При отправке наложенным платежом стоимость доставки становится равной стоимости отправки--%>
                               <%--почтой EMS из-за более высокой стоимости страховки.</p>--%>
                            <%--При этом срок доставки посылки заметно--%>
                               <%--увеличивается.</p>--%>
                        </li>
                        <li>
                            <h2>Транспортной компанией &laquo;ПЭК&raquo; и &laquo;Энергия&raquo;</h2>
                            <p>Производится отправка машинок <a href="<%=request.getContextPath()%>/clippers/f7">Takumi F7 Professional</a>,
                                <a href="<%=request.getContextPath()%>/clippers/liscop-sp-3000">Liscop Super Profi 3000</a> и
                                крупногабаритных грузов типа <a href="<%=request.getContextPath()%>/clippers/asu-1">АСИ-101</a>,
                                <a href="<%=request.getContextPath()%>/clippers/esa-1d">ЭСА-1Д</a> и
                                <a href="<%=request.getContextPath()%>/parts/ta-2">Точильный аппарат ТА-2</a>
                                после предварительной оплаты всего заказа.
                               Оплата увеличивается на стоимость упаковки и доставки до склада транспортной компании в Москве.</p>
                        </li>
                      <li>
                          <h2>Другие способы</h2>
                          <p>По договоренности покупателя с водителем автобуса или проводником поезда,
                             следующего из пункта нахождения покупателя в Москву и обратно.</p>
                      </li>
                    </ul>
                </div>
            </div>
        </div>
	</div>
	<jsp:include page="footer.jsp" />
</div>
</body>
</html>