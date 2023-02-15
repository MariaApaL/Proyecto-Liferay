<%@page import="com.liferay.expando.kernel.model.ExpandoBridge"%>
<%@page import="javax.portlet.RenderResponse"%>
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
//Recogemos lista de usuarios
	List<User> users = (List<User>) request.getAttribute("users");

//Sirve para mostrar el avatar
	themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);

//Obtenemos el id de nuestro portlet
	String portletId = (String) request.getAttribute(WebKeys.PORTLET_ID);
	
	
    
%>


<!-- Render URL para navegar a otra vista y volver atras. -->
<liferay-portlet:renderURL var="usersURL">
	<liferay-portlet:param name="mvcRenderCommandName" value="show-users" />
	<liferay-portlet:param name="backURL" value="<%=currentURL%>" />
</liferay-portlet:renderURL>





<body>

	<!-- Forma despues de Rafa -->




	<div class="container">
		<div class="row text-center">
			<%
				for (int i = 0; i < users.size(); i++) {
					if (!(users.get(i).getFirstName().equals("")) && !(users.get(i).getFirstName().equals("Anonymous"))) {
					
			%>
			
		
					
					
			<div class="col-xl-6 col-sm-2 mb-5">
				<div class="bg-white rounded shadow-sm py-5 px-4">
					<img src="<%=users.get(i).getPortraitURL(themeDisplay)%>"
						alt="avatar" width="100"
						class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
					<br>

					<h5 class="mb-0"><%=users.get(i).getFullName()%></h5>

					<span class="small text-uppercase text-muted"><%=users.get(i).getJobTitle()%></span>
					<br> <br>

					<button class="info" onClick="createRowURL('<%=users.get(i).getUserId()%>')">Información</button>


			



				</div>
			</div>

 
			<%
				}

				}
			%>

		</div>
	</div>


</body>


<script type="text/javascript">

	//funcion que recoge el id y cambia de vista.
	
	function createRowURL(id) {
		console.log("entro al metodo");
		var renderURL = Liferay.PortletURL.createRenderURL();
		renderURL.setParameter("mvcRenderCommandName", "show-users");
		renderURL.setParameter("id", id);
        renderURL.setParameter("backURL","<%=currentURL%>");
		renderURL.setPortletId("<%=portletId%>");
		window.location.href = renderURL.toString();
	}

</script>

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

