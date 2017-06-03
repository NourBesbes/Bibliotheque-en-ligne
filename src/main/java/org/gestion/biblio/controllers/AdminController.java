package org.gestion.biblio.controllers;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.io.FileUtils;
import org.gestion.biblio.Metier.IBiblioMetier;
import org.gestion.biblio.form.LivreForm;
import org.gestion.biblio.model.Auteur;
import org.gestion.biblio.model.Client;
import org.gestion.biblio.model.Livre;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
@Controller 
public class AdminController {
	private final Logger logger = LoggerFactory.getLogger(AdminController.class);
ClassPathXmlApplicationContext context =new ClassPathXmlApplicationContext(new String[]{"applicationContext.xml"} );
	
	IBiblioMetier userService = (IBiblioMetier) context.getBean("metier");
	//IAuteurService auteurService=(IAuteurService) context.getBean("metier");
	
	
	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public String showAllUsers(Model model) {
		 model.addAttribute("users",userService.getClients());
		return "users/list";
	}	
	
	@RequestMapping(value = "/users/{login}/delete", method = RequestMethod.POST)
	public String deleteUser(@PathVariable("login") String login, 
		final RedirectAttributes redirectAttributes) {

		logger.debug("deleteUser() : {}", login);

		userService.deleteClient(login);
		
		redirectAttributes.addFlashAttribute("css", "success");
		redirectAttributes.addFlashAttribute("msg", "User is deleted!");
		
		return "redirect:/users";
	}
	
	@RequestMapping(value = "/users/{login}", method = RequestMethod.GET)
	public String showUser(@PathVariable("login") String login, Model model) {

		logger.debug("showUser() login: {}", login);

		Client user = userService.getClient(login);
		if (user == null) {
			model.addAttribute("css", "danger");
			model.addAttribute("msg", "User not found");
		}
		model.addAttribute("user", user);

		return "users/show";

	}	

	// show the books
		@RequestMapping(value = "/books", method = RequestMethod.GET)
		public String showAllBooks(Model model) {

			logger.debug("showAllBooks()");
			model.addAttribute("books", userService.getLivres());
			return "books/list";

		}
		
		//show non dispo book
		@RequestMapping(value = "/books1", method = RequestMethod.GET)
		public String showAllBooks1(Model model) {

			logger.debug("showAllBooks()");
			model.addAttribute("books", userService.getLivresdispo());
			System.out.println("books");
			return "books/listdispo";

		}
		
		@RequestMapping(value = "/books", method = RequestMethod.POST)
		public String saveBook(@ModelAttribute("bookForm") @Valid Livre livre,
				BindingResult result, Model model, final RedirectAttributes redirectAttributes,
				@RequestParam(value = "image", required = false) MultipartFile image, HttpServletRequest Request) 
		{
			if (result.hasErrors()) {
				return "books/bookForm";
			 } 
			else {

				// Add message to flash scope
				redirectAttributes.addFlashAttribute("css", "success");
				if (userService.isNew(livre))			
				{   System.out.println("ADD");
					userService.addLivre(livre) ;
					redirectAttributes.addFlashAttribute("msg", "Book added successfully!");
				}
				else
				{   System.out.println("UPDATE");
				    userService.updateBook(livre);
				    redirectAttributes.addFlashAttribute("msg", "Book updated successfully!");
				}
				if (!image.isEmpty()) {
					try {
					String filename = image.getOriginalFilename();
					String filepath = savephoto(filename, image, Request);
					livre.setPhoto(filename);
				} catch (IOException e) {
					System.out.println("=>erreur file IO exception");
				}
					List<Auteur> ListeAuteur = userService.getAuteur() ;
					model.addAttribute("Listeauteur", ListeAuteur);
							
				userService.saveOrUpdate(livre);
				
				// POST/REDIRECT/GET
				}
				return "redirect:/books/" + livre.getReference();	
			}
		}
		// show add user form
		@RequestMapping(value = "/books/add", method = RequestMethod.GET)
		public String showAddBookForm(Model model) {

			logger.debug("showAddBookForm()");

			Livre livre = new Livre();			
			model.addAttribute("bookForm", livre);

			return "books/bookForm";
		}

