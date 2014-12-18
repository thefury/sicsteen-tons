angular.module('sicsteentons').controller 'OperatorCtrl', ['$scope', '$log', ($scope, $log) ->
  $log.log 'OperatorCtrl initialized'

  $scope.onDeleteAll = ()->
    $log.log 'onDeleteAll() called'


  $scope.data = [
    { floor: '1' }, 
    { floor: '1' }, 
    { floor: '3' }, 
    { floor: 'b' }, 
  ]
#    $http
#      .get('setup/load_areas.json')
#      .success (data,status) ->
#        $scope.status = status
#        $scope.data = data
#        $scope.current_area = $scope.data.setup.selected_area
#
#      .error (data,status) ->
#        $scope.status = status
#        $scope.data = data || 'request failed'
#

]
