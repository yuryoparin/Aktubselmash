<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--@elvariable id="browserClass" type="java.lang.String"--%>
<%--@elvariable id="cart" type="ru.aktubselmash.model.Cart"--%>
<%--@elvariable id="basket" type="ru.aktubselmash.model.Cart"--%>
<%--@elvariable id="exception" type="java.lang.Boolean"--%>
<%--@elvariable id="exceptionMessage" type="java.lang.String"--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Корзина - Актюбсельмаш</title>
	<meta content="Корзина, оформление заказа" name="description">
	<meta content="машинка +для стрижки овец, машинки +для стрижки овец, корзина, оформление заказа" name="keywords">
	<meta content="Актюбсельмаш" name="author">

	<link href="<%=request.getContextPath()%>/favicon.ico" rel="shortcut icon"/>
	<link type="image/x-icon" href="<%=request.getContextPath()%>/favicon.ico" rel="icon"/>
	<link media="all" type="text/css" href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet"/>

	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.6.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/main.js"></script>
</head>
<body class="${browserClass}">
<div id="wrapper">
    <c:set var="selected" value="" scope="request"/>
    <jsp:include page="header.jsp" />
	<div id="content">
        <div class="main-content">
            <div class="box box-container">
                <h1>Корзина</h1>
                <div class="description">
                    <c:choose>
                        <c:when test="${exception}">
                            <p>При обработке заказа возникла <span style="color: red; font-weight: bold;">ошибка:</span></p>
                            <p style="background: white; padding: 6px; border: 1px solid #ccc; font-family: Monospace;">
                                <c:out value="${exceptionMessage}"/></p>
                            <p style="margin-top: 10px;">Попробуйте повторить попытку позднее либо позвоните <strong>по тел.
                               +7 916 185-06-28</strong> или напишите на <a href="mailto:info@aktubselmash.ru">info@aktubselmash.ru</a>
                               для оформления заказа.</p>
                            <p>Просим извинения за неудобства.</p>
                        </c:when>
                        <c:otherwise>
                            <h2 style="margin: 5px 0;">Ваш заказ №<c:out value="${basket.id}"/> принят.</h2>
                            <p>В ближайшее время мы свяжемся с вами для уточнения способа оплаты и доставки заказа.
                               <c:if test="${not empty basket.client.email}">
                                Также на указанную эл. почту <c:out value="${basket.client.email}"/> выслано письмо
                               с описанием заказа.</c:if></p>
                            <p>Спасибо!</p>
                        </c:otherwise>
                    </c:choose>
                    <p style="margin-top: 15px;">
                        <a href="<%=request.getContextPath()%>/home">Вернуться на главную страницу</a>
                    </p>
                </div>
            </div>
        </div>
	</div>
	<jsp:include page="footer.jsp" />
</div>
</body>
</html>