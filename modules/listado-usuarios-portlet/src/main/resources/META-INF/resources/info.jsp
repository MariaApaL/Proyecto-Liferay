<%@page import="com.liferay.expando.kernel.model.ExpandoBridge"%>
<%@page import="com.liferay.portal.kernel.model.Phone"%>
<%@page import="com.liferay.portal.kernel.theme.ThemeDisplay"%>
<%@page import="com.liferay.portal.kernel.util.WebKeys"%>
<%@page import="javax.portlet.RenderRequest"%>
<%@page import="javax.portlet.ActionRequest"%>
<%@page import="javax.portlet.RenderResponse"%>
<%@page import="javax.portlet.PortletURL"%>
<%@page import="com.liferay.portal.kernel.model.User"%>
<%@page import="com.liferay.portal.kernel.service.UserLocalServiceUtil"%>
<%@page import="com.liferay.portal.kernel.util.ParamUtil"%>
<%@page import="java.util.List"%>
<%@ include file="/init.jsp"%>





<%
	//Recoge el id de la funcion de javascript
	long id = ParamUtil.getLong(request, "id");

	//Creamos usuario con el id
	User selectedUser = null;

	if (id > 0) {
		selectedUser = UserLocalServiceUtil.getUser(id);
	}

	//Sirve para mostrar el avatar

	themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);

	//Sirve para recoger un campo personalizable. Solo se pueden buscar los de tipo String
	ExpandoBridge expandoBridge = selectedUser.getExpandoBridge();
	expandoBridge.getAttribute("phone");

	String portletId = (String) request.getAttribute(WebKeys.PORTLET_ID);
%>



<portlet:actionURL var="deleteURL" name="processAction">
	<%-- 	<portlet:param name="id" value="<%= String.valueOf(selectedUser.getUserId()) %>"/>
	 --%>
</portlet:actionURL>

<div class="container-info">
	<div class="row text-center">

		<div class="col-xl-6 col-sm-2 mb-5">
			<div class="bg-white rounded shadow-sm py-5 px-4">
				<img src="<%=selectedUser.getPortraitURL(themeDisplay)%>"
					alt="avatar" width="100"
					class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
				<br> <br>
				<h5 class="mb-0">Usuario</h5>
				<span class="small text-uppercase text-muted"><%=selectedUser.getScreenName()%></span>
				<br> <br>
				<h5 class="mb-0">Nombre completo:</h5>
				<span class="small text-uppercase text-muted"><%=selectedUser.getFullName()%></span>
				<br> <br>
				<h5 class="mb-0">Sector:</h5>
				<span class="small text-uppercase text-muted"><%=selectedUser.getJobTitle()%></span>
				<br> <br>
				<h5 class="mb-0">Teléfono de Contacto:</h5>
				<span class="small text-uppercase text-muted"><%=expandoBridge.getAttribute("phone")%></span>
				<br> <br>
				<h5 class="mb-0">Email:</h5>
				<span class="small text-uppercase text-muted"><%=selectedUser.getEmailAddress()%></span>

<%-- 
			<!-- Intento con un form -->
				<form action="<%=deleteURL%>" name="deleteActionForm"
					method="POST">


					<input type="hidden" name="id" value="<%=String.valueOf(selectedUser.getUserId())%>" /> 
				
				<input type="submit" value="Delete User" />

				</form>


				<!-- Intento con una etiqueta a  -->
				<a href="<%=deleteURL%>">Borrar</a>



				<!-- Intento con un botón	 -->

				<button class="info"
					onClick="deleteUser('<%=selectedUser.getUserId()%>')">Borrar</button>
 --%>

			</div>
		</div>

	</div>
</div>


<liferay-ui:header title="Volver" backURL="<%=backURL%>"></liferay-ui:header>


<script type="text/javascript">
	function deleteUser(id) {
		console.log("entro al metodo");
		var actionURL = Liferay.PortletURL.createActionURL();
		actionURL.setParameter("mvcActionCommandName", "delete-user");
		actionURL.setParameter("id", id);
        
		actionURL.setPortletId("<%=portletId%>");

	}
</script>