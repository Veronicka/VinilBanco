package fatec.com.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fatec.com.model.Categoria;
import fatec.com.model.Inventario;
import fatec.com.model.Vendidos;

@WebServlet("/venda")
public class Venda extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected static float soma = 0;
	
	private static String getDateTime() { 
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss"); 
		Date date = new Date(); 
		return dateFormat.format(date); 
	}
	
    public Venda() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sessao = request.getSession();
		String i = request.getParameter("id");
		String data = getDateTime();
		Vendidos v = null;
		Vendidos vend = null;
		int id=0;
		
		if(Autenticador.user != null){
			if(Inventario.carrinho != null && !Inventario.carrinho.isEmpty()){
				for(Categoria c: Inventario.carrinho){
					for(Categoria inv: Inventario.inventario){
						if(c.getId().equals(inv.getId())){
							vend = new Vendidos(inv.getId(), inv.getNome(), inv.getCreation(), inv.getPreco(), inv.getQuant(), inv.getCateg(),inv.getQuantVend(), data, inv.getImg());
							Inventario.vendidos.add(vend);
							int qu = inv.getQuant();
							int quv = inv.getQuantVend();
							inv.setQuant(qu-1);
							inv.setQuantVend(quv+1);
							soma+=inv.getPreco();
						}
					}
				}
				
				sessao.setAttribute("carr", Inventario.carrinho);
				sessao.setAttribute("somaTotal", soma);
				response.sendRedirect(request.getContextPath() + "/compraRealizada.jsp");
			}else if (i != null) {
				try {
					id = Integer.parseInt(i);
				} catch (Exception e) {
					e.printStackTrace();
				}
				for (int j = 0; j < Inventario.inventario.size(); j++) {
					if (Inventario.inventario.get(j).getId().equals(id)) {
						v = new Vendidos(Inventario.inventario.get(j).getId(), Inventario.inventario.get(j).getNome(), Inventario.inventario.get(j).getCreation(), Inventario.inventario.get(j).getPreco(), Inventario.inventario.get(j).getQuant(), Inventario.inventario.get(j).getCateg(), Inventario.inventario.get(j).getQuantVend(), data, Inventario.inventario.get(j).getImg());
						Inventario.vendidos.add(v);
						int q = Inventario.inventario.get(j).getQuant();
						int qv = Inventario.inventario.get(j).getQuantVend();
						Inventario.inventario.get(j).setQuant(q-1);
						Inventario.inventario.get(j).setQuantVend(qv+1);
					}
				}
				sessao.setAttribute("venda", v);
				response.sendRedirect(request.getContextPath() + "/compraRealizada.jsp");

			}
		}else{
			response.sendRedirect(request.getContextPath() + "/login.jsp");
		}
	}

}
