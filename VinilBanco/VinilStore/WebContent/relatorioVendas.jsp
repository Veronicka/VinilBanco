<%@page import="fatec.com.model.Usuario"%>
<%@page import="fatec.com.model.Categoria"%>
<%@page import="fatec.com.model.Vendidos"%>
<%@page import="java.util.ArrayList"%>
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
<title>Vinil Store - Relat�rio de Vendas</title>
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
        			<li><a href="index.jsp">Novos<span class="sr-only">(current)</span></a></li>
        			<li><a href="#">Usados</a></li>
        			<li class="active"><a href="relatorioVendas.jsp">Relat�rio</a></li>
        			<li><a href="inserirVinil.html">Inserir Vinil</a></li>
        			
        		</ul>
        		<form class="navbar-form navbar-left" role="search">
                    <div class="form-group"><input type="text" class="form-control"></div>
                        <button type="submit" class="btn btn-default">
                            Pesquisar
                        </button>
                </form>
        		<ul class="nav navbar-nav navbar-right">
        			<li><a href="carrinho.jsp" class="glyphicon glyphicon-shopping-cart btn-lg"></a></li>
        			<li><a href="index.jsp" id="log" value="logout">Logout</a></li>
        		</ul>
        	</div>
  		</div>
</nav>
<br/><br/><br/>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
	        <h2>Compra Realizada!</h2>
	        <hr>
	        <%ArrayList<Vendidos> vendidos = (ArrayList<Vendidos>) session.getAttribute("vendidos"); %>
	        <%if(vendidos != null && !vendidos.isEmpty()){ %>
	        <table class="table table-hover">
	        	<thead>
	                <tr>
	                  <th>Id</th>
	                  <th>Creation</th>
	                  <th>Nome</th>
	                  <th>Pre�o</th>
	                  <th>Categoria</th>
	                  <th>Quantidade</th>
	                  <th>Qtd Vendida</th>
	                  <th>Data/Hora</th>
	                </tr>
                </thead>
                <%for(Vendidos v: vendidos){ %>
                	<tr>
                		<td><%=v.getId() %></td>
                		<td><%=v.getCreation() %></td>
                		<td><%=v.getNome() %></td>
                		<td><%=v.getPreco() %></td>
                		<td><%=v.getCateg() %></td>
                		<td><%=v.getQuant() %></td>
                		<td><%=v.getQuantVend() %></td>
                		<td><%=v.getHora() %></td>
                	</tr>
                <%} %>
			</table>
        </div>
        <%}else{%>
        	<h4>N�o h� relat�rio</h4>
        <%} %>
        <div class="col-md-1"></div>
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
                        <h4>INFORMA��ES</h4>
                             <div><a href="#" class="btn" type="button"><font color="black">QUEM SOMOS</font></a></div>
                             <div><a href="#" class="btn" type="button"><font color="black">COMO COMPRAR</font></a></div>
                             <div><a href="#" class="btn" type="button"><font color="black">TROCAS E DEVOLU��ES</font></a></div>
                             <div><a href="#" class="btn" type="button"><font color="black">POL�TICAS DE ENTREGA</font></a></div>
                             <br />
                        </div>
                    <div class="col-md-4">
                    <h4>FALE CONOSCO</h4>
                        <br />
                        <address>
                         <strong>Vinil Store.</strong><br> Jacare�, SP<br> S�o Paulo, BR 94107<br>
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
        <font color="white">Copyright 2015 @ Ver�nica e Lu�s</font>
        </div>
    </div>
  </footer>
</body>
</html>