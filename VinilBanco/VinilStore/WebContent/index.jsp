<!DOCTYPE html>
<%@page import="fatec.com.controller.Autenticador"%>
<%@page import="fatec.com.model.*"%>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/estilo.css" rel="stylesheet">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/crudAjax.js"></script>

    <title>Vinil Store</title>
  </head>
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
      			<a class="navbar-brand" href="#">Vinil Store</a>
    		</div>
       	  	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      			<ul class="nav navbar-nav">
        			<li class="active"><a href="#">Novos<span class="sr-only">(current)</span></a></li>
        			<%if(Autenticador.user != null){%>
        				<%if(Autenticador.user.getEhFuncionario()){%>
        					<li><a href="relatorioVendas.jsp">Relat�rio</a></li>
        					<li ><a href="inserirVinil.html">Inserir Vinil</a></li>
        					<%}else%> <li id="iV" ><a href="inserirVinil.html">Inserir Vinil</a></li>
        			<%}%>
        			
        			
        		</ul>
        		<form class="navbar-form navbar-left" role="search">
                    <div class="form-group"><input type="text" class="form-control"></div>
                        <button type="submit" class="btn btn-default">Pesquisar</button>
                </form>
        		<ul class="nav navbar-nav navbar-right">
        			<li><a href="carrinho.jsp" class="glyphicon glyphicon-shopping-cart btn-lg"></a></li>
        			<%Usuario user = (Usuario) session.getAttribute("user"); %>
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
                    <div class="carousel slide" id="carousel-16103">
                        <ol class="carousel-indicators">
                            <li class="active" data-slide-to="0" data-target="#carousel-16103">
                            </li>
                            <li data-slide-to="1" data-target="#carousel-16103">
                            </li>
                            <li data-slide-to="2" data-target="#carousel-16103">
                            </li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="item active">
                                <img alt="Carousel Bootstrap First" src="img\bg2.jpg">
                                <div class="carousel-caption">
                                    <h4>
                                        Compre Vinis
                                    </h4>
                                    <p>
                                        Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                                    </p>
                                </div>
                            </div>
                            <div class="item">
                                <img alt="Carousel Bootstrap Second" src="img\b2.jpg">
                                <div class="carousel-caption">
                                    <h4>
                                        Venda Vinis
                                    </h4>
                                    <p>
                                        Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                                    </p>
                                </div>
                            </div>
                            <div class="item">
                                <img alt="Carousel Bootstrap Third" src="img\b3.jpg">
                                <div class="carousel-caption">
                                    <h4>
                                        Troque Vinis
                                    </h4>
                                    <p>
                                        Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                                    </p>
                                </div>
                            </div>
                        </div> <a class="left carousel-control" href="#carousel-16103" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-16103" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
                    </div>
                    <br />

                <h2>Vinis</h2>
                <hr>
                <div class="row" id="listaVinis">
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
                            <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="inputEmail3">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10" align="center">
                                <button type="submit" class="btn btn-default" >Enviar</button>
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