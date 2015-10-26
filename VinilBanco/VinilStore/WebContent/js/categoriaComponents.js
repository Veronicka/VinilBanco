(function() {
    var categoriaComponents = angular.module('categoria-components', []);

    categoriaComponents.directive('CategoriaForm', function(){
        return{
            restric: 'E',
            template:'',
            replace: true
        }
    });
})();
