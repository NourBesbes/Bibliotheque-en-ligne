package org.gestion.biblio.Metier;

import java.util.List;

import org.gestion.biblio.dao.BiblioDao;
import org.gestion.biblio.dao.IBiblioDao;
import org.gestion.biblio.model.Auteur;
import org.gestion.biblio.model.Client;
import org.gestion.biblio.model.DemandeEmprunt;
import org.gestion.biblio.model.Emprunt;
import org.gestion.biblio.model.Livre;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
@Transactional
public class BiblioMetier implements IBiblioMetier{

	private IBiblioDao dao ;
	public List<DemandeEmprunt> find_demande_emprunt(String login) {return dao.find_demande_emprunt(login);}

	public void deleteDemEmp(int id){dao.deleteDemEmp(id);}
	public List<Client> RechercheClient(String livre) {return dao.RechercheClient(livre);}
	 public void addEmp(DemandeEmprunt em) {dao.addEmp(em);}
	public void updateClient(Client c) {dao.updateClient(c);}
	 public void changebook(String ref,int id) {
		 dao.changebook(ref,id);
	 }
		

		
		public boolean isNew(Livre l) 
		{ return dao.isNew(l);}
	 public boolean verifdispo (String ref){
		Livre l= dao.getLivre(ref);
		return (l.getEtat().equals("Disponible"));
	 }
	 public List<Client> connect (String login, String password)
	 {return dao.connect(login, password);}
	
	 public List<Emprunt> getLivresdispo(){
		 return dao.getLivresdispo();
	 }
	 public int nombreEmprunt() {
			// TODO Auto-generated method stub
			 List<Emprunt> e =getEmprunts();
			 int i=0 ;
			 for (Emprunt a : e){
				System.out.println("******************");
				if (a.getDateRetour() == null)
				{ i++ ;
				}
			}
			return i ;
	}
	
	public Client addClient(Client client) {
		// TODO Auto-generated method stub
		return dao.addClient(client);
	}
	public List<Livre> RechercheLivre(String livre) {
		return dao.RechercheLivre(livre);}

	public Livre addLivre(Livre livre) {
		// TODO Auto-generated method stub
		return dao.addLivre(livre);
	}

	public Emprunt addEmprunt(Emprunt emprunt) {
		// TODO Auto-generated method stub
		return dao.addEmprunt(emprunt);
	}

	public void dateRetour (Emprunt emprunt) {
		// TODO Auto-generated method stub
		 String format = "dd/MM/yy H:mm:ss"; 

   	  java.text.SimpleDateFormat formater = new java.text.SimpleDateFormat( format ); 
   	  java.util.Date date = new java.util.Date(); 
   	String reportDate = formater.format(date);
     emprunt.setDateRetour(reportDate);
		 dao.updateEmprunt(emprunt);
	}

	
	public List<Client> getClients() {
		// TODO Auto-generated method stub
		return dao.getClients();
	}


	public List<Livre> getLivres() {
		// TODO Auto-generated method stub
		return dao.getLivres();
	}


	public List<Emprunt> getEmprunts() {
		// TODO Auto-generated method stub
		return dao.getEmprunts();
	}


	public IBiblioDao getDao() {
		return dao;
	}

	public void setDao(IBiblioDao dao) {
		this.dao = dao;
	}

	@Override
	public void deleteClient(String login) {
		// TODO Auto-generated method stub
		dao.deleteClient(login);
	}

	@Override
	public Client getClient(String login) {
		// TODO Auto-generated method stub
		return dao.getClient(login);
	}

	@Override
	public Livre getLivre(String reference) {
		// TODO Auto-generated method stub
		return dao.getLivre(reference);
	}

	@Override
	public void deleteLivre(String reference) {
		// TODO Auto-generated method stub
		dao.deleteLivre(reference);
	}

	@Override
	public void updateBook(Livre livre) {
		// TODO Auto-generated method stub
		dao.updateBook(livre);
	}
	@Override
	public void saveOrUpdate(Livre livre) {

		if (livre.isNew()) {
			dao.addLivre(livre);
		} else {
			dao.updateBook(livre);
		}

	}
	
	public List<Auteur> getAuteur() {
		// TODO Auto-generated method stub
		return dao.getAuteur();
	}

	@Override
	public void deleteEmprunt(int id) {
		// TODO Auto-generated method stub
		dao.deleteEmprunt(id);
		
	}



}
