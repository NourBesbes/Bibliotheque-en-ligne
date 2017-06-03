package test;


import java.util.List;
import org.gestion.biblio.Metier.IBiblioMetier;
import org.gestion.biblio.model.Client;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test {

	public static void main(String[] args) {
	ClassPathXmlApplicationContext context =new ClassPathXmlApplicationContext(new String[]{"applicationContext.xml"} );
IBiblioMetier metier = (IBiblioMetier) context.getBean("metier");
/*metier.addClient(new Client("Cppp","ppppp"));

metier.addLivre(new Livre("Cb7","Adultere","Romance","paulo coelho"));	
*/
metier.addClient(new Client("Cnouhaaaaaa","A2"));
List<Client> L = metier.getClients() ;
for (Client a : L){
	System.out.println("******************");
	System.out.println(a.getAdresse());
	System.out.println(a.getLogin());
	System.out.println(a.getNom());
}
	}
}
