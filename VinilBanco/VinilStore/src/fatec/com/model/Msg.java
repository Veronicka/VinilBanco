package fatec.com.model;

public class Msg {
	private String pessoa;
	private String mensagem;
	
	public Msg(String pessoa, String mensagem) {
		super();
		this.pessoa = pessoa;
		this.mensagem = mensagem;
	}
	
	public String getPessoa() {
		return pessoa;
	}
	public void setPessoa(String pessoa) {
		this.pessoa = pessoa;
	}
	public String getMensagem() {
		return mensagem;
	}
	public void setMensagem(String mensagem) {
		this.mensagem = mensagem;
	}
	
	

}
