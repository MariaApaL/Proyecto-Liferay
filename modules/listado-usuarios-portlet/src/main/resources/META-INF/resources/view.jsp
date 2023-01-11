<%@ include file="/init.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.liferay.portal.kernel.model.User"%>

   <liferay-portlet:renderURL var="infoURL">
   <liferay-portlet:param name="mvcPath" value="info.jsp"/>
   <liferay-portlet:param name="backURL" vale="<%= currentURL%>"/>
   </liferay-portlet:renderURL>

<div class="container">
    <c:forEach items="${users}" var="user">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">${user.screenName}</h5>
                 </div>
        </div>
    </c:forEach>
    
    <aui:a href="<%= infoURL%>">click</aui:a>
</div>

