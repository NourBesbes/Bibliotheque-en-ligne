package org.gestion.biblio.dao;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManager;

import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.gestion.biblio.model.Auteur;
import org.gestion.biblio.model.Client;
import org.gestion.biblio.model.DemandeEmprunt;
import org.gestion.biblio.model.Emprunt;
import org.gestion.biblio.model.Livre;
import org.hibernate.Session;
import org.hibernate.SessionFactory;


public class BiblioDao implements IBiblioDao {
   @PersistenceContext
	private EntityManager em ;
	public void addEmp(DemandeEmprunt ema) {
		em.persist(ema);
	}
	public List<DemandeEmprunt> find_demande_emprunt(String login) {
		Query req=em.createQuery("select e from DemandeEmprunt e where e.login=:x and e.dateRetour is null");
		req.setParameter("x",login);
		return req.getResultList();	}
	public boolean isNew(Livre l)
	{
		return (   em.find(Livre.class, l.getReference())== null    );
	}
	public void deleteDemEmp(int id) { DemandeEmprunt c=em.find(DemandeEmprunt.class, id); 
	   em.remove(c);
}
   public void changebook(String ref,int id) {
		Query req=em.createQuery("select c from Livre c where c.reference=:x");
		req.setParameter("x",ref);
		Livre l= (Livre) req.getSingleResult() ;	
		l.setEtat("Disponible");
		Query req2=em.createQuery("select a from Emprunt a where a.id=:y ");
		req2.setParameter("y",id);
		Emprunt e= (Emprunt) req2.getSingleResult();	
		String forma = "dd/MM/yy"; 
  	    java.text.SimpleDateFormat formater = new java.text.SimpleDateFormat( forma ); 
  	    java.util.Date dateRetour = new java.util.Date(); 
  	  String reportDate = formater.format(dateRetour);
		 e.setDateRetour(reportDate);		
   }
 
   public List<Emprunt> getLivresdispo()
   { 	Query req=em.createQuery("from Emprunt  where dateRetour is null " );

	return req.getResultList();}
   
   public  List<Client> connect (String login, String password)
   { Query req=em.createQuery("select l from Client l where l.login=:x and l.password=:y ");
	req.setParameter("x",login);
	req.setParameter("y",password);
	return req.getResultList();	
   }
   
   
   @Override
	public Client addClient(Client client) {
		em.persist(client);	
	return client ;
   }
   @Override
   public void deleteClient(String login)
   {
	   Client c=em.find(Client.class, login); 
	   em.remove(c);
	   }
	@Override
	public Livre addLivre(Livre livre) {
		em.persist(livre);	
		return livre ;
		
	}
	public List<Livre> RechercheLivre(String livre){
		Query req=em.createQuery("select l from Livre l where l.titre=:x or l.categorie=:x or l.auteur=:x or l.reference=:x");
		req.setParameter("x",livre);
		return req.getResultList() ;
	}
	public List<Client> RechercheClient(String livre){
		Query req=em.createQuery("select l from Client l where l.login=:x or l.nom=:x or l.prenom=:x ");
		req.setParameter("x",livre);
		return req.getResultList() ;
	}

	@Override
	public Emprunt addEmprunt(Emprunt emprunt) {
		Query req=em.createQuery("select c from Livre c where c.reference=:x");
		req.setParameter("x",emprunt.getReference());
		Livre l= (Livre) req.getSingleResult() ;	
		l.setEtat("non Disponible");
		em.persist(emprunt);	
		return emprunt ;
		
	}

	@Override
	public List<Client> getClients() {
		Query req=em.createQuery("select c from Client c");
		return req.getResultList();
	}
		
	public Client getClient(String login) {
		Query req=em.createQuery("select c from Client c where c.login=:x");
		req.setParameter("x",login);
		return (Client) req.getSingleResult() ;	
	}
	@Override
	public List<Livre> getLivres() {
		Query req=em.createQuery("select l from Livre l");
		return req.getResultList();
	}

	@Override
	public List<Emprunt> getEmprunts() {
		Query req=em.createQuery("select e from Emprunt e");
		return req.getResultList();
	}
	@Override
	public Livre getLivre(String reference) {
		Query req=em.createQuery("select l from Livre l where l.reference=:x");
		req.setParameter("x",reference);
		return (Livre) req.getSingleResult() ;	
	}
	@Override
	public void deleteLivre(String reference) {

		   Livre c=em.find(Livre.class, reference); 
		   em.remove(c);
		
	}
	@Override
	public void updateBook(Livre livre) {
		em.merge(livre) ;
		
	}
	public void updateEmprunt(Emprunt e) {
		em.merge(e) ;
		
	}
	public void updateClient(Client c) {
		em.merge(c) ;
		
	}

	public List<Auteur> getAuteur() {
		// TODO Auto-generated method stub
		Query req=em.createQuery("select c from Auteur c");
		return req.getResultList();
		
	}


	@Override
	public void deleteEmprunt(int id) {
		Emprunt c=em.find(Emprunt.class, id); 
		   em.remove(c);
		
	}
	@Override
	public int nombreEmprunt() {
		// TODO Auto-generated method stub
		Query req=em.createQuery("select count(*) from Emprunt  where dateRetour is null") ;
	
 
		return req.getFirstResult() ;
	}
	
}
