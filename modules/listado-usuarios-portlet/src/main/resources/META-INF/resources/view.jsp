<%@page import="com.liferay.portal.kernel.util.WebKeys"%>
<%@ include file="/init.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.liferay.portal.kernel.service.UserLocalServiceUtil"%>
<%@page import="com.liferay.portal.kernel.model.User"%>
<%@page import="com.liferay.portal.kernel.theme.ThemeDisplay"%>
<%@page import="java.util.List"%>
<%@page import="com.liferay.portal.kernel.portlet.PortletURLFactoryUtil"%>
<%@page import="javax.portlet.PortletURL"%>



<%
	List<User> users = (List<User>) request.getAttribute("users");

	themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);

	PortletURL redirectURL = renderResponse.createRenderURL();

	redirectURL.setParameter("info", "/users.jsp");
%>


<!-- Esto se usa para crear una url para moverse de una vista a otra -->
<liferay-portlet:renderURL var="usersURL">
	<liferay-portlet:param name="mvcRenderCommand" value="show-users" />
	<!--  Aquí se indica a donde va a dirigir esta url. -->
	<liferay-portlet:param name="backURL" value="<%=currentURL%>" />
	<%-- <liferay-portlet:param name="redirect" value="<%=currentURL%>"/> --%>



</liferay-portlet:renderURL>





<body>

		<!-- Forma despues de Rafa -->


					
					
	<div class="container">
        <div class="row text-center">
        <%
						for (int i = 0; i < users.size(); i++) {
							if (!(users.get(i).getFirstName().equals("")) && !(users.get(i).getFirstName().equals("Anonymous"))) {
							String fullName= users.get(i).getFirstName()+" " + users.get(i).getLastName();
					%>
            <div class="col-xl-6 col-sm-2 mb-5">
                <div class="bg-white rounded shadow-sm py-5 px-4">
                    <img src="<%=users.get(i).getPortraitURL(themeDisplay)%>" alt="avatar" width="100"
                        class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
                        <br>
                    <h5 class="mb-0"><%=fullName%></h5>
     
                    <span class="small text-uppercase text-muted"><%=users.get(i).getJobTitle()%></span>
                    <br>
                    <br>
                    <button type="button" class="btn btn-secondary btn-sm"
								onClick="redirect('<%=redirectURL.toString()%>')">
								Información</button>
                </div>
            </div>
     
		

					<%
						}

						}
					%>
				
			</div>
		</div>


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

<script type="text/javascript">
	function createRowURL() {
		var renderURL = Liferay.PortletURL.createURL(themeDisplay
				.getURLControlPanel())
		renderURL.setParameter("
									mvc", "/users.jsp");
		window.location.href=renderURL.toString();
									}

	function redirect(url) {

		window.location.href=url;}
</script>