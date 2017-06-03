package org.gestion.biblio.model;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
public class Categorie implements java.io.Serializable {

	
	private int CategorieID;		
	private String Nom;
	
	@Override
	public String toString() {
		return "Categorie [CategorieID=" + CategorieID + ", Nom=" + Nom +  "]";
	}

	public Categorie() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Categorie(int categorieID, String nom) {
		super();
		CategorieID = categorieID;
		Nom = nom;
		
	}

	

	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)

	public int getCategorieID() {
		return CategorieID;
	}

	public void setCategorieID(int categorieID) {
		CategorieID = categorieID;
	}

	public String getNom() {
		return Nom;
	}

	public void setNom(String nom) {
		Nom = nom;
	}

	
	public Categorie( String nom) {
		super();
		
		Nom = nom;
	}

	
}
