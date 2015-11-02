<%@page import="fatec.com.model.Vendidos"%>
<%@page import="fatec.com.controller.Autenticador"%>
<%@page import="fatec.com.model.Msg"%>
<%@page import="fatec.com.model.Inventario"%>
<%@page import="fatec.com.model.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="fatec.com.model.Categoria"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/estilo.css" rel="stylesheet">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/crudAjax.js"></script>
<title>ViniStore - Venda</title>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
		    <!-- Brand and toggle get grouped for better mobile display -->
   			<div class="navbar-header">
      			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        			<span class="sr-only">Toggle navigation</span>
        			<span class="icon-bar"></span>
        			<span class="icon-bar"></span>
        			<span class="icon-bar"></span>
      			</button>
      			<a class="navbar-brand" href="index.jsp">Vinil Store</a>
    		</div>
       	  	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      			<ul class="nav navbar-nav">
        			<li class="active"><a href="index.jsp">Novos<span class="sr-only">(current)</span></a></li>
        			<%if(Autenticador.user != null){%>
        				<%if(Autenticador.user.getEhFuncionario()){%>
        					<li><a href="relatorioVendas.jsp">Relatório</a></li>
        					<li ><a href="inserirVinil.html">Inserir Vinil</a></li>
        					<%}else%> <li id="iV" ><a href="inserirVinil.html">Inserir Vinil</a></li>
        			<%}%>
        			
        		</ul>
        		<form class="navbar-form navbar-left" role="search">
                    <div class="form-group"><input type="text" class="form-control"></div>
                        <button type="submit" class="btn btn-default">
                            Pesquisar
                        </button>
                </form>
        		<ul class="nav navbar-nav navbar-right">
        			<li><a href="carrinho.jsp" class="glyphicon glyphicon-shopping-cart btn-lg"></a></li>
	        		<%if(Autenticador.user == null){%>
	        			<li><a href="login.jsp" id="log">Login</a></li>  			
	        		<%}else{%>
	        			<%Autenticador.user = null;%>
	        			<li><a href="index.jsp" id="log">Logout</a></li>
	        		<%}%>
        		</ul>
        	</div>
  		</div>
