function EventCtrl($scope, $routeParams, $http) {
  $scope.comment_list = [{comment : "This is comment."},
  {comment : "This is another comment."}];

  $scope.eventTitle = "Seminar";
  $scope.eventName = "The second Seminar";
  $scope.eventPromulgator = "wyunchi";
  $scope.eventType = "Lecture";
  $scope.eventTime = "2013-06-06 20:00:00";
  $scope.eventLocation = "The new Library of SYSU";
  $scope.eventPrivacy = "Public";
  $scope.numberOfParticipants = "6";
  $scope.eventDescription = "This is the second Seminar";
}