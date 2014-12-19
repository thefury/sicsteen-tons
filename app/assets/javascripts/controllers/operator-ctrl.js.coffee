angular.module('sicsteentons').controller 'OperatorCtrl', ['$scope', '$log', 'RequestFactory', '$timeout', ($scope, $log, RequestFactory, $timeout) ->
  $log.log 'OperatorCtrl initialized'
  
  $scope.floors = []

  $scope.onDeleteAll = ()->
    $log.log 'onDeleteAll() called'


  $scope.fetch = ->
    $log.log 'fetching data...'
    $scope.floors = [
      { id: 'B', count: 1, oldest: new Date(), newest: new Date() },
      { id: '1', count: 3, oldest: new Date(), newest: new Date() },
      { id: '2', count: 0, oldest: new Date(), newest: new Date() },
      { id: '3', count: 3, oldest: new Date(), newest: new Date() },
      { id: '4', count: 5, oldest: new Date(), newest: new Date() },
      { id: '5', count: 0, oldest: new Date(), newest: new Date() }
    ]

  $scope.onClearFloor = (floor) ->
    $log.log "Clearing: #{floor.id}"

  $scope.onTick = ->
    $scope.fetch()
    $timeout($scope.onTick, 5000)

  $scope.onTick()

  #$scope.requests = RequestFactory.query (data) ->
  #  $log.log 'loaded requests'
  #, ->
  #  $log.log 'could not load requests'

]
