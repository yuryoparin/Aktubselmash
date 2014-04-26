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
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.6.1.min.js"></script>
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
                <h1>Уважаемые посетители!</h1>
                <div>
                    <ul class="vertical-ul">
                        <li>
                            <%--<h2>За наличный расчет</h2>--%>
                            <p>В последние дни в интернете можно найти необоснованные обвинения в адрес нашего магазина.
                                Чтобы развеять вредные слухи, предоставляем на этой странице максимум информации о нашем магазине и продукции.</p>
                            <p>Наша компания существует на рынке с 2002 года и поставляет российским фермерам оборудование для стрижки овец
                                легендарного завода &laquo;Актюбсельмаш&raquo;, на котором в прошлом работал в качестве ведущего специалиста
                                владелец нашего интернет-магазина Виталий Константинович Опарин.</p>
                            <p>Мы реализуем уникальную продукцию этого завода (<a href="<%=request.getContextPath()%>/clippers/asi-101">АСИ-101</a>,
                                <a href="<%=request.getContextPath()%>/clippers/esa-1d">ЭСА-1Д</a>, <a href="<%=request.getContextPath()%>/parts/msu-200">МСУ-200</a>),
                                которая не представлена на сайтах наших конкурентов, в чём вы легко можете убедиться, внимательно изучая списки товаров на их сайтах.</p>
                            <p>С 2010 года на нашем сайте появились современные портативные машинки <a href="<%=request.getContextPath()%>/clippers/vs84-s">VS84-S</a>,
                                <a href="<%=request.getContextPath()%>/clippers/f7">Takumi F7 Professional</a> и
                                <a href="<%=request.getContextPath()%>/clippers/liscop-sp-3000">Liscop Super Profi 3000</a>.</p>
                            <p>У оригинальных машинок Takumi F7 Professional рукоятки тёмно-синие, как представлено на нашем сайте.
                               Поэтому дешёвые китайские машинки легко отличить по цвету рукоятки (красные, тёмно-зелёные).</p>
                            <p>Подробное описание всех машинок вы можете найти на нашем сайте в разделе <a href="<%=request.getContextPath()%>/clippers">Машинки для стрижки овец</a>.</p>
                            <p>Также мы продаём запасные режущие пары разных стран-изготовителей, главной характеристикой которых является количество овец,
                                которое можно постричь режущей парой до заточки.</p>
                            <table class="cart-table">
                                <thead>
                                    <tr>
                                        <th width="132" class="first">Производитель</th>
                                        <th width="60">Количество овец</th>
                                        <th width="115" class="last">Наличие насечек на ножах*</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="odd">
                                        <td>Heiniger (Швейцария), Lister (Германия)</td>
                                        <td class="align-right">50&ndash;80</td>
                                        <td></td>
                                    </tr>
                                    <tr class="even">
                                        <td>&laquo;Актюбсельмаш&raquo;</td>
                                        <td class="align-right">30</td>
                                        <td><span class="tick-icon"></span></td>
                                    </tr>
                                    <tr class="odd">
                                        <td>Китай</td>
                                        <td class="align-right">25&ndash;30</td>
                                        <td></td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr><td colspan="3"></td></tr>
                                </tfoot>
                            </table>
                            <br>
                            <p>* Насечки на ножах служат для лучшего захвата шерсти при стрижке.</p>
                            <p>Ножи всех производителей изготавливаются не литьём, а штампуются из листовой стали с различными легирующими добавками, повышающими прочность и износостойкость.</p>
                            <p>На данный момент на нашем сайте представлены <a href="<%=request.getContextPath()%>/parts">режущие пары</a> производства Китая, Германии и завода &laquo;Актюбсельмаш&raquo;.</p>
                            <p>Напоследок хотелось бы добавить, что в наши дни никто не может являться официальным представителем завода &laquo;Актюбсельмаш&raquo;, поскольку завод закрылся в 1994 году.
                                Только благодаря налаженным деловым связям нам удаётся на выгодных условиях осуществлять поставки оставшегося оборудования производства &laquo;Актюбсельмаш&raquo;.</p>
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