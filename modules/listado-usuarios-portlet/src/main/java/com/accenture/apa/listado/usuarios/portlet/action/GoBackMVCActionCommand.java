package com.accenture.apa.listado.usuarios.portlet.action;

import com.accenture.apa.listado.usuarios.portlet.constants.UsuariosKeys;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCActionCommand;


import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;

import org.osgi.service.component.annotations.Component;

@Component(
        immediate = true,
        property = {
        		"javax.portlet.name=" + UsuariosKeys.USUARIOS,
    			"mvc.command.name=goBack"
        },
        service = MVCActionCommand.class
)

public class GoBackMVCActionCommand implements MVCActionCommand{

	@Override
	public boolean processAction(ActionRequest actionRequest, ActionResponse actionResponse) throws PortletException {
		// TODO Auto-generated method stub
		return false;
	}

}
