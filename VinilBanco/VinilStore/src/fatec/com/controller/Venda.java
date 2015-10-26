package fatec.com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fatec.com.model.Categoria;
import fatec.com.model.Inventario;

@WebServlet("/venda")
public class Venda extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Venda() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sessao = request.getSession();
		String i = request.getParameter("id");
		Categoria cat = null;
		
		int id=0;
		if (i != null) {
			try {
				id = Integer.parseInt(i);
			} catch (Exception e) {
				e.printStackTrace();
			}
			for (int j = 0; j < Inventario.inventario.size(); j++) {
				if (Inventario.inventario.get(j).getId().equals(id)) {
					Inventario.vendidos.add(Inventario.inventario.get(j));
					int q = Inventario.inventario.get(j).getQuant();
					int qv = Inventario.inventario.get(j).getQuantVend();
					Inventario.inventario.get(j).setQuant(q-1);
					Inventario.inventario.get(j).setQuantVend(qv+1);
				}
			}
		}
		sessao.setAttribute("vendidos", Inventario.vendidos);
		response.sendRedirect(request.getContextPath() + "/vendaVinil.jsp");
	}

}
