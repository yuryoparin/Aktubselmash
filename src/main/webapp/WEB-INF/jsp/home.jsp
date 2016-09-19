<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--@elvariable id="browserClass" type="java.lang.String"--%>
<%--@elvariable id="country" type="java.lang.Boolean"--%>
<%--@elvariable id="productMinPrice" type="java.lang.Integer"--%>
<%--@elvariable id="partMinPrice" type="java.lang.Integer"--%>
<%--@elvariable id="thirdPrice" type="java.lang.Integer"--%>
<%--@elvariable id="homeProductPrice" type="ru.aktubselmash.model.ProductPrice"--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Машинка для стрижки овец от <c:out value="${productMinPrice}"/> руб. Режущие пары от <c:out value="${partMinPrice}"/> руб.</title>
	<meta content="Машинки для стрижки овец Takumi F7, VS84-S, Liscop Super Profi 3000 и советские МСУ-200. Режущие пары — 1400р. Продажа по России наложенным платежом или самовывозом." name="description">
	<meta content="машинка +для стрижки овец, машинки +для стрижки овец, куплю машинку +для стрижки овец, машинка +для стрижки овец купить, машинка +для стрижки овец цена, машинка +для стрижки овец продажа, продажа машинок для стрижки овец" name="keywords">
	<meta content="Актюбсельмаш" name="author">

    <link href="<%=request.getContextPath()%>/favicon.ico" rel="shortcut icon"/>
    <link type="image/x-icon" href="<%=request.getContextPath()%>/favicon.ico" rel="icon"/>
    <link media="all" type="text/css" href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet"/>
    <link rel="canonical" href="http://aktubselmash.ru"/>

    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.12.3.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/main.js"></script>
    <c:if test="${fn:contains(browserClass, 'ie6')}">
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/DD_belatedPNG.js"></script>
    </c:if>
    <script type="text/javascript">
        $(document).ready(function() {
            <c:if test="${fn:contains(browserClass, 'ie6')}">
                DD_belatedPNG.fix('.png');
            </c:if>
        });
    </script>
</head>
<body class="${browserClass}">
<div title="description" class="se-description" style="display: none;">
    Машинка для стрижки овец Takumi F7, VS84-S, Liscop Super Profi 3000 и советские МСУ-200 производства завода &laquo;Актюбсельмаш&raquo;. Ножи, гребенки, запасные части. Продажа по России наложенным платежом или самовывозом. +7 916 185-06-28, <a href="mailto:info@aktubselmash.ru">info@aktubselmash.ru</a>.
