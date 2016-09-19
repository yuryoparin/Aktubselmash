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
  <meta content="${productPrice.product.name} - ${price} руб." name="description">
  <meta content="режущая пара +для стрижки овец heineger, нож +для стрижки овец heiniger, гребенка +для стрижки овец heineger, куплю гребенку +для стрижки овец heiniger, импортные режущие пары" name="keywords">
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
  Нож и гребенка Heiniger с прямой формой зубьев гребенки, количество зубьев гребенки 13, толщина гребенки 4 мм,
  количество зубьев ножа 4, толщина ножа 4,5 мм, запрос пишите на <a href="mailto:info@aktubselmash.ru">info@aktubselmash.ru</a>
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
              <ul class="gallery-box-ul" style="width: 1640px">
                <li><img src="<%=request.getContextPath()%>/images/parts/Heiniger/1b.jpg" alt="${productPrice.product.name}" border="0" width="400" height="414"/></li>
                <li><img src="<%=request.getContextPath()%>/images/parts/Heiniger/2b.jpg" alt="${productPrice.product.name}" border="0" width="400" height="414"/></li>
                <li><img src="<%=request.getContextPath()%>/images/parts/Heiniger/3b.jpg" alt="${productPrice.product.name}" border="0" width="400" height="414"/></li>
                <li><img src="<%=request.getContextPath()%>/images/parts/Heiniger/4b.jpg" alt="${productPrice.product.name}" border="0" width="400" height="414"/></li>
              </ul>
            </div>
            <div class="gallery-dots" style="width: 69px;">
              <span class="active"></span>
              <span></span>
              <span></span>
              <span></span>
            </div>
          </div>
          <div style="float:left; padding-left: 3em; width: 200px;">
            <h2 style="margin-top: 1em;">Характеристики</h2>
            <ul class="char-ul">
              <li>— ширина гребенки 76 мм</li>
              <li>— количество зубьев гребенки 13</li>
              <li>— толщина гребенки 4 мм</li>
              <li>— прямая форма зубьев гребенки</li>
              <li>— количество зубьев ножа 4</li>
              <li>— толщина ножа 4,5 мм</li>
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
              <p style="line-height: 140%; width: 200px; text-align: left; padding: 5px 0;">
                Минимальная отправка отдельным заказом почтой или EMS – <span style="color:red;">1 пара</span>,
                а при отправке вместе с машинкой – дополнительная скидка 200 руб.
              </p>
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
      <jsp:useBean id="taList" class="java.util.ArrayList" />
      <div class="box box-container description" style="margin-top: 1em;">
        <h2 class="b" style="margin-bottom: 7px;">Подходит для машинок</h2>
        <ul class="horizontal-d-ul">
          <c:forEach var="dp" items="${dependantPrices}" varStatus="status">
            <c:choose>
              <c:when test="${dp.product.shortName ne 'ta-1' and dp.product.shortName ne 'ta-2'  and dp.product.shortName ne 'ta-2m'}">
                <li <c:if test="${status.first}">class="first"</c:if>>
                  <c:set var="path">
                    <c:choose>
                      <c:when test="${dp.product.partsFlag}">parts</c:when>
                      <c:otherwise>clippers</c:otherwise>
                    </c:choose>
                  </c:set>
                  <a href="<%=request.getContextPath()%>/${path}/${dp.product.shortName}">
                    <div style="text-align: center; height: 110px;">
                      <div style="width: 100px; height: 103px; position: relative; margin: 0 auto;">
                        <img src="<%=request.getContextPath()%>${dp.product.smallImagePath}"
                             alt="${dp.product.name}" border="0"
                             style="position: absolute; bottom: 0; left: 0;"
                             class="png" width="100"/>
                      </div>
                    </div>
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
    <div class="sidebar">
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