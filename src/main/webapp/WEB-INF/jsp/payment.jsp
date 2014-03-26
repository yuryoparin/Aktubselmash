<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--@elvariable id="browserClass" type="java.lang.String"--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Оплата</title>
	<meta content="Оплата машинки для стрижки овец" name="description">
	<meta content="машинка +для стрижки овец +оплата, машинки +для стрижки овец +оплата, куплю машинку +для стрижки овец" name="keywords">
	<meta content="Актюбсельмаш" name="author">

	<link href="<%=request.getContextPath()%>/favicon.ico" rel="shortcut icon"/>
	<link type="image/x-icon" href="<%=request.getContextPath()%>/favicon.ico" rel="icon"/>
	<link media="all" type="text/css" href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet"/>

	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.6.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/main.js"></script>
</head>
<body class="${browserClass}">
<div title="description" class="se-description" style="display: none;">
    Оплата за наличный расчет, наложенным платежом, переводом &laquo;БЛИЦ&raquo; и на карту Maestro MOMENTUM,
    &laquo;ФОРСАЖ&raquo; во многих отделениях почты России, банковским переводом.
    Ваши реквизиты для выставления счета необходимо сообщить на эл. почту: <a href="mailto:info@aktubselmash.ru">info@aktubselmash.ru</a>
</div>
<div id="wrapper">
    <c:set var="selected" value="payment" scope="request"/>
    <c:set var="selectedLink" value="false" scope="request"/>
    <jsp:include page="header.jsp" />
	<div id="content">
        <div class="main-content">
            <div class="box box-container">
                <h1>Оплата</h1>
                <div>
                    <ul class="vertical-ul">
                        <li>
                            <h2>За наличный расчет</h2>
                            <p>Производится в случае самовывоза из Москвы. Отсутствует комиссия за перевод денег.
                               Стоимость доставки по Москве &mdash; 350 руб. (но не далее 7 мин пешком от станции метро).
                            </p>
                        </li>
                        <li>
                            <h2>Наложенным платежом</h2>
                            <p>Оплата наложенным платежом производится курьеру почты EMS после доставки машинки на Ваш адрес.
                            Комиссия за перевод суммы от 5000 до 20000 руб. составит 217 руб. + 2% от суммы перевода, превышающей 5000 руб.</p>
                        </li>
                        <li>
                            <h2>Переводом &laquo;БЛИЦ&raquo; в любом отделении Сбербанка РФ</h2>
                            <p>Комиссия составит 1,75% от суммы перевода. Перевод необходимо выполнить на имя:<br/>
                            ОПАРИН ВИТАЛИЙ КОНСТАНТИНОВИЧ<br/>
                            паспорт 45 04 180464, выдан ОВД "ТЕКСТИЛЬЩИКИ" гор. Москвы, 22.10.2002 года.</p>
                        </li>
                        <li>
                            <h2>Переводом &laquo;ФОРСАЖ&raquo; во многих отделениях почты России</h2>
                            <p>Комиссия составит 1,7% от суммы перевода. Перевод необходимо выполнить на имя:<br/>
                                ОПАРИН ВИТАЛИЙ КОНСТАНТИНОВИЧ<br/>
                                паспорт 45 04 180464, выдан ОВД "ТЕКСТИЛЬЩИКИ" гор. Москвы, 22.10.2002 года.</p>
                        </li>
                        <li>
                            <h2>Переводом на платежную карточку Maestro MOMENTUM в любом отделении Сбербанка РФ</h2>
                            <p>Сумма перевода увеличится на 0,75%.
                            Перевод необходимо выполнить на карточку Сбербанка РФ (Московский банк) Maestro MOMENTUM номер: 676196000472859744
                            на имя: ОПАРИН ВИТАЛИЙ КОНСТАНТИНОВИЧ</p>
                        </li>
                        <li>
                            <h2>Банковским переводом</h2>
                            <p>Сумма перевода увеличится на 5% + 750 руб.
                                Ваши реквизиты для выставления счета необходимо сообщить на эл. почту:
                            <a href="mailto:info@aktubselmash.ru">info@aktubselmash.ru</a></p>
                            <p>Наши реквизиты:</p>
                            <p><span>Индивидуальный предприниматель Опарин Виталий Константинович ОГРНИП 309774612500730 от 05.05.2009г.,</span><br/>
                               <span>Юридический и почтовый адрес: 109263 г. Москва, ул. 7-я Текстильщиков д. 5 кв. 27, тел. 8-916-185-0628</span><br/>
                               <span>ИНН 772135049093 \ КПП -, ОКПО 0116815299,</span><br/>
                               <span>р/с 40802810022000017748 в АКБ "АБСОЛЮТ БАНК" (ЗАО) , г. МОСКВА , БИК 044525976 , корр/с 30101810500000000976</span></p>
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