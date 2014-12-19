angular.module('sicsteentons').controller 'OperatorCtrl', ['$scope', '$log', 'FloorFactory', '$timeout', ($scope, $log, FloorFactory, $timeout) ->
  $log.log 'OperatorCtrl initialized'

  $scope.floors = []

  $scope.onDeleteAll = ()->
    $log.log 'onDeleteAll() called'


  $scope.fetch = ->
    $log.log 'fetching data...'
    FloorFactory.query (data) ->
      $scope.floors = data.map (element) ->
        {
          id: element.floor,
          count: element.count,
          oldest: new Date(element.oldest),
          newest: new Date(element.newest)
        }
    , ->
      $log.log 'could not load floors'

  $scope.onClearFloor = (floor) ->
    $log.log "Clearing: #{floor.id}"

  $scope.onTick = ->
    $scope.fetch()
    $timeout($scope.onTick, 5000)

  $scope.onTick()

]
