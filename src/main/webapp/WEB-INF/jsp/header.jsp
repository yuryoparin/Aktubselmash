<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%--@elvariable id="cart" type="ru.aktubselmash.model.Cart"--%>
<%--@elvariable id="isHome" type="java.lang.Boolean"--%>
<%--@elvariable id="selected" type="java.lang.String"--%>
<%--@elvariable id="selectedLink" type="java.lang.Boolean"--%>
<%--@elvariable id="productPrice" type="ru.aktubselmash.model.ProductPrice"--%>

<div id="header">
    <div>
        <div class="logo-div">
            <c:if test="${not isHome}"><a class="logo-href" href="<%=request.getContextPath()%>/" title="Перейти на главную страницу"></c:if>
                <p class="header-1">Актюбсельмаш</p>
                <%--<p class="header-2">Машинки для стрижки овец</p>--%>
            <c:if test="${not isHome}"></a></c:if>
        </div>
        <div style="overflow: hidden; width: 478px; float: right;">
            <div class="phone"><div><span>+7 916 </span><span>185-</span><span>06-28</span></div><div><span>+7 925 </span><span>142-</span><span>25-01</span></div>
                <%--<img src="<%=request.getContextPath()%>/images/phone-number.png" alt=""--%>
                     <%--border="0" width="211" height="31"/>--%>
            </div>
            <div class="cart">
                <c:set var="total" value="${cart.totalNumber}"/>
                <c:choose>
                    <c:when test="${total gt 0}">
                        <c:set var="total" value="${total}"/>
                    </c:when>
                    <c:otherwise><c:set var="total" value="0"/></c:otherwise>
                </c:choose>
                <a href="<%=request.getContextPath()%>/cart" class="cart"><span style="font-size: 18px;">Мой заказ</span> <span class="count"><c:out value="${total}"/></span></a>
            </div>
        </div>
        <%--<table class="popup cart-popup">--%>
            <%--<tr>--%>
                <%--<td class="topleft corner"></td>--%>
                <%--<td class="top">--%>
                    <%--<img width="30" height="29" alt="popup tail" border="0"--%>
                         <%--src="<%=request.getContextPath()%>/images/bubble/bubble-tail.png" class="png"/>--%>
                <%--</td>--%>
                <%--<td class="topright corner"></td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td class="left"></td>--%>
                <%--<td class="data">--%>
                    <%--<c:choose>--%>
                        <%--<c:when test="${not empty productPrice}"><c:out value="${productPrice.product.name}"/> добавлен в корзину</c:when>--%>
                        <%--<c:otherwise>Товар удален из корзины</c:otherwise>--%>
                    <%--</c:choose>--%>
                <%--</td>--%>
                <%--<td class="right"></td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td class="bottomleft corner"></td>--%>
                <%--<td class="bottom"></td>--%>
                <%--<td class="bottomright corner"></td>--%>
            <%--</tr>--%>
        <%--</table>--%>
        <div style="clear:both;"></div>
    </div>
    <div style="width: <c:choose><c:when test="${selected eq 'contacts' and not selectedLink}">815</c:when><c:otherwise>818</c:otherwise></c:choose>px; padding-top: 15px;">
        <div id="navigation" class="box box-container">
            <ul>
                <li class="first<c:if test="${selected eq 'clippers'}"> selected</c:if>">
                    <c:choose>
                        <c:when test="${selected eq 'clippers' and not selectedLink}">
                            <div><span>Машинки для стрижки овец</span></div>
                        </c:when>
                        <c:otherwise><div itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><a href="<%=request.getContextPath()%>/clippers" itemprop="url"><span itemprop="title">Машинки для стрижки овец</span></a></div></c:otherwise>
                    </c:choose>
                </li>
                <li<c:if test="${selected eq 'parts'}"> class="selected"</c:if>>
                    <c:choose>
                        <c:when test="${selected eq 'parts' and not selectedLink}">
                            <div><span>Запчасти и инструменты</span></div>
                        </c:when>
                        <c:otherwise><a href="<%=request.getContextPath()%>/parts"><span>Запчасти и инструменты</span></a></c:otherwise>
                    </c:choose>
                </li>
                <li<c:if test="${selected eq 'payment'}"> class="selected"</c:if>>
                    <c:choose>
                        <c:when test="${selected eq 'payment' and not selectedLink}">
                            <div><span>Оплата</span></div>
                        </c:when>
                        <c:otherwise><a href="<%=request.getContextPath()%>/payment"><span>Оплата</span></a></c:otherwise>
                    </c:choose>
                </li>
                <li<c:if test="${selected eq 'shipping'}"> class="selected"</c:if>>
                    <c:choose>
                        <c:when test="${selected eq 'shipping' and not selectedLink}">
                            <div><span>Доставка</span></div>
                        </c:when>
                        <c:otherwise><a href="<%=request.getContextPath()%>/shipping"><span>Доставка</span></a></c:otherwise>
                    </c:choose>
                </li>
                <li class="last<c:if test="${selected eq 'contacts'}"> selected</c:if>">
                    <c:choose>
                        <c:when test="${selected eq 'contacts' and not selectedLink}">
                            <div><span>Контакты</span></div>
                        </c:when>
                        <c:otherwise><a href="<%=request.getContextPath()%>/contacts"><span>Контакты</span></a></c:otherwise>
                    </c:choose>
                </li>
            </ul>
        </div>
    </div>
</div>