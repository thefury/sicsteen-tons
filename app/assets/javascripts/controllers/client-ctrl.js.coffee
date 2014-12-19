angular.module('sicsteentons').controller 'ClientCtrl', ['$scope', '$log', 'RequestFactory', '$timeout', ($scope, $log, RequestFactory, $timeout) ->

  $scope.floors = ["5", "4", "3", "2", "1", "b"]

  $scope.openRequestOnFloor = (index) ->
    RequestFactory.save { floor: $scope.floors[index] }
    $scope.recentlyClicked = true
    $timeout( 
      -> 
        $scope.recentlyClicked = false
      ,10000)
]
