app.controller('GifsController', [
  '$scope',
  '$location',
  '$resource',
  'Auth',
  function($scope, $location, $resource, Auth) {
    $scope.signedIn = Auth.isAuthenticated;

    $scope.$on('$viewContentLoaded', function() {
      if ($scope.signedIn()) {
        var Gif = $resource('/gifs');
        Gif.get(function(result) {
          $scope.gifs = result.gifs;
        });
      } else {
        $location.path('/');
      }
    });
  }
]);