		// show update form
		@RequestMapping(value = "/books/{reference}/update", method = RequestMethod.GET)
		public String showUpdateBookForm(@PathVariable("reference") String reference, Model model) {

			logger.debug("showUpdateBookForm() : {}", reference);

			Livre livre = userService.getLivre(reference);
			model.addAttribute("bookForm", livre);
						
			
			return "books/bookForm";

		}

		// delete book
		@RequestMapping(value = "/books/{reference}/delete", method = RequestMethod.POST)
		public String deleteBook(@PathVariable("reference") String reference, 
			final RedirectAttributes redirectAttributes) {

			logger.debug("deleteBook() : {}", reference);

			userService.deleteLivre(reference);
			
			redirectAttributes.addFlashAttribute("css", "success");
			redirectAttributes.addFlashAttribute("msg", "Book is deleted!");
			
			return "redirect:/books";

		}

		// show book
		@RequestMapping(value = "/books/{reference}", method = RequestMethod.GET)
		public String showBook(@PathVariable("reference") String reference, Model model) {

			logger.debug("showBook() reference: {}", reference);
	
			Livre livre = userService.getLivre(reference);
			System.out.println("hello11");
			if ( (livre.getAuteur() == null)||(livre.getCategorie() == null)||(livre.getTitre() == null) )
			{   System.out.println("hello");
				model.addAttribute("css", "danger");
				model.addAttribute("msg", "Book not found");
				return "books/bookForm" ;
			}
			model.addAttribute("livre", livre);

			return "books/show";
		}
		//change etat book
		@RequestMapping(value = "/books/{reference}/{id}/change", method = RequestMethod.GET)
		public String showBook1(@PathVariable("reference") String reference,@PathVariable("id") int id, Model model) {

			logger.debug("showBook() reference: {}", reference);

			userService.changebook(reference,id);
			model.addAttribute("books", userService.getLivresdispo());

			return "books/listdispo";

		}
		
		
		
		private String savephoto(String filename, MultipartFile image, HttpServletRequest req) throws RuntimeException, IOException {
			try {
				String folder="D:/Eclipse_Project/BibliothequeV2/src/main/webapp/resources/image";
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
		

		@RequestMapping(value = "/historique", method = RequestMethod.GET)
		public String showHistory(Model model) {

			logger.debug("showHistory()");
			 model.addAttribute("histo",userService.getEmprunts());
		      
			 
			 return "books/historique";

		}
		@RequestMapping(value = "/historique/{id}/delete", method = RequestMethod.POST)
		public String deleteHistory(@PathVariable("id") int id, 
			final RedirectAttributes redirectAttributes) {

			logger.debug("deleteHistory() : {}", id);

			userService.deleteEmprunt(id);
			
			redirectAttributes.addFlashAttribute("css", "success");
			redirectAttributes.addFlashAttribute("msg", "Borrowed Book is deleted!");
			
			return "redirect:/historique";
		}
		
		// book recherché
		@RequestMapping(value = "/recherchebook", method = RequestMethod.POST)
		public String findbook( @Valid LivreForm u,
				BindingResult result, Model model) {
			   if (result.hasErrors())
			    {return "recherche" ;}
			    else {
			    	List <Livre> i = userService.RechercheLivre(u.getCode());
			 
			    	if (i.isEmpty()) {
			      	  model.addAttribute("css", "warning");
		        	  model.addAttribute("css1", "Warning ! ");
		              model.addAttribute("msg1", "No Such Book, Try Again Please ! ");
		      		model.addAttribute("books", userService.getLivres());
		              return "books/list";
			    	} else
			        	u.setLivre(i);
		
				model.addAttribute("Livre",u);
				return "books/list" ;}
			}
		
		// user recherché
		@RequestMapping(value = "/rechercheuser", method = RequestMethod.POST)
		public String finduser(@ModelAttribute("nclient")Client nclient,
				BindingResult result, Model model) {
			   if (result.hasErrors())
			    {return "users/list" ;}
			    else {
			    	
			    	List<Client> c = userService.RechercheClient(nclient.getLogin());	
			    	
			    	if (c.isEmpty()) {
				      	  model.addAttribute("css", "warning");
			        	  model.addAttribute("css1", "Warning ! ");
			              model.addAttribute("msg1", "No Such User, Try Again Please ! ");
			              model.addAttribute("users",userService.getClients());
			              return "users/list";
				    	} else{
				model.addAttribute("Livre",c);
				return "users/list" ;}
			}}

}