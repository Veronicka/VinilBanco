package fatec.com.model;

import java.util.ArrayList;


public class Inventario {
	public static Inventario instance;
	public static ArrayList<Categoria> inventario;
	public static ArrayList<Vendidos> vendidos = new ArrayList<Vendidos>();
	public static ArrayList<Categoria> carrinho = new ArrayList<Categoria>();

	public static Inventario getInstance(){
		if(instance == null){
			instance = new Inventario();
		}
		return instance;
	}
	
	private Inventario() {
		inventario = new ArrayList<Categoria>();
		Categoria ca = new Categoria(1, "USADO - Supersax e L.A. Voices LP", "01/10/2015", 15.00f, "img/im1.jpg", 21, "Jazz", 15);
		Inventario.inventario.add(ca);
		ca = new Categoria(2, "USADO - Bee Gees - Cucumber Castle LP", "29/09/2015", 25.00f, "img/im2.jpg", 23, "Pop-rock", 16);
		Inventario.inventario.add(ca);
		ca = new Categoria(3, "USADO - America - Alibi LP", "29/09/2015", 18.00f, "img/im3.jpg", 20, "Pop-rock", 19);
		Inventario.inventario.add(ca);
		ca = new Categoria(4, "NOVO - Patto - Patto 1970 Akarma LP", "29/09/2015", 130.00f, "img/im4.jpg", 18, "Rock", 13);
		Inventario.inventario.add(ca);
		ca = new Categoria(5, "NOVO - AC/DC - Anything Goes IN Leipzig LP Duplo", "29/09/2015", 160.00f, "img/im5.jpg", 19, "Rock", 10);
		Inventario.inventario.add(ca);
		ca = new Categoria(6, "NOVO - Aretha Franklin - Aretha Now LP", "29/09/2015", 120.00f, "img/im6.jpg", 25, "Blues", 23);
		Msg m = new Msg("Amanda", "Linda Voz");
		ca.getMsg().add(m);
		Inventario.inventario.add(ca);
	}
	
	public static ArrayList<Categoria> getInventario() {
		return inventario;
	}


}
