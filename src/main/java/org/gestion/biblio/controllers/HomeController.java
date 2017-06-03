package org.gestion.biblio.controllers;

import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.gestion.biblio.Metier.IBiblioMetier;
import org.gestion.biblio.model.Client;
import org.gestion.biblio.model.DemandeEmprunt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
ClassPathXmlApplicationContext context =new ClassPathXmlApplicationContext(new String[]{"applicationContext.xml"} );
	

IBiblioMetier metier = (IBiblioMetier) context.getBean("metier");
    //get inscription form
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
    	model.addAttribute("userForm", new Client());
		
		return "loginform";
	}
	//post inscription form
	   @RequestMapping(value="/login" , method=RequestMethod.POST )
	    public ModelAndView connexion(@ModelAttribute("userForm") @Valid Client nclient, BindingResult result,Model model) throws SQLException{
		   
	    HttpServletRequest curRequest = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
			HttpSession session = curRequest.getSession();	       
	        Client A = new Client();
	    	System.out.println("hello world");
	        A.setLogin(nclient.getLogin());
	        A.setPassword(nclient.getPassword());
	       
	        if((metier.connect(nclient.getLogin(),nclient.getPassword())).isEmpty()) {
	        	  model.addAttribute("css", "warning");
	        	  model.addAttribute("css1", "Warning ! ");
	              model.addAttribute("msg", "Login Or Password Incorrect");
    	
	      return new ModelAndView("loginform");
	        }else { 
	          	Client  c =metier.connect(nclient.getLogin(),nclient.getPassword()).get(0);
	            session.setAttribute("Client",c);
	            session.setAttribute("books", metier.getLivres());
	            session.setAttribute("nbr", metier.nombreEmprunt());
	            if (c.getRole().equals("Simple user"))
	            {List <DemandeEmprunt> d=metier.find_demande_emprunt(c.getLogin());
	            model.addAttribute("nbre", d.size());
	            	return new ModelAndView("home"); }
	            else { 
	            return new ModelAndView("admin");}
 } } 
	   //deconnexion
	    @RequestMapping(value="/deconnecter" , method=RequestMethod.GET )
	    public ModelAndView deconnection (HttpServletRequest request, HttpServletResponse response,Model model)
	    {  HttpSession session=request.getSession();
	            session.invalidate();        
	            model.addAttribute("userForm", new Client());
	            return new ModelAndView("loginform");
	    }
	    //home
	    @RequestMapping(value="/home" , method=RequestMethod.GET )
	    public ModelAndView deconnection (HttpServletRequest request,Model model)
	    {  HttpSession session=request.getSession(false);
	    Client c = (Client) session.getAttribute("Client");
	    model.addAttribute("userForm", new Client());
	            if (c==null) {
	            
	            return new ModelAndView("loginform");} else 
	            {List <DemandeEmprunt> d=metier.find_demande_emprunt(c.getLogin());
	            model.addAttribute("nbre", d.size());
	            	return new ModelAndView("home");}
	    }
	
	    //admin
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView admin(Model model,HttpServletRequest req) {
      
		System.out.print(metier.nombreEmprunt());
    HttpSession session=req.getSession(false);
    Client c = (Client) session.getAttribute("Client");
    model.addAttribute("userForm", new Client());
            if (c==null) {
            return new ModelAndView("loginform");} else 
            { model.addAttribute("nbr", metier.nombreEmprunt()) ;return new ModelAndView("admin");}
    }

}