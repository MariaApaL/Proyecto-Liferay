package com.accenture.apa.listado.usuarios.portlet.portlet;

import com.accenture.apa.listado.usuarios.portlet.constants.UsuariosKeys;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCRenderCommand;

import javax.portlet.Portlet;
import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.osgi.service.component.annotations.Component;


@Component(
		immediate = true,
		property = {
			
			"javax.portlet.name=" + UsuariosKeys.USUARIOS,
			"mvc.command.name=usersInfo"
		},
		service = Portlet.class
	)
public class ShowUsersRenderCommand implements MVCRenderCommand {

	@Override
	public String render(RenderRequest renderRequest, RenderResponse renderResponse) throws PortletException {
		// TODO Auto-generated method stub
		return "/info.jsp";
	}

}
