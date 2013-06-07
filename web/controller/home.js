
function HomeCtrl($scope, $routeParams, $http, $dialog) {
  $scope.opts = {
    backdrop : true,
    keyboard : true,
    backdropClick : true,
    templateUrl :  '/views/create_event_popup.html',
    controller : 'HomeCtrl',
    backdropFade : true
  };
  $scope.creatEvent = function(){
    var d = $dialog.dialog($scope.opts);
    d.open().then(function(result){
      if(result)
      {
        alert('dialog closed with result: ' + result);
      }
    });
  };


  var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();

    $scope.friendList = [{name : 'wyunchi', avatar : '/img/1.png'},
    {name : 'wyunchi1', avatar : '/img/1.png'},
    {name : 'wyunchi2', avatar : '/img/1.png'}];
    /* event source that pulls from google.com */
    $scope.eventSource = {

    };
    /* event source that contains custom events on the scope */
    $scope.events = [
      {title: 'All Day Event',start: new Date(y, m, 1), url : '/#/event/123'},
      {title: 'Long Event',start: new Date(y, m, d - 5),end: new Date(y, m, d - 2), url : '/#/event/123'},
      {id: 999,title: 'Repeating Event',start: new Date(y, m, d - 3, 16, 0),allDay: false, url : '/#/event/123'},
      {id: 999,title: 'Repeating Event',start: new Date(y, m, d + 4, 16, 0),allDay: false, url : '/#/event/123'},
      {title: 'Birthday Party',start: new Date(y, m, d + 1, 19, 0),end: new Date(y, m, d + 1, 22, 30),allDay: false, url : '/#/event/123'},
      {title: 'Click for Google',start: new Date(y, m, 28),end: new Date(y, m, 29), url : '/#/event/123'}
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
    $scope.addRemoveEventSource = function(sources,source) {
      var canAdd = 0;
      angular.forEach(sources,function(value, key){
        if(sources[key] === source){
          sources.splice(key,1);
          canAdd = 1;
        }
      });
      if(canAdd === 0){
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
      $scope.events.splice(index,1);
    };
    /* Change View */
    $scope.changeView = function(view) {
      $scope.myCalendar.fullCalendar('changeView',view);
    };

    $scope.eventMouseOver = function(event, eventElement) {
      alert("mouse over!");
    }

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
          left : '',
          center : 'title',
          right : 'today prev,next'
        },
        dayClick : $scope.gotoClickedDate,
        eventDrop : $scope.alertOnDrop,
        eventResize : $scope.alertOnResize,
        eventMouseOver : $scope.eventMouseOver,
        eventClick : $scope.gotoClickedDate
      }
    };
    /* event sources array*/
    $scope.eventSources = [$scope.events, $scope.eventSource, $scope.eventsF];
};
