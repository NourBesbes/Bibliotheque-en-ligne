package org.gestion.biblio.Metier;

import java.util.List;

import org.gestion.biblio.dao.IAuteurDao;
import org.gestion.biblio.model.Auteur;

public class AuteurService implements IAuteurService {
	private IAuteurDao dao ;
	@Override
	public Auteur addAuteur(Auteur auteur) {
		// TODO Auto-generated method stub
		return dao.addAuteur(auteur);
	}

	@Override
	public List<Auteur> getAuteur() {
		// TODO Auto-generated method stub
		return dao.getAuteur();
	}

}
