var app = angular.module('foogifs', ['templates', 'ngRoute', 'ngResource', 'Devise']);

app.config([
  '$routeProvider',
  '$locationProvider',
  function($routeProvider, $locationProvider) {
    $routeProvider.
      when('/', {
        templateUrl: 'home/_home.html',
        controller: 'HomeController'
      }).
      when('/my_gifs', {
        templateUrl: 'gifs/_gifs.html',
        controller: 'GifsController'
      }).
      when('/login', {
        templateUrl: 'authentication/_login.html',
        controller: 'AuthenticationController'
      }).
      when('/register', {
        templateUrl: 'authentication/_register.html',
        controller: 'AuthenticationController'
      }).
      otherwise({
        redirectTo: '/'
      });

      // $locationProvider.html5Mode(true);
  }
]);
