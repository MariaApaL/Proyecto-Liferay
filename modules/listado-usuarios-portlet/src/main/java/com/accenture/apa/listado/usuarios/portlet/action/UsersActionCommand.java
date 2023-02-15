package com.accenture.apa.listado.usuarios.portlet.action;

import com.accenture.apa.listado.usuarios.portlet.constants.UsuariosKeys;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.model.User;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCActionCommand;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCRenderCommand;
import com.liferay.portal.kernel.service.UserLocalServiceUtil;
import com.liferay.portal.kernel.util.ParamUtil;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;

import org.osgi.service.component.annotations.Component;

@Component(immediate = true, property = {

		"javax.portlet.name=" + UsuariosKeys.USUARIOS,
		"mvc.command.name=delete-user" }, service = MVCActionCommand.class)

public class UsersActionCommand implements MVCActionCommand {

	@Override
	public boolean processAction(ActionRequest actionRequest, ActionResponse actionResponse) throws PortletException {

		try {
			long idUser = ParamUtil.getLong(actionRequest, "id");

			User user = UserLocalServiceUtil.deleteUser(idUser);
			
			
			
		} catch (PortalException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return true;
	}

}
