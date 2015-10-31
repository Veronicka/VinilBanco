package fatec.com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fatec.com.model.Inventario;

@WebServlet("/limpar")
public class Limpar extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Limpar() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sessao = request.getSession();
		Inventario.carrinho.clear();
		Venda.soma = 0;
		Carrinho.soma = 0;
		response.sendRedirect("index.jsp");
		sessao.setAttribute("carrinho", Inventario.carrinho);
		sessao.setAttribute("soma", Carrinho.soma);
	}

}
