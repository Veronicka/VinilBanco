package fatec.com.model;

public class Vendidos {
	private Integer id;
	private String nome;
	private String creation;
	private Float preco;
	private Integer quant;
	private String categ;
	private Integer quantVend;
	private String hora;
	private String img;
	
		
	public Vendidos(Integer id, String nome, String creation, Float preco, Integer quant, String categ, Integer quantVend, String hora, String img) {
		super();
		this.id = id;
		this.nome = nome;
		this.creation = creation;
		this.preco = preco;
		this.quant = quant;
		this.categ = categ;
		this.quantVend = quantVend;
		this.hora = hora;
		this.img = img;
	}
	
	public Integer getQuant() {
		return quant;
	}
	public void setQuant(Integer quant) {
		this.quant = quant;
	}
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCreation() {
		return creation;
	}
	public void setCreation(String creation) {
		this.creation = creation;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public Float getPreco() {
		return preco;
	}

	public void setPreco(Float preco) {
		this.preco = preco;
	}

	public String getCateg() {
		return categ;
	}

	public void setCateg(String categ) {
		this.categ = categ;
	}

	public Integer getQuantVend() {
		return quantVend;
	}

	public void setQuantVend(Integer quantVend) {
		this.quantVend = quantVend;
	}

	public String getHora() {
		return hora;
	}

	public void setHora(String hora) {
		this.hora = hora;
	}
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
}