</div>
<div id="wrapper">
    <fmt:setLocale value="RU"/>
    <c:set var="selected" value="" scope="request"/>
    <jsp:include page="header.jsp" />
    <jsp:useBean id="now" class="java.util.Date" />
	<div id="content">
        <%--<a href="<%=request.getContextPath()%>/clippers/${homeProductPrice.product.shortName}" style="text-decoration: none;">--%>
            <div class="" style="overflow: hidden; margin-top: 5px; position: relative; width: 900px;">
                <div style="float: left; width: 548px;">
                    <img border="0" alt="Машинка для стрижки овец ${homeProductPrice.product.name}" width="500" height="400"
                         src="<%=request.getContextPath()%>/images/clippers/F7/1b-home.jpg"/>
                </div>
                <div style="float: left; width: 250px; margin: 20px 0 0 0;">
                    <h1 style="margin-left: 17px; font-size: 30pt;">${homeProductPrice.product.name}</h1>
                    <ul class="char-ul" style="margin-top: 1.5em; margin-left: 0;">
                        <li style="font-size: 12pt; color: #606060;">&mdash; мощность двигателя 380 Вт</li>
                        <li style="font-size: 12pt; color: #606060;">&mdash; вес машинки 1,4 кг</li>
                        <li style="font-size: 12pt; color: #606060;">&mdash; число оборотов в минуту 2800</li>
                        <li style="font-size: 12pt; color: #606060;">&mdash; уровень шума 80 Дб(а)</li>
                        <li style="font-size: 12pt; color: #606060;">&mdash; размеры машинки <br/><span style="padding-left: 1.3em;">(Ш х В х Дл.) 80х95х325 мм</span></li>
                        <li style="font-size: 12pt; color: #606060;">&mdash; диаметр рукоятки 57 мм</li>
                    </ul>
                    <div style="text-align: center; margin-top: 1.5em;">
                        <h1 style="margin-left: 0; color: black;">
                            <c:choose>
                                <c:when test="${country}">
                                    <c:choose>
                                        <c:when test="${homeProductPrice.discount gt 0 and homeProductPrice.discountDueDate.time ge now.time}">
                                            <span class="old-price-s"><fmt:formatNumber value="${homeProductPrice.foreignPrice}"/></span>
                                            <fmt:formatNumber value="${homeProductPrice.foreignPrice - homeProductPrice.foreignDiscount}"/> руб.
                                        </c:when>
                                        <c:otherwise>
                                            <fmt:formatNumber value="${homeProductPrice.foreignPrice}"/> руб.
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>
                                <c:otherwise>
                                    <c:choose>
                                        <c:when test="${homeProductPrice.discount gt 0 and homeProductPrice.discountDueDate.time ge now.time}">
                                            <span class="old-price-s"><fmt:formatNumber value="${homeProductPrice.price}"/></span>
                                            <fmt:formatNumber value="${homeProductPrice.price - homeProductPrice.discount}"/> руб.
                                        </c:when>
                                        <c:otherwise>
                                            <fmt:formatNumber value="${homeProductPrice.price}"/> руб.
                                        </c:otherwise>
                                    </c:choose>
                                </c:otherwise>

                            </c:choose>
                        </h1>
                        <span style="color: red; font-weight: bold;">+ запасная режущая пара в подарок!</span>
                        <div style="margin: 15px auto; width: 228px;">
                            <a class="buy-button blue-button" href="<%=request.getContextPath()%>/clippers">
                                <span class="label" style="padding-left: 10px;">Смотреть все машинки <span style="font-weight: normal;">&rarr;</span></span>
                                <span class="r" style="width: 10px;"></span>
                            </a>
                        </div>
                    </div>
                </div>
                <c:choose>
                    <c:when test="${homeProductPrice.product.newFlag}">
                        <div class="corner-en">
                            <img src="<%=request.getContextPath()%>/images/new-l.png" alt="Новинка" border="0" class="png" width="152" height="143"/>
                        </div>
                    </c:when>
                    <c:when test="${homeProductPrice.discount gt 0 and homeProductPrice.discountDueDate.time ge now.time}">
                        <c:set var="date">
                            <fmt:formatDate value="${homeProductPrice.discountDueDate}" pattern="ddMM" />
                        </c:set>
                        <c:if test="${fn:contains(browserClass, 'ie6')}"><br/></c:if>
                        <div class="corner-en">
                            <img src="<%=request.getContextPath()%>/images/discounts/discount-l-${date}.png"
                                 alt="Скидка до <fmt:formatDate value="${homeProductPrice.discountDueDate}" pattern="dd MMM" />"
                                 border="0" width="152" height="143"
                                 class="png"/>
                        </div>
                    </c:when>
                </c:choose>
            </div>
        <%--</a>--%>
		<div class="ul-list ul-list-many" style="margin-top:20px;">
			<ul>
				<li class="box first">
                    <div class="superlink">
                        <div style="position: absolute; left: 41px; top: 65px;">
                            <img src="<%=request.getContextPath()%>/images/clippers/Liscop/1mm.png" border="0"
                                 width="200" height="183" class="png" alt=""/>
                        </div>
                        <div class="home-tile-text">
                            <h2>Машинки для стрижки овец</h2>
                            <span>от <fmt:formatNumber value="${productMinPrice}"/> руб.</span>
                        </div>
                        <div style="margin-top: 3px; position: relative;"><a href="<%=request.getContextPath()%>/clippers">Выбрать &rarr;</a></div>
                    </div>
				</li>
				<li class="box">
                    <div class="superlink">
                        <div style="position: absolute; left: 51px; top: 50px;">
                            <img src="<%=request.getContextPath()%>/images/parts/VS84-S/1m.png" border="0"
                                 width="200" height="207" class="png" alt=""/>
                        </div>
                        <div class="home-tile-text">
                            <h2>Ножи и гребенки</h2>
                            <span>от <fmt:formatNumber value="${partMinPrice}"/> руб.</span>
                        </div>
                        <div style="margin-top: 3px; position: relative;"><a href="<%=request.getContextPath()%>/parts">Выбрать &rarr;</a></div>
                    </div>
				</li>
				<li class="box">
                    <div class="superlink">
                        <div style="position: absolute; left: 55px; top: 30px;">
                            <img src="<%=request.getContextPath()%>/images/parts/TA-1/1m.png" border="0"
                                 width="200" height="207" class="png" alt=""/>
                        </div>
                        <div class="home-tile-text">
                            <h2>Точильный аппарат</h2>
                            <span style="margin-left: -10px;"><fmt:formatNumber value="34000"/> руб.</span>
                        </div>
                        <div style="margin-top: 3px; position: relative;"><a href="<%=request.getContextPath()%>/parts/ta-1">Заказать &rarr;</a></div>
                    </div>
				</li>
			</ul>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</div>
</body>
</html>