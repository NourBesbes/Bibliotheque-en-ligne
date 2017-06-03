package org.gestion.biblio.Metier;

import java.util.List;


import org.gestion.biblio.model.Auteur;

public interface IAuteurService {
	public Auteur addAuteur(Auteur auteur) ;
	public List<Auteur> getAuteur();
}
