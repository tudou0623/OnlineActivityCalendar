function LoginCtrl($scope, $routeParams, $http, $location, $cookieStore) {
	/*$scope.login = $http({
      url : "http://192.168.0.108:8000/userLogin!login.action",
      method : "post",
      params : { userLoginID : "felix", password : "123" }
    }).success(function (data, status) {
      alert(data.userID)
      alert("Success!");
    }).error(function (data, status) {
      alert(status);
    });*/
  login_success = function (data, status) { 
    if (data.userID != -1) {
      set_cookie()
      window.location.href = "/#/home"
    } 
  }
  login_error = function(data, status) {
    //alert(data.userID)
    if (data.userID == -1) {
      alert("Wrong username or password!")
    }
  }
  set_cookie = function(data) {
    $cookieStore.put('userID', data.userID)
    $cookieStore.put('userLoginID', data.userLoginID)
    $cookieStore.put('sessionID', data.sessionID)
    $cookieStore.put('JSESSIONID', data.sessionID)
  }
  $scope.login = function () {
    $.post("http://111.186.51.165:8000/userAction!login.action",
     { userLoginID : $scope.user.name, password : $scope.user.password })
    .success(function (data, status) { 
      if (data.userID != -1) {
        window.location.href = "/#/home"
        set_cookie(data)
      } else {
        if (data.userID == -1) {
          alert("Wrong username or password!")
        }
      }
    }).error(function (data, status) {
      //alert(data.userID)
      if (data.userID == -1) {
        alert("Wrong username or password!")
      }
    })
  }

  register_success = function (data, status) {
    if (data.userID == -1 || data.sessionID == "0") {
      alert("Fail to register!")
    } else {
      window.location.href = "/#/home"
    }
  }
  register_error = function (data, status) {

  }
  $scope.register = function () {
    $.post("http://192.168.0.108:8000/userAction!register.action",
      { userLoginID : $scope.user.name, password : $scope.user.password })
    .success(function (data, status) {
      if (data.userID == -1 || data.sessionID == "0") {
        alert("Fail to register!")
      } else {
        window.location.href = "/#/home"
      }
    })
  }
    //  $scope = $scope || angular.element(document).scope();

    //window.location.href = "/#/home"
    //$location.path();
    //$scope.$apply();
    //reload("/#/home");

	var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();
    /* event source that pulls from google.com */
    $scope.eventSource = {

    };
    /* event source that contains custom events on the scope */
    $scope.events = [
    { title : 'All Day Event', start : new Date(y, m, 1), url : '/#/event/123'},
    { title : 'Long Event', start : new Date(y, m, d - 5), end : new Date(y, m, d - 2), url : '/#/event/123'},
    { id : 999, title : 'Repeating Event', start : new Date(y, m, d - 3, 16, 0),allDay: false, url : '/#/event/123'},
    { id : 999,title: 'Repeating Event',start : new Date(y, m, d + 4, 16, 0), allDay : false, url : '/#/event/123'},
    { title : 'Birthday Party', start : new Date(y, m, d + 1, 19, 0), end : new Date(y, m, d + 1, 22, 30),allDay: false, url : '/#/event/123'},
    { title : 'Click for Google', start : new Date(y, m, 28), end : new Date(y, m, 29), url : '/#/event/123'}
    ];
    /* event source that calls a function on every view switch */
    $scope.eventsF = function (start, end, callback) {
      var s = new Date(start).getTime() / 1000;
      var e = new Date(end).getTime() / 1000;
      var m = new Date(start).getMonth();
      var events = [{title: 'Feed Me ' + m,start: s + (50000),end: s + (100000),allDay: false, className: ['customFeed']}];
      callback(events);
    };
    /* alert on eventClick */
    $scope.alertEventOnClick = function( date, allDay, jsEvent, view ){
        $scope.$apply(function(){
          $scope.alertMessage = ('Day Clicked ' + date);
        });
    };
    /* alert on Drop */
     $scope.alertOnDrop = function(event, dayDelta, minuteDelta, allDay, revertFunc, jsEvent, ui, view){
        $scope.$apply(function(){
          $scope.alertMessage = ('Event Droped to make dayDelta ' + dayDelta);
        });
    };
    /* alert on Resize */
    $scope.alertOnResize = function(event, dayDelta, minuteDelta, revertFunc, jsEvent, ui, view ){
        $scope.$apply(function(){
          $scope.alertMessage = ('Event Resized to make dayDelta ' + minuteDelta);
        });
    };
    /* add and removes an event source of choice */
    $scope.addRemoveEventSource = function(sources, source) {
      var canAdd = 0;
      angular.forEach(sources, function(value, key) {
        if (sources[key] === source) {
          sources.splice(key, 1);
          canAdd = 1;
        }
      });
      if (canAdd === 0) {
        sources.push(source);
      }
    };
    /* add custom event*/
    $scope.addEvent = function() {
      $scope.events.push({
        title: 'Open Sesame',
        start: new Date(y, m, 28),
        end: new Date(y, m, 29),
        className: ['openSesame']
      });
    };
    /* remove event */
    $scope.remove = function(index) {
      $scope.events.splice(index, 1);
    };
    /* Change View */
    $scope.changeView = function(view) {
      $scope.myCalendar.fullCalendar('changeView', view);
    };

    $scope.gotoClickedDate = function(event, eventElement) {
      //alert(new Date(event.start.getFullYear(), event.start.getMonth(), event.start.getDate()));

      $scope.myCalendar.fullCalendar('gotoDate', new Date(event.start.getFullYear(), event.start.getMonth(), event.start.getDate()));
      $scope.myCalendar.fullCalendar('changeView', "agendaDay");
    }
    /* config object */
    $scope.uiConfig = {
      calendar:{
        height: 450,
        editable: true,
        header:{
          left: 'month agendaWeek agendaDay',
          center: 'title',
          right: 'today prev,next'
        },
        dayClick: $scope.alertEventOnClick,
        eventDrop: $scope.alertOnDrop,
        eventResize: $scope.alertOnResize,
        eventClick : $scope.gotoClickedDate
      }
    };
    /* event sources array*/
    $scope.eventSources = [$scope.events, $scope.eventSource, $scope.eventsF];
};