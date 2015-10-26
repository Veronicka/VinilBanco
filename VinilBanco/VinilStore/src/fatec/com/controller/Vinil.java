package fatec.com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fatec.com.model.Inventario;

@WebServlet("/vinil")
public class Vinil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Vinil() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = 0;
		String i = request.getParameter("id");
		if (i != null) {
			try {
				id = Integer.parseInt(i);
			} catch (Exception e) {
				e.printStackTrace();
			}
			for (int j = 0; j < Inventario.inventario.size(); j++) {
				if (Inventario.inventario.get(j).getId().equals(id)) {
					//Inventario.inventario;
				}
			}
			String retorno = "{\"nome\":\"Sucesso\"}";
			response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
			response.getWriter().write(retorno);
		} else {
			response.setStatus(400);
		}
	}

}
