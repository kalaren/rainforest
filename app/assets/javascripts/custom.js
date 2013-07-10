
function PictureListCtrl($scope, $http) {
  $http.get('/products.json').success(function(data) {
  	$scope.products = data;
  });

  $scope.orderProp = 'name';
}

PictureListCtrl.$inject = ['$scope', '$http'];