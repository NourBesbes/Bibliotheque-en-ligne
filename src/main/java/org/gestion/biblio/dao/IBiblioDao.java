package org.gestion.biblio.dao;

import java.util.List;

import org.gestion.biblio.model.Auteur;
import org.gestion.biblio.model.Client;
import org.gestion.biblio.model.DemandeEmprunt;
import org.gestion.biblio.model.Emprunt;
import org.gestion.biblio.model.Livre;

public interface IBiblioDao {

public Client addClient(Client client) ;
public Livre addLivre(Livre livre) ;
public Emprunt addEmprunt(Emprunt emprunt) ;
public List<Client> getClients();
public List<Livre> getLivres();
public List<Emprunt> getEmprunts();
public Client getClient(String login);
public void deleteClient(String login);
public Livre getLivre(String reference);
public void deleteLivre(String reference);
public void updateBook(Livre livre) ;
public List<Livre> RechercheLivre(String livre);
public  List<Client> connect (String login, String password);
public List<Emprunt> getLivresdispo();
public void changebook(String ref,int id) ;
public void updateEmprunt(Emprunt e) ;
public List<Auteur> getAuteur() ;
public void deleteEmprunt(int id);
public int nombreEmprunt();
public void updateClient(Client c);
public List<Client> RechercheClient(String livre);
public List<DemandeEmprunt> find_demande_emprunt(String login) ;
public void deleteDemEmp(int id);
public void addEmp(DemandeEmprunt ema) ;
public boolean isNew(Livre l) ;
}
