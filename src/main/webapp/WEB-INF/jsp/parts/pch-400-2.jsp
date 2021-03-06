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
	<title>${productPrice.product.name}</title>
	<meta content="Преобразователь частотный 400 Вт для стрижки овец ${productPrice.product.name} - ${price} руб. Продажа по России наложенным платежом или самовывозом." name="description">
	<meta content="преобразователь +для стрижки овец пч-400-2, куплю преобразователь +для стрижки овец пч-400-2, преобразователь +для стрижки овец пч-400-2 купить, преобразователь +для стрижки овец пч-400-2 цена" name="keywords">
	<meta content="Актюбсельмаш" name="author">

	<link href="<%=request.getContextPath()%>/favicon.ico" rel="shortcut icon"/>
	<link type="image/x-icon" href="<%=request.getContextPath()%>/favicon.ico" rel="icon"/>
	<link media="all" type="text/css" href="<%=request.getContextPath()%>/css/smoothness/jquery-ui-1.8.13.custom.css" rel="stylesheet"/>
	<link media="all" type="text/css" href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet"/>

	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.12.3.min.js"></script>
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

            var cnt = 1;
            var galInterval = setInterval(function() {
                if (cnt != -1) $($('.gallery-dots span').get(cnt++ % 3)).click();
            }, 5000);

            var blur = false;
            $(window).blur(function() {
                clearInterval(galInterval);
                blur = true;
            }).focus(function() {
                if (blur) {
                    galInterval = setInterval(function() {
                        if (cnt != -1) $($('.gallery-dots span').get(cnt++ % 3)).click();
                    }, 5000);
                    blur = false;
                }
            });

            setTimeout(function() { $(window).focus(); }, 0);

            $('.gallery-dots span').mousedown(function() {
                if (!$(this).hasClass('active')) cnt = -1;
            });
            $('.buy-button').click(function() {
                return buy(${productPrice.product.id}, "<%=request.getContextPath()%>/cart/addPart");
            });
        });
    </script>
