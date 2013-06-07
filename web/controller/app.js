var logincat = angular.module('logincat', ['ui.bootstrap.modal', 'ui.calendar', 'ui.bootstrap.rating', 'ui.bootstrap.collapse', 'ui.bootstrap.accordion']).
	config(function($routeProvider, $httpProvider) {
		$routeProvider.when('/', {templateUrl: '/views/login.html', controller: LoginCtrl});
    $routeProvider.when('/home', {templateUrl : '/views/home.html', controller : HomeCtrl});
		$routeProvider.when('/home/:username', {templateUrl : '/views/home.html', controller : HomeCtrl});
    $routeProvider.when('/event/:eventid', {templateUrl : '/views/event.html', controller : EventCtrl});
		$routeProvider.otherwise({redirectTo: '/'});
	});