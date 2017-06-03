package org.gestion.biblio.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;
@Entity	  
@Table(name="LIVRE")

public class Livre implements Serializable  {
	@Id   
	@NotEmpty(message="Reference is required!")
	private String reference;
	@NotEmpty(message="Author is required!")
	private String titre;
	@NotEmpty    (message="Category is required!")
	private String categorie ;
	@NotEmpty (message="Author is required!")
	private String auteur;
	@NotEmpty (message="Description is required!")
	private String description;

	private String photo;
	private String etat;

	    public String getEtat() {
			return etat;
		}

		public void setEtat(String etat) {
			this.etat = etat;
		}

		public Livre(String reference, String titre, String categorie, String auteur) {
			this.reference = reference;
			this.titre = titre;
			this.categorie = categorie;
			this.auteur = auteur;
		}

		@Override
		public String toString() {
			return "Livre [reference=" + reference + ", titre=" + titre + ", categorie=" + categorie + ", auteur="
					+ auteur + ", description=" + description + ", photo=" + photo + "]";
		}

		public Livre() {        
	    }

	    public String getReference() {
	        return reference;
	    }

	    public void setReference(String reference) {
	        this.reference = reference;
	    }

	    public String getTitre() {
	        return titre;
	    }

	    public void setTitre(String titre) {
	        this.titre = titre;
	    }

	    public String getCategorie() {
	        return categorie;
	    }

	    public void setCategorie(String categorie) {
	        this.categorie = categorie;
	    }

	    public String getAuteur() {
	        return auteur;
	    }

	    public void setAuteur(String auteur) {
	        this.auteur = auteur;
	    }

	    public String getDescription() {
	        return description;
	    }

	    public void setDescription(String description) {
	        this.description = description;
	    }

	    public String getPhoto() {
	        return photo;
	    }

	    public void setPhoto(String photo) {
	        this.photo = photo;
	    }
	    
	    public boolean isNew() {
			return (this.reference == null);
		} 
	}

