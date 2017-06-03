package org.gestion.biblio.validator;

	import org.gestion.biblio.Metier.IBiblioMetier;
import org.gestion.biblio.model.Livre;
import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.beans.factory.annotation.Qualifier;
	import org.springframework.stereotype.Component;
	import org.springframework.validation.Errors;
	import org.springframework.validation.ValidationUtils;
	import org.springframework.validation.Validator;

	@Component
	public class BookFormValidator implements Validator {

		@Autowired
		IBiblioMetier bookService;
		
		@Override
		public boolean supports(Class<?> clazz) {
			return Livre.class.equals(clazz);
		}

		@Override
		public void validate(Object target, Errors errors) {

			Livre livre = (Livre) target;

			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "titre", "NotEmpty.bookForm.titre");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "auteur", "NotEmpty.bookForm.auteur");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "categorie", "NotEmpty.bookForm.categorie");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "photo", "NotEmpty.bookForm.photo");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "description", "NotEmpty.bookForm.description");




	}
}
