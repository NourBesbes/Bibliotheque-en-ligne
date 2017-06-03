package org.gestion.biblio.form;

import java.util.List;

import javax.validation.constraints.Size;
import org.gestion.biblio.model.Livre;
import org.hibernate.validator.constraints.NotEmpty;

public class LivreForm {
	 @NotEmpty ()
	 private String code;
    private List<Livre> livre;
    
	 public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public List<Livre> getLivre() {
		return livre;
	}
	public void setLivre(List<Livre> i) {
		this.livre = i;
	}

}