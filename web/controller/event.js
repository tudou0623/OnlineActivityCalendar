function EventCtrl($scope, $routeParams, $http, $dialog) {
  $scope.comment_list = [{comment : "This is comment."},
  {comment : "This is another comment."}];

  if ($routeParams.eventid == "123") {
    $scope.eventTitle = "Seminar";
    $scope.eventName = "The second Seminar";
    $scope.eventPromulgator = "wyunchi";
    $scope.eventType = "Lecture";
    $scope.eventTime = "2013-06-06 20:00:00";
    $scope.eventLocation = "The new Library of SYSU";
    $scope.eventPrivacy = "Public";
    $scope.numberOfParticipants = "6";
    $scope.eventDescription = "This is the second Seminar";
    $scope.eventid = $routeParams.eventid;
  } else if ($routeParams.eventid == "456") {
    $scope.eventTitle = "CCG";
    $scope.eventName = "The second Seminar";
    $scope.eventPromulgator = "wyunchi";
    $scope.eventType = "Lecture";
    $scope.eventTime = "2013-07-14 20:00:00";
    $scope.eventLocation = "Pudong";
    $scope.eventPrivacy = "Public";
    $scope.numberOfParticipants = "6";
    $scope.eventDescription = "Goto CCG";
    $scope.eventid = $routeParams.eventid;
  }

  $scope.invite_template = {
    backdrop : true,
    keyboard : true,
    backdropClick : true,
    templateUrl : '/views/create_invite.html',
    controller : 'HomeCtrl',
    backdropFade : true
  }
  $scope.createInvite = function () {
    var d = $dialog.dialog($scope.invite_template);
    d.open().then(function(result){
      if(result)
      {
        alert('dialog closed with result: ' + result);
      }
    });
  }
}