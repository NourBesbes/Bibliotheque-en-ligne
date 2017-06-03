package org.gestion.biblio.dao;

import java.util.List;

import org.gestion.biblio.model.Auteur;

public interface IAuteurDao {

	public Auteur addAuteur(Auteur auteur) ;
	public List<Auteur> getAuteur();
	
}
