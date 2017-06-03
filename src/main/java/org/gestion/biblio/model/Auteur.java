package org.gestion.biblio.model;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity

public class Auteur  implements java.io.Serializable{


		
		@Override
	public String toString() {
		return "Auteur [AuteurID=" + AuteurID + ", Nom=" + Nom + ", Prenom=" + Prenom + "]";
	}

		private int AuteurID;
		private String Nom;		
		private String Prenom;

		
		

		public Auteur() {
			super();
			// TODO Auto-generated constructor stub
		}


		public Auteur(String nom, String prenom) {
			super();
			Nom = nom;
			Prenom = prenom;
			
		}
		public Auteur(String nom) {
			super();
			Nom = nom;
			
			
		}



		@Id 
		@GeneratedValue(strategy = GenerationType.IDENTITY)

		public int getAuteurID() {
			return AuteurID;
		}

		public void setAuteurID(int auteurID) {
			AuteurID = auteurID;
		}

		public String getNom() {
			return Nom;
		}

		public void setNom(String nom) {
			Nom = nom;
		}

		public String getPrenom() {
			return Prenom;
		}

		public void setPrenom(String prenom) {
			Prenom = prenom;
		}

		
		

}
