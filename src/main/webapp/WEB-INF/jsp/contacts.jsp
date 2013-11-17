<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--@elvariable id="browserClass" type="java.lang.String"--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Контакты</title>
	<meta content="Как с нами связаться или найти нас в Москве" name="description">
	<meta content="машинка +для стрижки овец телефон, машинки +для стрижки овец адрес" name="keywords">
	<meta content="Актюбсельмаш" name="author">

	<link href="<%=request.getContextPath()%>/favicon.ico" rel="shortcut icon"/>
	<link type="image/x-icon" href="<%=request.getContextPath()%>/favicon.ico" rel="icon"/>
	<link media="all" type="text/css" href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet"/>

	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.6.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/main.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.address-1.4.min.js"></script>
    <script src="http://api-maps.yandex.ru/1.1/index.xml?key=AEoYPkwBAAAAcdnWeAIAgkVxYbS9XhLYW0Jvnydfc1wQMtEAAAAAAAAAAAAXTI5SX-cONtQXc02wNGraLSNr7Q==" type="text/javascript"></script>
    <c:if test="${fn:contains(browserClass, 'ie6')}">
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/DD_belatedPNG.js"></script>
    </c:if>
    <script type="text/javascript">
        var map, placemark1, placemark2;
        $(document).ready(function() {
            <c:if test="${fn:contains(browserClass, 'ie6')}">
                DD_belatedPNG.fix('.num');
            </c:if>

            map = new YMaps.Map(YMaps.jQuery("#y-map")[0]);
            map.addControl(new YMaps.TypeControl());
            map.addControl(new YMaps.ToolBar());
            map.addControl(new YMaps.Zoom());
            map.addControl(new YMaps.ScaleLine());

            placemark1 = new YMaps.Placemark(new YMaps.GeoPoint(37.6248, 55.7539));
            placemark1.name = "Актюбсельмаш в Центре";
            placemark1.description = "г. Москва, ул. Ильинка д. 4, подъезд 5";
            map.addOverlay(placemark1);

            placemark2 = new YMaps.Placemark(new YMaps.GeoPoint(37.7479, 55.6980));
            placemark2.name = "Актюбсельмаш на ст. м. «Текстильщики»";
            placemark2.description = "г. Москва, ул. 7-я Текстильщиков д. 5, подъезд 3";
            map.addOverlay(placemark2);

            map.setCenter(new YMaps.GeoPoint(37.64, 55.76), 11);

            showLocation();
            $.address.change(function(event) { showLocation(); });
        });

        function showLocation() {
            var hash = window.location.hash;
            if (hash == '#1') {
                map.setCenter(new YMaps.GeoPoint(37.6248, 55.7539), 15);
                placemark1.openBalloon();
            } else if (hash == '#2') {
                map.setCenter(new YMaps.GeoPoint(37.7479, 55.6980), 14);
                placemark2.openBalloon();
            }
        }
    </script>
</head>
<body class="${browserClass}">
<div title="description" class="se-description" style="display: none;">
    г. Москва, ул. Ильинка д. 4 подъезд 5 или ул. 7-я Текстильщиков д. 5, подъезд 3 / +7 916 185-06-28 / <a href="mailto:info@aktubselmash.ru">info@aktubselmash.ru</a>
</div>
<div id="wrapper">
    <c:set var="selected" value="contacts" scope="request"/>
    <c:set var="selectedLink" value="false" scope="request"/>
    <jsp:include page="header.jsp" />
	<div id="content">
        <div class="main-content">
            <div class="box box-container">
                <h1>Контакты</h1>
                <div style="overflow: hidden; margin-bottom: 1em;">
                    <div style="width: 360px; float: left;">
                        <ul class="vertical-ul contacts-ul">
                            <li>
                                <div class="num"><span>1</span></div>
                                <div class="address">
                                    <a href="#1" class="dashed">В Центре</a>
                                    <p>г. Москва, ул. Ильинка д. 4, подъезд 5<br/>
                                       &#9742; +7 916 185-06-28<br/>
                                       <span style="font-size: 12pt;">&#x231A;</span> 9:00&ndash;18:00 пн.&ndash;пт.<br/>
                                       Виталий Константинович
                                    </p>
                                </div>
                            </li>
                            <li>
                                <div class="num"><span>2</span></div>
                                <div class="address">
                                    <a href="#2" class="dashed">м. Текстильщики</a>
                                    <p>г. Москва, ул. 7-я Текстильщиков д. 5, подъезд 3<br/>
                                       &#9742; +7 916 185-06-28, +7 499 176-83-64<br/>
                                       <span style="font-size: 12pt;">&#x231A;</span> 19:00&ndash;21:00 пн.&ndash;пт., 9:00&ndash;21:00 сб.&ndash;вс.<br/>
                                       Виталий Константинович
                                    </p>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div id="y-map" style="width: 520px; height: 490px; float: left;">
                    </div>
                </div>
            </div>
        </div>
	</div>
	<jsp:include page="footer.jsp" />
</div>
</body>
</html>