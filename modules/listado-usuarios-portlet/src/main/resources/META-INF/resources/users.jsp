<%@ include file="/init.jsp" %>
<%@page import="javax.portlet.ActionRequest"%>
<%@page import="com.liferay.portal.kernel.service.UserLocalServiceUtil"%>
<%@page import="com.liferay.portal.kernel.model.User"%>
<%@page import="java.util.List"%>
<%@page import="com.liferay.portal.kernel.util.ParamUtil"%>

<%

long userId = ParamUtil.getLong(request, "idUser");

User selectedUser = null;

if (userId > 0) {
	selectedUser = UserLocalServiceUtil.getUser(userId);
}

%>

<!-- <portlet:actionURL name="usersInfo" var="actionURL"/> -->



<liferay-ui:header title="Volver" backURL="<%= backURL %>"></liferay-ui:header>

<div>
					<div class="card" style="width: 18rem;">
						<div class="card-body">
							<h5 class="card-title"><%=selectedUser.getFirstName()%></h5>
							<h6 class="card-subtitle mb-2 text-muted"><%=selectedUser.getLastName()%></h6>
						</div>

					</div>

				</div>