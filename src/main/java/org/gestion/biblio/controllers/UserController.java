package org.gestion.biblio.controllers;


import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.apache.commons.io.FileUtils;
import org.gestion.biblio.Metier.*;
import org.gestion.biblio.form.LivreForm;
import org.gestion.biblio.model.Client;
import org.gestion.biblio.model.DemandeEmprunt;
import org.gestion.biblio.model.Emprunt;
import org.gestion.biblio.model.Livre;



@Controller
public class UserController {

ClassPathXmlApplicationContext context =new ClassPathXmlApplicationContext(new String[]{"applicationContext.xml"} );
	IBiblioMetier metier = (IBiblioMetier) context.getBean("metier");


// book recherché
	@RequestMapping(value = "/recherche", method = RequestMethod.POST)
	public String saveOrUpdateUser(HttpServletRequest request, @Valid LivreForm u,
			BindingResult result, Model model) {
		  HttpSession session=request.getSession(false);
		    Client c = (Client) session.getAttribute("Client");
		List <DemandeEmprunt> d=metier.find_demande_emprunt(c.getLogin());
        model.addAttribute("nbre", d.size());
		   if (result.hasErrors())
		    {return "recherche" ;}
		    else {
		    	List <Livre> i = metier.RechercheLivre(u.getCode());
		    	if (i.isEmpty()) {
		      	  model.addAttribute("css", "warning");
	        	  model.addAttribute("css1", "Warning ! ");
	              model.addAttribute("msg1", "No Such Book, Try Again Please ! ");
	              return "home";
		    	} else
		    	
		    	{
		        	u.setLivre(i);
	
			model.addAttribute("Livre",u);
			return "home" ;}}
		}
	//emprunter book
			@RequestMapping(value = "/books/{reference}/emprunter", method = RequestMethod.GET)
			public String showBook1(@PathVariable("reference") String reference, Locale locale,Model model,HttpServletRequest req) 
			{  HttpSession session = req.getSession(false);
				 Client c = (Client) session.getAttribute("Client");
				 String format = "dd/MM/yy H:mm:ss"; 
	        	  java.text.SimpleDateFormat formater = new java.text.SimpleDateFormat( format ); 
	        	  java.util.Date date = new java.util.Date(); 
	  		
          if (metier.verifdispo(reference)){
             
                 Emprunt E=metier.addEmprunt(new Emprunt (reference,date,c.getLogin()));
          model.addAttribute("css", "success");
          model.addAttribute("css1", "Success ! ");
          model.addAttribute("msg", "Votre demande d'emprunt n "+E.getId()+" a été enregistré");
     
				return "home";

			}
          else {
        	  Livre l=metier.getLivre(reference);
        	  
        	  model.addAttribute("css", "warning");
        	  model.addAttribute("css1", "Warning ! ");
              model.addAttribute("msg", "Le livre "+l.getTitre()+" est déjà emprunter");
              metier.addEmp(new DemandeEmprunt (c.getLogin(),reference,l.getTitre(),date));
              List <DemandeEmprunt> d=metier.find_demande_emprunt(c.getLogin());
	          model.addAttribute("nbre", d.size());
		return "home";
          }
	}
			
			// show book
			@RequestMapping(value = "/books/{reference}/user", method = RequestMethod.GET)
			public String showBook(@PathVariable("reference") String reference, Model model,HttpServletRequest request) {
				  HttpSession session=request.getSession(false);
				    Client c = (Client) session.getAttribute("Client");
				List <DemandeEmprunt> d=metier.find_demande_emprunt(c.getLogin());
		        model.addAttribute("nbre", d.size());
				Livre livre = metier.getLivre(reference);
				if (livre == null) {
					model.addAttribute("css", "danger");
					model.addAttribute("msg", "User not found");
				}
				model.addAttribute("livre", livre);

				return "show detail book";

			}
			