</head>
<body class="${browserClass}">
<div title="description" class="se-description" style="display: none;">
    Преобразователь частотный предназначен для питания двух машинок
    для стрижки овец и может подключаться к обычной сети переменного тока 220 В/50 Гц
    или 48 Вольт постоянного тока, для заказа пишите на <a href="mailto:info@aktubselmash.ru">info@aktubselmash.ru</a>
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
                                <ul class="gallery-box-ul" style="width: 420px;">
                                    <li><img src="<%=request.getContextPath()%>/images/clippers/PCH-400-2/1b.jpg" alt="Стрижка овец ${productPrice.product.name}" border="0" width="400" height="414"/></li>
                                </ul>
                            </div>
                            <div class="gallery-dots" style="width: 16px;">
                                <span class="active"></span>
                            </div>
                        </div>
                        <div style="float:left; padding-left: 3em;">
                            <h2 style="margin-top: 1em;">Характеристики</h2>
                            <ul class="char-ul">
                                <li>— мощность двигателя 400 Вт</li>
                                <li>— вес 1,5 кг</li>
                                <li>— входное напряжение 220-230 В</li>
                                <li>— выходное напряжение 36 В</li>
                                <li>— выходная частота тока 200 Гц</li>
                                <li>— частота тока на входе 50 Гц</li>
                                <li>— размеры преобразователя <br/><span style="padding-left: 1.3em;">(Ш х В х Дл.) 240х180х90 мм</span></li>
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
                <div class="description">
                    <h2 class="b">Описание</h2>
                    <p style="margin-top: 12px;">
                        Преобразователь частотный предназначен для питания двух машинок для стрижки овец и может подключаться
                        к обычной сети переменного тока 220 В/50 Гц или 48 Вольт постоянного тока. Для подключения машинки
                        предназначен выходной разъём. Отключение и включение преобразователя производится
                        тумблером «сеть». Светодиодные индикаторы показывают наличие сети питания и выходного напряжения.</p>
                    <p>
                        Для исключения выхода из строя от перегрева в устройстве применяется термостат (на 60 градусов),
                        который отключает блок питания при достижении указанной температуры. Выходная мощность преобразователя
                        составляет около 400 Вт. В преобразователе не применяется вентилятор для охлаждения, а используется алюминиевый
                        корпус-радиатор, что положительно влияет на надежность его использования в условиях загрязненной шерстью воздушной среды.
                    </p>
                    <p>
                        Для предотвращения выхода из строя при случайных коротких замыканиях нагрузки в выходном каскаде
                        преобразователя частоты применена быстродействующая система защиты от КЗ. Преобразователь возвращается
                        в рабочее состояние при  повторном включении тумблера «сеть». Наличие такой системы защиты не создает
                        проблем при эксплуатации неквалифицированным специалистом (чабан).
                    </p>
                    <p>
                        За счет использования современных (импортных) комплектующих достигается минимальные потери мощности
                        и максимальный КПД (около 90%), что немаловажно для энергосбережения.
                    </p>
                    <%--<p>--%>
                        <%--Также, преобразователь допускает использование  для сети питания солнечных панелей соответствующей--%>
                        <%--мощности совместно с аккумуляторами в количестве 4 шт. по 12 В. При этом КПД достигает 97 % (в выходном--%>
                        <%--каскаде используются полевые ключевые транзисторы с очень низким сопротивлением  канала).--%>
                        <%--Работа от солнечных панелей дает возможность использования изделия в полевых условиях при отсутствии--%>
                        <%--сети 220 В.--%>
                    <%--</p>--%>
                </div>
            </div>
        </div>
        <div class="sidebar">
            <div class="portlet">
                <h3>Файлы</h3>
                <div class="content description">
                    <ul class="ul-clean ul-li-mb-1em">
                        <li class="first"><a class="pdf" href="<%=request.getContextPath()%>/files/PCH-400-2_manual_rus.pdf" title="Инструкция по эксплуатации преобразователя частоты ПЧ-400-2">Описание преобразователя частоты тока</a></li>
                    </ul>
                </div>
            </div>
            <c:set var="ta"/>
            <div class="portlet">
                <h3><span>Машинки</span></h3>
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
                            <c:otherwise><c:set var="ta" value="${dp}"/></c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <c:if test="${not empty ta}">
                <div class="portlet">
                    <h3>Заточка режущих пар</h3>
                    <div class="content description">
                        <ul class="vertical-d-ul">
                            <li class="first">
                                <a href="<%=request.getContextPath()%>/parts/${ta.product.shortName}">
                                    <p style="text-align: center; margin-bottom: 0;">
                                        <img src="<%=request.getContextPath()%>${ta.product.smallImagePath}"
                                             alt="${ta.product.name}" border="0" class="png" width="100" height="103"/>
                                    </p>
                                    <h4 class="name">${ta.product.name}</h4>
                                    <h4 class="price">
                                        <c:choose>
                                            <c:when test="${country}">
                                                <c:choose>
                                                    <c:when test="${ta.discount gt 0 and ta.discountDueDate.time ge now.time}">
                                                        <span class="old-price-s" style="font-size: 10pt; color: #808080;"><fmt:formatNumber value="${ta.foreignPrice}"/></span>
                                                        <fmt:formatNumber value="${ta.foreignPrice - ta.foreignDiscount}"/> руб.
                                                    </c:when>
                                                    <c:otherwise>
                                                        <fmt:formatNumber value="${ta.foreignPrice}"/> руб.
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:when>
                                            <c:otherwise>
                                                <c:choose>
                                                    <c:when test="${ta.discount gt 0 and ta.discountDueDate.time ge now.time}">
                                                        <span class="old-price-s" style="font-size: 10pt; color: #808080;"><fmt:formatNumber value="${ta.price}"/></span>
                                                        <fmt:formatNumber value="${ta.price - ta.discount}"/> руб.
                                                    </c:when>
                                                    <c:otherwise>
                                                        <fmt:formatNumber value="${ta.price}"/> руб.
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:otherwise>
                                        </c:choose>
                                    </h4>
                                </a>
                                <%--<c:choose>--%>
                                    <%--<c:when test="${ta.product.newFlag}">--%>
                                        <%--<div class="corner-en">--%>
                                            <%--<img src="<%=request.getContextPath()%>/images/new-s.png" alt="Новинка" border="0"/>--%>
                                        <%--</div>--%>
                                    <%--</c:when>--%>
                                    <%--<c:when test="${ta.discount gt 0}">--%>
                                        <%--<div class="corner-en">--%>
                                            <%--<img src="<%=request.getContextPath()%>/images/discount-s.png"--%>
                                                 <%--alt="Скидка до <fmt:formatDate value="${ta.discountDueDate}" pattern="dd MMM" />"--%>
                                                 <%--border="0"/>--%>
                                        <%--</div>--%>
                                    <%--</c:when>--%>
                                <%--</c:choose>--%>
                            </li>
                        </ul>
                    </div>
                </div>
            </c:if>
        </div>
	</div>
	<jsp:include page="../footer.jsp" />
</div>
<jsp:include page="../error-msg.jsp" />
</body>
</html>