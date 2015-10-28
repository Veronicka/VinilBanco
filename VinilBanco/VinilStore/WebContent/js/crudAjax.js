$(document).ready(function () {
  var $formWell = $('#form-well');
  var $formGroups = $('div.form-group');
  var $helpBlocks = $('span.help-block');
  var $nomeInput = $('#nome-input');
  var $quantInput = $('#quant-input');
  var $precoInput = $('#preco-input');
  var $categInput = $('#categ-input');
  var $simInput = $('#botaoSim');
  var $naoInput = $('#botaoNao');
  var $imgInput = $('#img-input');
  var $tabelaCategoria = $('#tabela-categoria');
  var $listarAjaxLoader = $('#listar-ajax-loader');
  var $listarAjaxLoaderAdd = $('#listar-ajax-loader2');
  var $botaoSalvar = $('#botaoSalvar');
  var $listaVinis = $('#listaVinis');
  var $vendaVinis = $('#vendaVinis');
  var $tempId = "";
  
  $formWell.hide();
  $('#botao-nova-categoria').click(function () {
    $formWell.slideToggle();
  });

  function limparErros() {
    $formGroups.removeClass('has-error');
    $helpBlocks.text('');
  }
  
  function listarVinis(categoria){
	  var l = '<div>';
	  l += '<form action="#"><div class="col-md-3" align="center">';
	  l+='<a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-516777" href="#panel-element-566363">';
	  l+='<button id="botaoComprar" type="submit"><input hidden="hidden" type="text" name="id" value="'+categoria.id+'"></input>';
	  l+='<img src="'+categoria.img+'" class="img-thumbnail" style="width: 200px; height: 200px;" />';
      l+='<div><h4>'+categoria.nome+'</h4></div></button></a>';
      l+='<div><h3>R$'+categoria.preco+'</h3></div>';
      l+= '<img src="img/ajax-loader.gif" hidden="hidden" />';
      l+='</br></div></form></div>';
      
      var $linhaObjeto=$(l);
      var $ajaxLoader = $linhaObjeto.find('img');
      var $botao = $linhaObjeto.find('button');

      $botao.click(function () {
    	  $.get('vendaVinil',
    			  {'id': categoria.id}).success(function () {
    				  window.location = "venda.jsp";
    			  }).error(function (erros) {
    				  alert('Não é possível apagar no momento');
    			  });
      });
      $listaVinis.append($linhaObjeto);     
  }
  
  $simInput.click(function(){
	  var categoria = $simInput.val();
		 $.post('venda',
   			  {'id': categoria}).success(function () {
   				alert("Compra realizada com sucesso!");
   				window.location = "compraRealizada.jsp";
			  }).error(function (erros) {
				  alert('Não é possível apagar no momento');
		}); 
  });
  
  $naoInput.click(function(){
	  alert("Compra cancelada!");
	  window.location = "index.html";
  });


  function adicionarCategoria(categoria) {
	  console.log(categoria);
    var linha = '<tr>';
    linha += '<td>' + categoria.id + '</td>';
    linha += '<td>' + categoria.creation + '</td>';
    linha += '<td>' + categoria.nome + '</td>';
    linha += '<td>' + categoria.img + '</td>';
    linha += '<td>' + categoria.preco + '</td>';
    linha += '<td>' + categoria.categ + '</td>';
    linha += '<td>' + categoria.quant + '</td>';
    linha += '<td>' + categoria.quantVend + '</td>';
    linha += '<td>';
    linha += '<button class="btn btn-danger btn-sm"><i class="glyphicon glyphicon-trash"></i></button>';
    linha += '<img src="img/ajax-loader.gif" hidden="hidden" />';
    linha += '</td ></tr>';

    var $linhaObjeto=$(linha);
    var $botao = $linhaObjeto.find('button.btn');
    var $ajaxLoader = $linhaObjeto.find('img');

    $botao.click(function () {
      $botao.hide();
      $ajaxLoader.fadeIn();
      setTimeout(function(){
    	  $.post('deletar',
    		        {'id': categoria.id}).success(function () {
    		          $linhaObjeto.remove();
    		        }).error(function (erros) {
    		          alert('Não é possível apagar no momento');
    		          $ajaxLoader.hide();
    		          $botao.fadeIn();
    		        });
      }, 1000);
    });

    $tabelaCategoria.append($linhaObjeto);

  }

  function listarCategorias(categorias){
    $.each(categorias, function(i, cat){
      adicionarCategoria(cat);
      listarVinis(cat);
    })
  }

  $listarAjaxLoader.show();
  $.get('restore').success(
    listarCategorias
  ).error(function () {
      alert('Não foi possível listar categorias');
   }).always(function () {
      $listarAjaxLoader.fadeOut();
  });



  function mostrarErros(erros) {
	  console.log(erros);
    var helpBlockPrefixo = '#help-block-';
    var formGroupPrefixo = '#form-group-';
    $.each(erros,function(propriedade, valorDaPropriedade){
    	console.log(propriedade);
    	console.log(valorDaPropriedade);
      $(helpBlockPrefixo + propriedade).text(valorDaPropriedade);
  	  $(formGroupPrefixo + propriedade).addClass('has-error');

    });
  }
  
   $('#form-categoria').submit(function (evento) {
       evento.preventDefault();
       $listarAjaxLoaderAdd.show();
       $botaoSalvar.fadeOut();
       limparErros();
       var nome = $nomeInput.val();
       var quant = $quantInput.val();
       var img = $imgInput.val();
       var preco = $precoInput.val();
       var categ = $categInput.val();
      $.post('salvar',
      {'nome': nome,'quant': quant,'img': img,'preco': preco, 'categ':categ}).success(function (categoria){
        adicionarCategoria(categoria);
        listarVinis(categoria);
        $nomeInput.val('');
        $quantInput.val('');
        $precoInput.val('');
        $imgInput.val('');
        $categInput.val('');
      }).error(function (erros) {
    	  alert("Campo Obrigatório");
    	  mostrarErros({'nome': "Campo Obrigatório"})
      }).always(function(){
              $listarAjaxLoaderAdd.fadeOut();
              $botaoSalvar.fadeIn();
            });
  });

});