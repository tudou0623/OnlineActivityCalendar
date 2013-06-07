function friendListCtrl($scope) {
  $scope.oneAtATime = true;

  $scope.groups = [
  {
   title : ""
  },
  {
    title : "Friends",
    content : "Friends"
  },
  {
    title: "Group",
    content: "Group"
  }
  ];

  $scope.items = ['Item 1', 'Item 2', 'Item 3'];

  $scope.addItem = function() {
    var newItemNo = $scope.items.length + 1;
    $scope.items.push('Item ' + newItemNo);
  };
}