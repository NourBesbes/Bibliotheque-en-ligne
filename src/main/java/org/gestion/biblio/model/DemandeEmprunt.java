package org.gestion.biblio.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="DEMANDE_EMPRUNT")
public class DemandeEmprunt {
	   @Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)
		private int id;     
	    private String login ;
	    private String reference ;
	    private Date dateEmprunt;
	    private String dateRetour;
	    private String titre;
		public String getTitre() {
			return titre;
		}
		public void setTitre(String titre) {
			this.titre = titre;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getLogin() {
			return login;
		}
		public void setLogin(String login) {
			this.login = login;
		}
		public String getReference() {
			return reference;
		}
		public void setReference(String reference) {
			this.reference = reference;
		}
		public Date getDateEmprunt() {
			return dateEmprunt;
		}
		public void setDateEmprunt(Date dateEmprunt) {
			this.dateEmprunt = dateEmprunt;
		}
		public String getDateRetour() {
			return dateRetour;
		}
		public void setDateRetour(String dateRetour) {
			this.dateRetour = dateRetour;
		}
		public DemandeEmprunt() {
			super();
		}
		public DemandeEmprunt( String login, String reference, String titre, Date dateEmprunt) {
			super();
		
			this.login = login;
			this.reference = reference;
			this.dateEmprunt = dateEmprunt;
			this.titre = titre;
		}
}
