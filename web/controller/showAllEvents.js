function showAllEventsCtrl($scope, $routeParams, $http) {
	$scope.events_list1 = [
	{ title : "CCG", date : "2013-07-11 13:00" , id : "456", url : "/img/download.jpg"},
	{ title : "seminar", date : "2013-07-11 9:00", id : "123", url : "/img/images.jpg"}	]
	$scope.events_list2 = [
	{ title : "CCG", date : "2013-07-11 13:00" , id : "456", url : "/img/download.jpg"},
	{ title : "seminar", date : "2013-07-11 9:00", id : "123", url : "/img/images.jpg"} ]
	$scope.events_list3 = [
	{ title : "seminar", date : "2013-07-11 9:00", id : "123", url : "/img/images.jpg"},
	{ title : "seminar", date : "2013-07-11 9:00", id : "123", url : "/img/images.jpg"}	]
	$scope.filter = {
		type : [{ typename : "Study"},
		{ typename : "Comic"}]
	}
};