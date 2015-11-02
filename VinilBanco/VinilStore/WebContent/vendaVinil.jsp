<%@page import="fatec.com.controller.Autenticador"%>
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
<title>ViniStore - Confirmar Venda</title>
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
	        		<%} %>
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
           <h2>Confirmação da Compra</h2>
           <hr>
           <%Categoria cat = (Categoria) session.getAttribute("cat"); %>
           <%ArrayList<Categoria> carrinho = (ArrayList<Categoria>) session.getAttribute("carrinho"); 
           	float soma = 0;
           %>
           <div id="vendaVinis">
           <%if(carrinho != null && !carrinho.isEmpty()){ %>
           		<table class="table table-hover">
	        	<thead>
	                <tr>
	                  <th>Imagem</th>
	                  <th>Nome</th>
	                  <th>Categoria</th>
	                  <th>Quantidade</th>
	                  <th>Preço</th>
	                </tr>
                </thead>
                <%for(Categoria c: carrinho){ %>
                	<tr>
                		<td><img src="<%=c.getImg()%>"  class="img-thumbnail" style="width: 100px; height: 100px;"></td>
                		<td><%=c.getNome() %></td>
                		<td><%=c.getCateg() %></td>
                		<td></td>
                		<td><%=c.getPreco() %></td>
                		<%soma+=c.getPreco(); %>
                	</tr>
                <%} %>
			</table>
			<div align="center">
			<h4 align="right"><b>Total: </b><%=soma %></h4><br/>
		  	  <br />
		  	  	<div>
		  	  		<div style="float: left; width: 500px;"><form action="venda" method="post"><input hidden="hidden" name="id" value="<%=cat.getId()%>"><button type="submit" class="btn btn-lg btn-default">Sim</button></form></div>
		  	  		<div style="float: right; width: 300px;"><button id="botaoNao" name="nao" class="btn btn-lg btn-default">Não</button></div>
		  	  	</div>
		  	 </div>
           <%}else if(cat != null){%>
           		<div class="col-md-5" align="center">
		  			<a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-516777" href="#panel-element-566363">
		  			<img src="<%=cat.getImg()%>" class="img-thumbnail" style="width: 250px; height: 250px;" /></a>
	  			</div>
		  	  <div>
		  	  	<br/>
		  	  	<h4><%=cat.getNome() %></h4>
		  	  	<h3>R$<%=cat.getPreco() %></h3>
		  	  </div>
		  	  <div>
		  	  <br /><br/>
		  	  <div align="center">
		  	  	<div style="float: left; width: 100px;"><form action="venda" method="post"><input hidden="hidden" name="id" value="<%=cat.getId()%>"><button type="submit" class="btn btn-lg btn-default">Sim</button></form></div>
		  	  	<div style="float: right; width: 400px;"><button id="botaoNao" name="nao" class="btn btn-lg btn-default">Não</button></div>
		  	  </div>
		  	  </div>
	  		<%}%>
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