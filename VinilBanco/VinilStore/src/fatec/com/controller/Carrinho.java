package fatec.com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fatec.com.model.Inventario;
import fatec.com.model.Vendidos;

@WebServlet("/carrinho")
public class Carrinho extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static float soma = 0;

    public Carrinho() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sessao = request.getSession();
		String i = request.getParameter("id");
		int id = 0;
		if (i != null) {
			try {
				id = Integer.parseInt(i);
			} catch (Exception e) {
				e.printStackTrace();
			}
			for (int j = 0; j < Inventario.inventario.size(); j++) {
				if (Inventario.inventario.get(j).getId().equals(id)) {
					Inventario.carrinho.add(Inventario.inventario.get(j));
					soma+=Inventario.inventario.get(j).getPreco();
				}
			}
		}
		sessao.setAttribute("carrinho", Inventario.carrinho);
		sessao.setAttribute("soma", soma);
		response.sendRedirect(request.getContextPath() + "/carrinho.jsp");
	}

}
