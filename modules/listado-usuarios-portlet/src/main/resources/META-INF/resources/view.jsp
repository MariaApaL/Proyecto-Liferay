<%@ include file="/init.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.liferay.portal.kernel.service.UserLocalServiceUtil"%>
<%@page import="com.liferay.portal.kernel.model.User"%>
<%@page import="com.liferay.portal.kernel.theme.ThemeDisplay"%>
<%@page import="java.util.List"%>

<%
	List<User> users = (List<User>) request.getAttribute("users");
	/* ThemeDisplay themeDisplay = new ThemeDisplay(); */
	
%>



<!-- Esto se usa para crear una url para moverse de una vista a otra -->
<liferay-portlet:renderURL var="usersURL">


	<!--  Aquí se indica a donde va a dirigir esta url. -->
	<liferay-portlet:param name="mvcRenderCommandName" value="show-users" />
	<liferay-portlet:param name="backURL" value="<%=currentURL%>" />

</liferay-portlet:renderURL>

<body>

	<section id="welcome" class="align-items-center">
		<!-- Forma despues de Rafa -->
		<%
			for (int i = 0; i < users.size(); i++) {
				if (!(users.get(i).getFirstName().equals(""))&&!(users.get(i).getFirstName().equals("Anonymous"))) {
		%>
		<div class="container">
			<div class="row">
				<div>

					<div class="card" style="width: 18rem;">
						<div class="card-body">
							<%-- <img src=<%=users.get(i).getPortraitURL(themeDisplay) %> class="img-fluid" /> --%>
							<h5 class="card-title"><%=users.get(i).getFirstName()%></h5>
							<h6 class="card-subtitle mb-2 text-muted"><%=users.get(i).getLastName()%></h6>
							<a href="<%=usersURL%>" class="card-link">Información</a>
						</div>
					
					</div>
				</div>
			 
			</div>
		</div>




		<%
			}

			}
		%>

	</section>
</body>



<!-- También funciona -->
<%-- 
<c:forEach items="${users}" var="user">

<div class="card" style="width: 18rem;">
  <div class="card-body">
    <h5 class="card-title">${user.firstName}</h5>
    <h6 class="card-subtitle mb-2 text-muted">${user.lastName }</h6>
    <a href="<%= usersURL%>" class="card-link">Información</a>
  </div>
</div>

</c:forEach> --%>



<!-- Forma antigua que funciona -->
<%-- <div class="container">
    <c:forEach items="${users}" var="user">
        <div class="card">
            <div class="card-body">
            <img src="<%=portraitURL %>" alt="avatar"/> (No funciona)
            <aui:a href="<%= usersURL%>">${user.screenName}</aui:a>
                
                 </div>
        </div>
    </c:forEach>
    
    
</div> --%>

