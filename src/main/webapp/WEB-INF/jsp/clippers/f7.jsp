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
	<meta content="Машинка для стрижки овец ${productPrice.product.name} отличается японским качеством и надежностью. Мощный двигатель - 350 Вт - позволяет справляться со стрижкой стада овец в 300 голов за сезон. Купить машинку за ${price} руб. наложенным платежом или самовывозом." name="description">
	<meta content="машинка +для стрижки овец f7, машинки +для стрижки овец f7, куплю машинку +для стрижки овец f7, машинка +для стрижки овец f7 купить, машинка +для стрижки овец f7 цена, машинка +для стрижки овец япония, машинка +для стрижки овец f7 продажа, машинка +для стрижки овец такуми" name="keywords">
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
                DD_belatedPNG.fix('.png, .pdf');
            </c:if>

            var cnt = 1;
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
            });
            $('.buy-button').click(function() {
                return buy(${productPrice.product.id}, "<%=request.getContextPath()%>/cart/addProduct");
            });
        });
    </script>
</head>
<body class="${browserClass}">
<%--<div title="description" class="se-description" style="display: none;">--%>
    <%--Мастерская обеспечена запасными частями. Результаты испытаний позволили отнести Takumi F7 Professional к лучшей машинке--%>
    <%--для стрижки до 300 овец по соотношению цена-качество, запрос пишите на <a href="mailto:info@aktubselmash.ru">info@aktubselmash.ru</a>--%>
<%--</div>--%>
<div itemscope itemtype="http://data-vocabulary.org/Breadcrumb" style="display:none;">
    <a itemprop="url" href="http://aktubselmash.ru/"><span itemprop="title">Главная</span></a>
