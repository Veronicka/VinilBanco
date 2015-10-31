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

import fatec.com.model.Usuario;

@WebServlet("/login")
public class Autenticador extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static ArrayList<Usuario> listaDeUsuarios = new ArrayList<>();
	
	public Autenticador() {
		super();
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession sessao = request.getSession();		
		String lo = request.getParameter("log");
		String login = request.getParameter("username");
		String senha = request.getParameter("password");
		
		String criar = request.getParameter("criar");
		
		if(lo != null){
			login = null;
			senha = null;
		}
		
		if(criar!=null){
			String n = request.getParameter("novonome");
			String l = request.getParameter("novousername");
			String s = request.getParameter("novapassword");
			
			Usuario user = new Usuario();
			user.setLogin(l);
			user.setSenha(s);
			user.setNome(n);
			user.setEhFuncionario(false);
			
			listaDeUsuarios.add(user);
		}
		
		Usuario temp = new Usuario();
		
		if(listaDeUsuarios.size()==0){			
			Usuario veve = new Usuario();
			veve.setLogin("veve");
			veve.setSenha("123");
			veve.setNome("Verônica");
			veve.setEhFuncionario(true);
			listaDeUsuarios.add(veve);
			
			Usuario luis = new Usuario();		
			luis.setLogin("luis");
			luis.setSenha("321");
			luis.setNome("Luis");
			luis.setEhFuncionario(true);
			listaDeUsuarios.add(luis);		
		}
				
		for(Usuario u : listaDeUsuarios){
			if(u.getLogin().equals(login) && u.getSenha().equals(senha)){
				temp.setLogin(u.getLogin());
				temp.setSenha(u.getSenha());
				temp.setNome(u.getNome());
				temp.setEhFuncionario(u.getEhFuncionario());
			}
		}
		if(temp.getLogin()!=null){		
			request.getSession().setAttribute("usuario", temp);
			sessao.setAttribute("user", temp);
			response.sendRedirect(request.getContextPath() + "/index.jsp");
			
			String json = new Gson().toJson("Logout");
			
			response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
		}
		else {
			response.sendRedirect("login.jsp");
		}
	}
}
