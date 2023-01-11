package com.accenture.apa.listado.usuarios.portlet.portlet;

import com.accenture.apa.listado.usuarios.portlet.constants.UsuariosKeys;

import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;
import com.liferay.portal.kernel.service.UserLocalServiceUtil;
import com.liferay.portal.kernel.model.User;

import java.util.List;
import java.io.IOException;

import javax.portlet.Portlet;
import javax.portlet.PortletException;
import javax.portlet.PortletSession;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.osgi.service.component.annotations.Component;

/**
 * @author maria.luque.lopez
 */
@Component(
	immediate = true,
	property = {
		"com.liferay.portlet.display-category=category.sample",
		"com.liferay.portlet.header-portlet-css=/css/main.css",
		"com.liferay.portlet.instanceable=true",
		"javax.portlet.display-name=ListadoUsuarios",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/view.jsp",
		"javax.portlet.name=" + UsuariosKeys.USUARIOS,
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class Usuarios extends MVCPortlet {
	

	@Override
	//Método de MVCPortlet que se usa para generar una vista en el portlet.
	//Renderrequest se usa para poder pasar la información al jsp, renderresponse se usa para enviar la info
	public void doView (RenderRequest request, RenderResponse response) throws IOException, PortletException  {
		
		
		//UserLocalServiceUtil es una clase para interactuar con los usuarios de liferay.
		int numUsers = UserLocalServiceUtil.getUsersCount();
		
        List<User> users = UserLocalServiceUtil.getUsers(0,numUsers);
		
    	request.setAttribute("users", users);
		super.doView(request, response);
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}