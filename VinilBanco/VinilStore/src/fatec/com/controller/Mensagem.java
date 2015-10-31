package fatec.com.controller;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import fatec.com.controller.Autenticador;
import fatec.com.model.Categoria;
import fatec.com.model.Inventario;
import fatec.com.model.Usuario;

@WebServlet("/mensagem")
public class Mensagem extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Usuario user;
	

    public Mensagem() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sessao = request.getSession();
		String msg = request.getParameter("mensagem");
		String i = request.getParameter("id");
		int id = 0;
		try {
			id = Integer.parseInt(i);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(msg!=null){ //tratar para nao inserir mensagem vazia
			user = (Usuario) sessao.getAttribute("user");
			if(user != null && !msg.isEmpty()){
				for(Categoria ca: Inventario.inventario){
					if(ca.getId().equals(id)){
						ca.getMsg().add(msg);
					}
				}
				response.sendRedirect(request.getContextPath() + "/venda.jsp");
			}
			else if(user != null && msg.isEmpty()){
				response.sendRedirect(request.getContextPath() + "/venda.jsp");
			}
			else{
				response.sendRedirect(request.getContextPath() + "/login.jsp");
			}
		}
	}
}
