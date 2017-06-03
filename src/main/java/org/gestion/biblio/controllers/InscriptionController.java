package org.gestion.biblio.controllers;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.io.FileUtils;
import org.gestion.biblio.Metier.IBiblioMetier;
import org.gestion.biblio.model.Auteur;
import org.gestion.biblio.model.Client;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
@Controller
public class InscriptionController {
	
	ClassPathXmlApplicationContext context =new ClassPathXmlApplicationContext(new String[]{"applicationContext.xml"} );
	
	IBiblioMetier metier = (IBiblioMetier) context.getBean("metier");
		
	@RequestMapping(value ="/inscrit" , method = RequestMethod.GET)
		public String getInscriptionForm(Model model){
			Client user = new Client();
			model.addAttribute("userForm", user);

			return "inscrit";
		}
		@RequestMapping(value ="/inscrit",method = RequestMethod.POST)
	public String processRegistration(@ModelAttribute("userForm") @Valid Client user, BindingResult bindingResult ,Map<String, Object> model,
			@RequestParam(value = "image", required = false) MultipartFile image, HttpServletRequest Request) {		
	System.out.println(user);
HttpServletRequest curRequest = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
if (bindingResult.hasErrors())
{return "inscrit" ;}
else { 
	if (!image.isEmpty()) {
		try {
		String filename = image.getOriginalFilename();
		String filepath = savephoto(filename, image, Request);
		user.setPhoto(filename);
	} catch (IOException e) {
		System.out.println("=>erreur file IO exception");
	}

		HttpSession session = curRequest.getSession();
		user.setRole("Simple user");
		 session.setAttribute("books", metier.getLivres());
		session.setAttribute("Client", user);
	metier.addClient(user);
	
	// POST/REDIRECT/GET
	}
	
	
			return "home";
			}	
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
}
