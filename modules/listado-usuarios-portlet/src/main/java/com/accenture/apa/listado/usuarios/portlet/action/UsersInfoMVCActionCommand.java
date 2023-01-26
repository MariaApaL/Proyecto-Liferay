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
import javax.portlet.PortletRequest;
import javax.portlet.PortletResponse;
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

	
	
	@Override
	public boolean processAction(ActionRequest actionRequest, ActionResponse actionResponse) throws PortletException {
		

		return true;
	}

}
	
