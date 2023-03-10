package com.accenture.apa.listado.usuarios.portlet.portlet;

import com.accenture.apa.listado.usuarios.portlet.constants.UsuariosKeys;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCRenderCommand;
import com.liferay.portal.kernel.util.ParamUtil;

import javax.portlet.Portlet;
import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.osgi.service.component.annotations.Component;

/**
 * 
 * @author maria.luque.lopez
 * 
 * Clase para recoger el id del usuario y redirigir a la vista "info.jsp"
 *
 */

@Component(
		immediate = true,
		property = {
			
				"javax.portlet.name=" + UsuariosKeys.USUARIOS,
				"mvc.command.name=show-users"
		},
		service = MVCRenderCommand.class
	)



public class ShowUsersPageRenderCommand implements MVCRenderCommand {

	@Override
	public String render(RenderRequest renderRequest, RenderResponse renderResponse) throws PortletException {
		
		//Recoge el id la funci?n javascript en la vista "view.jsp"
		long id = ParamUtil.getLong(renderRequest, "id");
		
		return "/info.jsp";
	}

}