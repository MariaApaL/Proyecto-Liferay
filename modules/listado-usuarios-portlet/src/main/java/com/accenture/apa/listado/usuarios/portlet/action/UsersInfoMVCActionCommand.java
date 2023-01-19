package com.accenture.apa.listado.usuarios.portlet.action;

import com.accenture.apa.listado.usuarios.portlet.constants.UsuariosKeys;
import com.liferay.portal.kernel.model.Portlet;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCActionCommand;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;
import com.liferay.portal.kernel.util.ParamUtil;

import java.io.IOException;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.PortletURL;

import org.osgi.service.component.annotations.Component;


@Component(
        immediate = true,
        property = {
        		"javax.portlet.name=" + UsuariosKeys.USUARIOS,
    			"mvc.command.name=usersInfo"
        },
        service = MVCActionCommand.class
)


public class UsersInfoMVCActionCommand implements MVCActionCommand {

	public void userInformation (ActionRequest actionRequest, ActionResponse actionResponse)
			throws IOException, PortletException {
		try {

			long userId = ParamUtil.getLong(actionRequest, "userId");
			String screenName= ParamUtil.getString(actionRequest, "screenName");
			String firstName = ParamUtil.getString(actionRequest, "firstName");
			String lastName = ParamUtil.getString(actionRequest, "lastName");
			
			String email = ParamUtil.getString(actionRequest, "email");
			long phone = ParamUtil.getLong(actionRequest, "phone");
			

		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

	@Override
	public boolean processAction(ActionRequest actionRequest, ActionResponse actionResponse) throws PortletException {
		
		try {
			userInformation(actionRequest,actionResponse);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}

}
	
