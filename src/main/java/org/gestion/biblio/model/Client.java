package org.gestion.biblio.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;


@Entity
@Table(name="CLIENTS")
public class Client implements Serializable {
    public Client() {	
	}

	@Id 
	@NotEmpty(message="Login is required!")
	private String login;
	@NotEmpty(message="Password is required!")
	private String password;
	@NotEmpty(message="CIN is required!")
	private String cin;
	@NotEmpty(message="FirstName is required!")
    private String nom;
	@NotEmpty(message="Name is required!")
    private String prenom;
	@NotEmpty(message="Adress is required!")
    private String adresse;
    @Email
    @NotEmpty(message="Email is required!")
    private String mail;
    
    private boolean enabled;
    private String role;
    private String photo ;
   
    public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public Client(String login, String adresse) {
		super();
		this.login = login;
		this.adresse = adresse;
	}

	@Override
	public String toString() {
		return "Client [login=" + login + ", password=" + password + ", cin=" + cin + ", nom=" + nom + ", prenom="
				+ prenom + ", adresse=" + adresse + ", mail=" + mail + "]";
	}

	public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCin() {
        return cin;
    }

    public void setCin(String cin) {
        this.cin = cin;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
    
   }