			// get update profile
			@RequestMapping(value = "/{login}/update", method = RequestMethod.GET)
			public String getprofile(@PathVariable("login") String login, Model model,HttpServletRequest request) {

				Client c = metier.getClient(login);
			
				List <DemandeEmprunt> d=metier.find_demande_emprunt(c.getLogin());
	            model.addAttribute("nbre", d.size());
			
		          model.addAttribute("c",c);

				return "update profile";

			}
		    //your profile
		    @RequestMapping(value="/you" , method=RequestMethod.GET )
		    public ModelAndView your_profile (HttpServletRequest request, Model model)
		    { HttpSession session=request.getSession(false);
		    Client a = (Client) session.getAttribute("Client"); 
		    Client c = metier.getClient(a.getLogin());
		    List <DemandeEmprunt> d=metier.find_demande_emprunt(c.getLogin());
            model.addAttribute("nbre", d.size());
	          model.addAttribute("c",c);
		            return new ModelAndView("your profile");
		    }
			
			//post update form
			@RequestMapping(value = "update", method = RequestMethod.POST)
			public String updateprofile(@ModelAttribute("c")  Client client,Model model,HttpServletRequest request,
					@RequestParam(value = "image", required = false) MultipartFile image, HttpServletRequest Request
				){ 
				if (!image.isEmpty()) {
					try {
					String filename = image.getOriginalFilename();
					String filepath = savephoto(filename, image, Request);
					client.setPhoto(filename);
				} catch (IOException e) {
					System.out.println("=>erreur file IO exception");
				}}
				client.setRole("Simple user");
				metier.updateClient(client);
				 Client c = metier.getClient(client.getLogin());
		          model.addAttribute("c",c);
		          List <DemandeEmprunt> d=metier.find_demande_emprunt(c.getLogin());
		            model.addAttribute("nbre", d.size());
				return "your profile";
				
			}
			private String savephoto(String filename, MultipartFile image, HttpServletRequest req) throws RuntimeException, IOException {
				try {
					// ! Here add Code to check for '..|\|/' and special chars for
					// security !

					String folder="C:/Users/nouha/Desktop/Nouveau dossier/BibliothequeV2/UserImage";
					String filepath = folder + "/" + filename;
					System.out.println(filepath) ;
					File file = new File(filepath);
					FileUtils.writeByteArrayToFile(file, image.getBytes());
					System.out.println("Go to :  " + file.toString() + " and verify that the photo has been uploaded.");
					return filepath;
				} catch (IOException e) {
					throw e;
				}
			}
			//notification
			 @RequestMapping(value="notification" , method=RequestMethod.GET )
		    	public ModelAndView notif (HttpServletRequest request, Model model)
		    		{ 		HttpSession session=request.getSession(false);
		    				Client a = (Client) session.getAttribute("Client"); 
		    				List <DemandeEmprunt> d=metier.find_demande_emprunt(a.getLogin());
		    			if (d.isEmpty()) 
		    				{
		    				return new ModelAndView("notif");}
		    			else 
		    			{model.addAttribute("emprunt", d); 
		    			
		    				model.addAttribute("nbre", d.size()); 
		    				ArrayList<String> li = new ArrayList<String>();
		    				 int i =0;
		    				// d.iterator().hasNext();
		    			if (!(d.isEmpty())) { 
		    				for (DemandeEmprunt x : d) {
								
		    				Livre l=metier.getLivre(x.getReference());
		    				li.add(i, l.getEtat());	    			
		    				i++;
		    			}	
		    			System.out.println(i);
		    			System.out.println(li);		    			
		    				model.addAttribute("msg3", li);
		    			}
		    				return new ModelAndView("notif");}
		    			}
			// delete demande emprunt
				@RequestMapping(value = "/emprunt/{id}/delete", method = RequestMethod.POST)
				public String deleteBook(@PathVariable("id") int id, 
					final RedirectAttributes redirectAttributes) {
					metier.deleteDemEmp(id);
					return "redirect:/notification";
				}
			 
			
			}


	