</div>
<div id="wrapper">
    <fmt:setLocale value="RU"/>
    <c:set var="selected" value="clippers" scope="request"/>
    <c:set var="selectedLink" value="true" scope="request"/>
    <jsp:include page="../header.jsp" />
    <jsp:useBean id="now" class="java.util.Date" />
	<div id="content">
        <div class="main-content-sidebar" itemscope itemtype="http://schema.org/Product">
            <div class="box box-container">
                <h1 itemprop="name">${productPrice.product.name}</h1>
                <%--<meta itemprop="category" content="Машинки для стрижки овец" />--%>
                <p>
                    <div class="box-heading" style="height: 433px;">
                        <div class="gallery" style="float:left; margin-left: 5px; height: 433px; width: 400px;">
                            <div class="gallery-box" style="width: 400px;">
                                <ul class="gallery-box-ul" style="width: 1240px;">
                                    <li><img itemprop="image" src="<%=request.getContextPath()%>/images/clippers/F7/1b.jpg" alt="${productPrice.product.name}" border="0" width="400" height="414"/></li>
                                    <li><img src="<%=request.getContextPath()%>/images/clippers/F7/2b.jpg" alt="${productPrice.product.name}" border="0" width="400" height="414"/></li>
                                    <li><img src="<%=request.getContextPath()%>/images/clippers/F7/3b.jpg" alt="${productPrice.product.name}" border="0" width="400" height="414"/></li>
                                </ul>
                            </div>
                            <div class="gallery-dots" style="width: 52px;">
                                <span class="active"></span>
                                <span></span>
                                <span></span>
                            </div>
                        </div>
                        <div style="float:left; padding-left: 3em;">
                            <h2 style="margin-top: 1em;">Характеристики</h2>
                            <ul class="char-ul">
                                <li>— мощность двигателя 350 Вт</li>
                                <li>— вес машинки 1,4 кг</li>
                                <li>— напряжение 220-240 В</li>
                                <li>— гарантия на машинку 6 месяцев</li>
                                <li>— частота тока 50 Гц</li>
                                <li>— число оборотов в минуту 2800</li>
                                <li>— уровень шума 80 Дб(а)</li>
                                <li>— длина шнура 6 м</li>
                                <li>— размеры машинки <br/><span style="padding-left: 1.3em;">(Ш х В х Дл.) 80х95х325 мм</span></li>
                                <li>— диаметр рукоятки 57 мм</li>
                            </ul>
                            <div style="text-align: center; margin-top: 2em;">
                                <h1 style="margin-left: 0;" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                                    <meta itemprop="priceCurrency" content="RUB" />
                                    <c:choose>
                                        <c:when test="${country}">
                                            <c:choose>
                                                <c:when test="${productPrice.discount gt 0 and productPrice.discountDueDate.time ge now.time}">
                                                    <span class="old-price-s"><fmt:formatNumber value="${productPrice.foreignPrice}"/></span>
                                                    <span itemprop="price"><fmt:formatNumber value="${productPrice.foreignPrice - productPrice.foreignDiscount}"/></span> руб.
                                                </c:when>
                                                <c:otherwise>
                                                    <span itemprop="price"><fmt:formatNumber value="${productPrice.foreignPrice}"/></span> руб.
                                                </c:otherwise>
                                            </c:choose>
                                        </c:when>
                                        <c:otherwise>
                                            <c:choose>
                                                <c:when test="${productPrice.discount gt 0 and productPrice.discountDueDate.time ge now.time}">
                                                    <span class="old-price-s"><fmt:formatNumber value="${productPrice.price}"/></span>
                                                    <span itemprop="price"><fmt:formatNumber value="${productPrice.price - productPrice.discount}"/></span> руб.
                                                </c:when>
                                                <c:otherwise>
                                                    <span itemprop="price"><fmt:formatNumber value="${productPrice.price}"/></span> руб.
                                                </c:otherwise>
                                            </c:choose>
                                        </c:otherwise>
                                    </c:choose>
                                </h1>
                                <!--<span style="color: red; font-weight: bold;">+ запасная режущая пара в подарок!</span>-->
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

                        <div itemprop="description">
                            <p style="margin-top: 12px;">Машинка для стрижки овец Takumi F7 Professional отличается японским качеством и надежностью.</p>
                            <p>Мощный двигатель - 350 Вт - позволяет справляться со стрижкой стада овец в 300 голов за сезон. Кабель у этой модели очень гибкий, 6 метров в длину. Вес машинки без кабеля уменьшен до 1,4 кг. Винты с широкой полукруглой головкой, фиксирующие гребенку, имеют шестигранное углубление под ключ и обеспечивают надежную фиксацию и удобную замену гребенок с помощью входящего в комплект ключа-шестигранника.</p>
                            <p>Остальные характеристики этой машинки и комплект поставки такие же как у <a href="<%=request.getContextPath()%>/clippers/vs84-s">VS84-S</a>.</p>
                            <p>Все зубчатые колеса редуктора изготовлены из стали, а не из текстолита. Кроме того, электродвигатель машинки Takumi F7 Professional существенно тише, чем у предыдущих моделей, и имеет более высокий коэффициент полезной мощности, что способствует меньшему нагреву машинки во время работы.</p>
                            <p>Мастерская обеспечена запасными частями.</p>
                        </div>
                    </li>
                    <li>
                        <h2>Советы по уходу за машинкой и эксплуатацией режущих пар</h2>
                        <ul class="sc-case-ul" style="margin-top: 12px;">
                            <li class="first"><p>Хранить машинку для стрижки овец и очищенные от жиропота и смазанные маслом режущие лезвия при комнатной температуре в сухом помещении.</p></li>
                            <li><p>Перед эксплуатацией и через каждые 15–20 мин работы капать 1–2 капли масла, которое поставляется в комплекте с машинкой, на режущие (соприкасающиеся) поверхности ножа и гребенки. В дальнейшем можно использовать гидравлическое, трансформаторное или автомобильное масло.</p></li>
                            <li><p>Необходимо использовать раствор, предохраняющий режущие пары от загрязнения естественными выделениями кожи животных — вязкого жиропота, затрудняющего движение ножа по гребенке. Для приготовления раствора размешать измельчённый кусок хозяйственного мыла в 200 мл минерального машинного масла, так, чтобы получилась суспензия белого цвета. Для очистки режущих лезвий окунать в этот раствор на глубину 3–5 мм нож работающей машинки на 30–60 с перед стрижкой каждой овцы. Не допускать попадания раствора внутрь стригальной головки.</p></li>
                            <li><p>Во время работы следить за напряжением в сети. Машинка работает при 220 В. При падении напряжения либо сильном прижатии режущих лезвий машинка теряет обороты и перегревается. Для работы в таких условиях необходим стабилизатор напряжения.</p></li>
                        </ul>
                    </li>
                    <li>
                        <h2>Комплектация</h2>
                        <ul class="sc-case-ul">
                            <li class="first">Машинка для стрижки овец</li>
                            <li>Комплект ножей (установлены на машинку)</li>
                            <li>Специальная отвертка</li>
                            <li>Запасные графитовые щетки - 2 шт.</li>
                            <li>Флакон для смазочного масла (60 мл)</li>
                            <li>Кисточка для очистки режущих пар</li>
                            <li><a href="<%=request.getContextPath()%>/files/Takumi_F7_Professional_manual_rus.pdf" target="_blank">Инструкция по эксплуатации</a></li>
                            <li>Футляр для транспортировки и хранения</li>
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
                        <li class="first"><a class="pdf" href="<%=request.getContextPath()%>/files/Takumi_F7_Professional_manual_rus.pdf" target="_blank" title="Инструкция по эксплуатации машинки для стрижки овец Takumi F7 Professional">Инструкция по эксплуатации машинки для стрижки овец Takumi F7 Professional</a></li>
                    </ul>
                </div>
            </div>
            <jsp:useBean id="taList" class="java.util.ArrayList" />
            <div class="portlet">
                <h3><span>Запасные пары</span></h3>
                <div class="content description">
                    <ul class="vertical-d-ul">
                        <c:forEach var="dp" items="${dependantPrices}" varStatus="status">
                            <c:choose>
                                <c:when test="${dp.product.shortName ne 'ta-1' and dp.product.shortName ne 'ta-2'}">
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
                                <c:otherwise><% taList.add(pageContext.getAttribute("dp")); %></c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <c:if test="${not empty taList}">
                <div class="portlet">
                    <h3>Заточка режущих пар</h3>
                    <div class="content description">
                        <ul class="vertical-d-ul">
                            <c:forEach items="${taList}" var="ta" varStatus="status">
                                <li <c:if test="${status.first}">class="first"</c:if>>
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
                            </c:forEach>
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
