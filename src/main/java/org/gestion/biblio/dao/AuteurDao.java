package org.gestion.biblio.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.gestion.biblio.model.Auteur;

public class AuteurDao implements IAuteurDao {
	private EntityManager em ;
	@Override
	public Auteur addAuteur(Auteur auteur) {
		// TODO Auto-generated method stub
		em.persist(auteur);
		return auteur;
	}

	@Override
	public List<Auteur> getAuteur() {
		// TODO Auto-generated method stub
		Query req=em.createQuery("select c from Auteur c");
		return req.getResultList();
		
	}

}
