package fatec.com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import fatec.com.model.Categoria;
import fatec.com.model.Inventario;
import fatec.com.model.Vendidos;

@WebServlet("/vendaVinil")
public class VerVinil extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<Vendidos> vend = new ArrayList<Vendidos>();
	
    public VerVinil() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession sessao = request.getSession();
		String i = request.getParameter("id");
		String categ = request.getParameter("categ");
		Categoria cat = null;
				
		int id=0;
		if (i != null) {
			try {
				id = Integer.parseInt(i);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			if (categ != null) {
				if(Inventario.vendidos!=null && !Inventario.vendidos.isEmpty()){
					for(Vendidos ca: Inventario.vendidos){
						if(ca.getCateg().equals(categ)){
							if(!ca.getId().equals(id) && !vend.contains(ca)){
								vend.add(ca);
							}
						}
					}
				}
				sessao.setAttribute("vend", vend);
			}
			
			for (int j = 0; j < Inventario.inventario.size(); j++) {
				if (Inventario.inventario.get(j).getId().equals(id)) {
					cat = Inventario.inventario.get(j);
				}
			}
			sessao.setAttribute("cat", cat);
			response.sendRedirect(request.getContextPath() + "/venda.jsp");
		} else {
			String retorno = "{\"nome\":\"Campo Obrigatorio\"}";
			response.getWriter().write(retorno);
			response.setStatus(400);
		}
	}

}
