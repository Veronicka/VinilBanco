$(document).ready(function () {
  var $formWell = $('#form-well');
  var $formGroups = $('div.form-group');
  var $helpBlocks = $('span.help-block');
  var $nomeInput = $('#nome-input');
  var $tabelaCategoria = $('#tabela-categoria')

  $formWell.hide();
  $('#botao-nova-categoria').click(function () {
    $formWell.slideToggle();
  });

  function limparErros() {
    $formGroups.removeClass('has-error');
    $helpBlocks.text('');
  }

  function adicionarCategoria(categoria) {
    var linha = '<tr>';
    linha += '<td>' + categoria.id + '</td>';
    linha += '<td>' + categoria.creation + '</td>';
    linha += '<td>' + categoria.nome + '</td>';
    linha += '<td>';
    linha += '<button class="btn btn-danger btn-sm"><i class="glyphicon glyphicon-trash"></i></button>';
    linha += '</td ></tr>';

    var $linhaObjeto=$(linha);
    var $botao = $linhaObjeto.find('button').click(function(){
      console.log(categoria.id);
      $linhaObjeto.remove();
    }); //descendente

    //se tivesse mais botoes, deve selecionar por classe

    $tabelaCategoria.append($linhaObjeto);

  }

  function listarCategorias(categorias){
    $.each(categorias, function(i, cat){
      adicionarCategoria(cat);
    })
  }

  var categoriasFake=[{"id": 5910974510923776, "nome": "Michael Jackson", "creation": "07/06/2015 16:44:20"}];
 listarCategorias(categoriasFake);

  function mostrarErros(erros) {
    var helpBlockPrefixo = '#help-block-';
    var formGroupPrefixo = '#form-group-';
    $.each(erros,function(propriedade, valorDaPropriedade){
      $(helpBlockPrefixo + propriedade).text(valorDaPropriedade);
      $(formGroupPrefixo + propriedade).addClass('has-error');
    });
  }

  $('#form-categoria').submit(function (evento) {
    evento.preventDefault();
    limparErros();
    var nome = $nomeInput.val();
    if (nome === '') {
      mostrarErros({'nome': 'Campo Obrigatorio'})
    } else {
      adicionarCategoria({"id": 5910974510923776,
        "nome": nome,
        "creation": "09/08/2015 16:44:20"});
      $nomeInput.val('');
    }

  });

});