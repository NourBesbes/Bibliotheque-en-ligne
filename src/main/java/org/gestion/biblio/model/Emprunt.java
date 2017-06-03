package org.gestion.biblio.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Entity
@Table(name="EMPRUNT")
public class Emprunt implements Serializable{
    @Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;     
    private String login ;
 /*  @ManyToOne  
   @JoinColumn(name="login")
    private Client client;  
   @ManyToOne  
   @JoinColumn(name="reference")*/
    //private Livre livre;
    private String reference ;
    private Date dateEmprunt;
    private String dateRetour;

    public String getDateRetour() {
		return dateRetour;
	}

	public void setDateRetour(String dateRetour) {
		this.dateRetour = dateRetour;
	}

	public Emprunt(String reference,Date date) {
    	this.reference=reference;
    	this.dateEmprunt=date;
		// TODO Auto-generated constructor stub
	}
	public Emprunt(String reference,Date date,String login) {
    	this.reference=reference;
    	this.dateEmprunt=date;
    	this.login=login;
		// TODO Auto-generated constructor stub
	}

	public Emprunt() {
	
	}

	public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDateEmprunt() {
        return dateEmprunt;
    }

    public void setDateEmprunt(Date dateEmprunt) {
        this.dateEmprunt = dateEmprunt;
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

	
    
}
