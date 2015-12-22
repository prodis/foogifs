app.controller('HomeController', [
  '$scope',
  '$location',
  '$resource',
  'Auth',
  function($scope, $location, $resource, Auth) {
    $scope.signedIn = Auth.isAuthenticated;

    $scope.search = function(q, limit) {
      $location.path('/').search('q', q);

      var params = { q: q, limit: limit || 5 };
      var Search = $resource('/search');
      Search.get(params, function(result) {
        $scope.gifs = result.search;
      });
    }

    $scope.saveGif = function(gif, tags) {
      if (!$scope.signedIn()) {
        return;
      }

      gif.tag_list = tags;

      var Gif = $resource('/gifs');
      Gif.save({ gif: gif }, function(_) {
        gif.saved = true;
      });
    }

    $scope.q = $location.search().q;

    if ($scope.q) {
      $scope.search($scope.q);
    }
  }
]);
