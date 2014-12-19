angular.module('sicsteentons').controller 'ClientCtrl', ['$scope', '$log', 'RequestFactory', ($scope, $log, RequestFactory) ->

  $scope.floors = ["5", "4", "3", "2", "1", "b"]

  $scope.openRequestOnFloor = (index) ->
    RequestFactory.save { floor: $scope.floors[index] }
]
