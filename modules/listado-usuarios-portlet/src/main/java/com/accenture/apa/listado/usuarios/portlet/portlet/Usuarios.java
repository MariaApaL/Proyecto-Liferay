package com.accenture.apa.listado.usuarios.portlet.portlet;

import com.accenture.apa.listado.usuarios.portlet.constants.UsuariosKeys;

import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;
import com.liferay.portal.kernel.service.UserLocalServiceUtil;
import com.liferay.portal.kernel.theme.ThemeDisplay;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.model.User;

import java.util.ArrayList;
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
	//Render se ejecuta siempre al recargar la página por primera vez y después de usar Action.
	public void doView (RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException{
		
		
		//UserLocalServiceUtil es una clase para interactuar con los usuarios de liferay.
		
		//Número total de usuarios.
		int numUsers = UserLocalServiceUtil.getUsersCount();
		
		
		//Lista de los usuarios
        List<User> users = new ArrayList<User>();
        
        //Recorre los usuarios del 0 al total.
        users= UserLocalServiceUtil.getUsers(0,numUsers);
        
        //Crea atributo para usar en el jsp
    	renderRequest.setAttribute("users", users);
    	
    	
		super.doView(renderRequest, renderResponse);
		
	
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}