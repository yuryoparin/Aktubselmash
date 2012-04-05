<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--@elvariable id="browserClass" type="java.lang.String"--%>
<%--@elvariable id="productMinPrice" type="java.lang.Integer"--%>
<%--@elvariable id="partMinPrice" type="java.lang.Integer"--%>
<%--@elvariable id="thirdPrice" type="java.lang.Integer"--%>
<%--@elvariable id="homeProductPrice" type="ru.aktubselmash.model.ProductPrice"--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Машинка для стрижки овец от <c:out value="${productMinPrice}"/> руб. Запасные режущие пары от <c:out value="${partMinPrice}"/> руб.</title>
	<meta content="Машинки для стрижки овец VS84-S, LISCOP Super Profi 3000 и советские МСУ-200. Режущие пары - 750р. Продажа по России наложенным платежом или самовывозом." name="description">
	<meta content="машинка +для стрижки овец, машинки +для стрижки овец, куплю машинку +для стрижки овец, машинка +для стрижки овец купить, машинка +для стрижки овец цена, машинка +для стрижки овец продажа, продажа машинок для стрижки овец" name="keywords">
	<meta content="Актюбсельмаш" name="author">

    <link href="<%=request.getContextPath()%>/favicon.ico" rel="shortcut icon"/>
    <link type="image/x-icon" href="<%=request.getContextPath()%>/favicon.ico" rel="icon"/>
    <link media="all" type="text/css" href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet"/>

    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.6.1.min.js"></script>
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
    Машинка для стрижки овец Liscop, Heiniger, "Актюбсельмаш". Ножи, гребенки, запасные части. +7 916 185-06-28, <a href="mailto:info@aktubselmash.ru">info@aktubselmash.ru</a>. Продажа по России наложенным платежом или самовывозом.
</div>
<div id="wrapper">
    <fmt:setLocale value="RU"/>
    <c:set var="selected" value="" scope="request"/>
    <jsp:include page="header.jsp" />
    <jsp:useBean id="now" class="java.util.Date" />
	<div id="content">
        <a href="<%=request.getContextPath()%>/clippers/${homeProductPrice.product.shortName}" style="text-decoration: none;">
            <div class="" style="overflow: hidden; margin-top: 20px; position: relative;">
                <div style="float: left; width: 565px;">
                    <img border="0" alt="Машинка для стрижки овец ${homeProductPrice.product.name}" width="500" height="400"
                         src="<%=request.getContextPath()%>/images/clippers/VS84-S/1b-home.jpg"/>
                </div>
                <div style="float: left; width: 240px; margin: 30px 0 0 0;">
                    <h1 style="margin-left: 0; font-size: 30pt;">${homeProductPrice.product.name}</h1>
                    <ul class="char-ul" style="margin-top: 2em;">
                        <li style="font-size: 12pt; color: #606060;">&mdash; мощность двигателя 320 Вт</li>
                        <li style="font-size: 12pt; color: #606060;">&mdash; вес машинки 1,7 кг</li>
                        <li style="font-size: 12pt; color: #606060;">&mdash; число оборотов в минуту 2800</li>
                        <li style="font-size: 12pt; color: #606060;">&mdash; уровень шума 93 Дб(а)</li>
                        <li style="font-size: 12pt; color: #606060;">&mdash; размеры машинки <br/><span style="padding-left: 1.3em;">(Ш х В х Дл.) 80х90х350 мм</span></li>
                        <li style="font-size: 12pt; color: #606060;">&mdash; диаметр рукоятки 51-57 мм</li>
                    </ul>
                    <div style="text-align: center; margin-top: 2em;">
                        <h1 style="margin-left: 0; color: black;">
                            <c:choose>
                                <c:when test="${homeProductPrice.discount gt 0 and homeProductPrice.discountDueDate.time ge now.time}">
                                    <span class="old-price-s">
                                        <fmt:formatNumber value="${homeProductPrice.price}"/></span>
                                    <fmt:formatNumber value="${homeProductPrice.price - homeProductPrice.discount}"/> руб.
                                </c:when>
                                <c:otherwise>
                                    <fmt:formatNumber value="${homeProductPrice.price}"/> руб.
                                </c:otherwise>
                            </c:choose>
                        </h1>
                        <div style="margin: 10px auto; width: 195px;">
                            <a class="buy-button blue-button" href="<%=request.getContextPath()%>/clippers/vs84-s">
                                <span class="label">Узнать больше →</span>
                                <span class="r"></span>
                            </a>
                            <span style="display: none;" class="blue-button-loading"></span>
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
        </a>
		<div class="ul-list ul-list-many" style="margin-top:20px;">
			<ul>
				<li class="box first">
					<a href="<%=request.getContextPath()%>/clippers" style="text-align: center; position: relative;">
                        <div class="home-tile-text">
                            <h2>Машинки для стрижки овец</h2>
                            <span>от <fmt:formatNumber value="${productMinPrice}"/> руб.</span>
                        </div>
                        <div style="position: absolute; left: 41px; top: 50px;">
                            <img src="<%=request.getContextPath()%>/images/clippers/Liscop/1mm.png" border="0"
                                 width="200" height="183" class="png" alt=""/>
                        </div>
                    </a>
				</li>
				<li class="box">
					<a href="<%=request.getContextPath()%>/parts" style="text-align: center; position: relative;">
                        <div class="home-tile-text">
                            <h2>Ножи и гребенки</h2>
                            <span>от <fmt:formatNumber value="${partMinPrice}"/> руб.</span>
                        </div>
                        <div style="position: absolute; left: 51px; top: 30px;">
                            <img src="<%=request.getContextPath()%>/images/parts/VS84-S/1m.png" border="0"
                             width="200" height="207" class="png" alt=""/>
                        </div>
                    </a>
				</li>
				<li class="box">
					<a href="<%=request.getContextPath()%>/parts/ta-1" style="text-align: center; position: relative;">
                        <div class="home-tile-text">
                            <h2>Точильный аппарат</h2>
                            <span style="margxin-left: -10px;"><fmt:formatNumber value="${thirdPrice}"/> руб.</span>
                        </div>
                        <div style="position: absolute; left: 50px; top: 30px;">
                            <img src="<%=request.getContextPath()%>/images/parts/TA-1/1m.png" border="0"
                                width="200" height="207" class="png" alt=""/>
                        </div>
                    </a>
				</li>
			</ul>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</div>
</body>
</html>