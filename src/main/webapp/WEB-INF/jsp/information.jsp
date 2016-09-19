<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--@elvariable id="browserClass" type="java.lang.String"--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Обращение к посетителям сайта</title>
    <meta content="Обращение к посетителям сайта" name="description">
    <meta content="Актюбсельмаш" name="author">

    <link href="<%=request.getContextPath()%>/favicon.ico" rel="shortcut icon"/>
    <link type="image/x-icon" href="<%=request.getContextPath()%>/favicon.ico" rel="icon"/>
    <link media="all" type="text/css" href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet"/>
    <style type="text/css">
        body { font-size: 12pt; }
        p { margin-bottom: 15px; }

        /*.vertical-ul p {font-size: 15px;}*/
        .vertical-ul li {margin-left: 18px; margin-right: 18px; width: 800px;}
        #content h1 {margin-top: 20px; margin-left: 18px; font-size: 18pt;}
        .cart-table {width: auto;}
        .cart-table th {
            font-weight: normal;
            background: -webkit-gradient(linear, left top, left bottom, from(#507aad), to(#5987C0));
            background: -moz-linear-gradient(center top , #507aad, #5987C0);
            background: -o-linear-gradient(top, #507aad 0%, #5987C0 100%);
        }
        .cart-table tr.even td {background: #e4f4ff;}
        .cart-table td.align-right {text-align: right;}
        .cart-table .tick-icon {
            background: url("<%=request.getContextPath()%>/images/tick.png") no-repeat;
            width: 18px; height: 18px;
            margin: 0 auto;
            display: block;
        }
        .home-icon {float: none;}
    </style>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.12.3.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/main.js"></script>
</head>
<body class="${browserClass}">
<div id="wrapper">
    <c:set var="selected" value="appeal" scope="request"/>
    <c:set var="selectedLink" value="false" scope="request"/>
    <jsp:include page="header.jsp" />
    <div id="content">
        <div class="main-content">
            <div class="box box-container">
                <h1>Уважаемые покупатели машинок для стрижки овец!</h1>
                <div>
                    <ul class="vertical-ul">
                        <li style="-webkit-user-select: none; -moz-user-select: none; -ms-user-select: none;">
                            <%--<p>В последние дни в интернете можно найти необоснованные обвинения в ненадлежащем качестве режущих пар: ножах и гребенках.--%>
                                <%--Чтобы развеять вредные слухи, предоставляем на этой странице максимум информации об изготовлении, использовании и заточке режущих пар.</p>--%>

                            <p>Представленные в нашем магазине режущие пары (ножи и гребенки), также как и ножи всех европейских производителей,
                                выпускающих качественную продукцию, изготавливаются не литьем, а штампуются и вышлифовываются из листовой легированной стали и
                                подвергаются термической обработке (закалке с отпуском), повышающей их прочность и износостойкость.</p>

                            <p>Режущей парой, установленной на машинке для стрижки овец Takumi F7 Professional можно постричь 25–30 овец до переточки, а затем вновь
                                заточить ножи на специальном точильном аппарате или, менее качественно, но с помощью подручных средств, например, круговыми движениями
                                по наждачной бумаге зернистостью от 40 до 80 мкм, разложенной на очень ровной, плоской поверхности. Металл ножей хорошо поддается
                                затачиванию, после этого никакие «концы зубьев» у них не обламываются, ножи остаются прочными и износостойкими.</p>

                            <p>"Родные" ножи наших машинок имеют два отверстия в вершине зубьев, в которые всегда точно садятся конусные выступы вилок, передающие
                                возвратно-поступательные движения ножу.</p>

                            <p>В связи с этим, обратите, пожалуйста, внимание на рекомендации некоторых продавцов машинок AXEL FOX и DIMI устанавливать на эти китайские
                                машинки (а других у них нет, это видно по одинаковым фотографиям вроде бы разных производителей) швейцарские ножи, которые своими
                                отверстиями не совсем точно садятся на конусные выступы вилок у этих машинок. В результате, конусные выступы, как более мягкая деталь
                                контакта, быстро истираются и теряют работоспособность.</p>

                            <p>Что касается информации об ослаблении крепления ножей в процессе стрижки, то эта проблема, видимо возникает у некоторых продавцов машинок
                                с некачественной сборкой. Её можно решить достаточно просто. Дело в том, что ослаблению крепления ножей должно препятствовать разрезное
                                стопорящее кольцо, расположенное на штуцере под нажимной гайкой.</p>

                            <p>При правильном расположении оно разжимается и тормозит раскручивание этой гайки, но не препятствует её закручиванию. Если происходит наоборот,
                                то нужно перевернуть стопорящее кольцо на 180 градусов.</p>

                            <p>Будьте внимательны при выборе магазина.</p>
                            <br>
                            <p>С уважением,</p>
                            <p>Администрация aktubselmash.ru</p>
                            <br>
                            <p><a href="<%=request.getContextPath()%>/" class="home-icon blue" style="color: #08c;">Продолжить покупки →</a></p>
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