</nav>
<br/><br/><br/>

    <div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
        </div>
        <div class="col-md-8">
           <h2>Vinis</h2>
           <hr>
           <%Categoria cat = (Categoria) session.getAttribute("cat"); %>
           <%ArrayList<Categoria> vendidos = (ArrayList<Categoria>) session.getAttribute("vendidos"); %>
           <div id="vendaVinis">
           <%if(cat != null){%>
           		<div class="col-md-5" align="center">
		  			<a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-516777" href="#panel-element-566363">
		  			<img src="<%=cat.getImg()%>" class="img-thumbnail" style="width: 250px; height: 250px;" /></a>
	  			</div>
		  	  <div>
		  	  	<br/>
		  	  	<h4><%=cat.getNome() %></h4>
		  	    <h5>Quantidade vendidos: <%=cat.getQuantVend()%></h5>
		  	    <br/>
		  	  	<h3>R$ <%=cat.getPreco() %></h3>
		  	  	
		  	  	<div id="botoesCompras" align="center">
			  	  	<form action="carrinho">
		  	  			<a class="btn btn-default" href="vendaVinil.jsp">Comprar</a>
			  	  		<button type="submit" style="float:right;" class="btn btn-default">Add Carrinho<input hidden="hidden" type="text" name="id" value="<%=cat.getId()%>"></input></button>
			  	  	</form>
		  	  	</div>
		  	  </div>
	  		<%}%>
           </div>
           <div id="avaliacao">
           <h4>Quantidade vendida</h4>
	           <div align="center" class="progress">
	           <%int c = (cat.getQuantVend()*100)/cat.getQuant(); %>
				  <div class="progress-bar" role="progressbar" aria-valuenow="<%=c%>" aria-valuemin="0" aria-valuemax="100" style="width: <%=c%>%;">
				    <%=c%>%
				  </div>
				</div>
		   <h4>Recomendação</h4>
		   <%ArrayList<Vendidos> vend = (ArrayList<Vendidos>) session.getAttribute("vend"); %>
		   <%if(vend != null){ %>
		   	<div class="row">
		   		<%for(Vendidos ve: vend){ %>
		   			<div class="col-md-3" align="center">
		   				<a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-516777" href="#panel-element-566363">
		   					<button id="botaoComprar" type="submit"><input hidden="hidden" type="text" name="id" value="<%=ve.getId()%>"></input>
		   						<img src="<%=ve.getImg() %>" class="img-thumbnail" style="width: 200px; height: 200px;" /><input hidden="hidden" type="text" name="categ" value="'+categoria.categ+'"></input>
		   						<div><h4><%=ve.getNome() %></h4></div>
		   					</button>
		   				</a>
		   				<div><h3>R$<%=ve.getPreco() %></h3></div>
		   				<img src="img/ajax-loader.gif" hidden="hidden" />
		   				
		   			</div>
		   		<%} %>
            </div>
		   <%}else{ %>
		   <h4>Sem compras anteriores.</h4>
		   <%} %>
		   <br />
           <h4>Avaliação dos Clientes</h4>
	           <div align="center" class="progress">
				  <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
				    60%
				  </div>
				</div>
				<br/>
				<h4>Comentários</h4>
				<br />
	        	<%if(cat.getId()!=null){%>
	        		<%for(Categoria vc: Inventario.inventario){ %>
	        			<%if(vc.getId().equals(cat.getId())){ %>
	        				<%for(Msg m: cat.getMsg()){ %>
	        					<div style="padding:20px;">
		        					<div style="float: left;"><b><%=m.getPessoa() %></b></div>
		        					<div  style="float: right;width: 500px;"><%=m.getMensagem() %></div>
	        					</div>
		        					<hr>
	        				<%} %>
	        			<%}%>
	        		<%} %>
	        	<%}else{ %>
	        	<h4>Não há comentários</h4>
	        	<%} %>
	        	<br/>
	        	<div align="center">
					<form action="mensagem">
						<input name="id" value="<%=cat.getId()%>" hidden="hidden"><textarea rows=4 cols=10 name="mensagem" class="form-control" placeholder="Deixe seu comentário aqui"></textarea>
						<br/>
						<button type="submit" class="btn btn-default">Enviar</button>
					</form>
				</div>
	        </div>
        </div>
    <div class="col-md-2">
    </div>
  </div>
  </div>
      <footer>
      <div>
        <div class="row" id="corbaixo">
        <br/>
            <div class="col-md-2">
            </div>
            <div class="col-md-8">
                    <div class="row">
                        <div class="col-md-4">
                        <h4>INFORMAÇÕES</h4>
                             <div><a href="#" class="btn" type="button"><font color="black">QUEM SOMOS</font></a></div>
                             <div><a href="#" class="btn" type="button"><font color="black">COMO COMPRAR</font></a></div>
                             <div><a href="#" class="btn" type="button"><font color="black">TROCAS E DEVOLUÇÕES</font></a></div>
                             <div><a href="#" class="btn" type="button"><font color="black">POLÍTICAS DE ENTREGA</font></a></div>
                             <br />
                        </div>
                    <div class="col-md-4">
                    <h4>FALE CONOSCO</h4>
                        <br />
                        <address>
                         <strong>Vinil Store.</strong><br> Jacareí, SP<br> São Paulo, BR 94107<br>
                         <abbr title="Phone">Tel:</abbr> (123) 456-7890
                        </address>
                    </div>
                    <div class="col-md-4" align="center">
                    <h4>RECEBA NOVIDADES</h4>
                        <br />
                        <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">
                                Email
                            </label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="inputEmail3">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10" align="center">
                                <button type="submit" class="btn btn-default" >
                                    Enviar
                                </button>
                            </div>
                        </div>
                    </form>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
            </div>
        </div>
    </div>
    <div class="row" id="rodape" align="center">
        <div class="col-md-12">
        <font color="white">Copyright 2015 @ Verônica e Luís</font>
        </div>
    </div>
  </footer>
  </body>
</html>