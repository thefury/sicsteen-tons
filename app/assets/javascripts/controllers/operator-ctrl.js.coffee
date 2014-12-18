angular.module('sicsteentons').controller 'OperatorCtrl', ['$scope', '$log', 'RequestFactory', ($scope, $log, RequestFactory) ->
  $log.log 'OperatorCtrl initialized'

  $scope.onDeleteAll = ()->
    $log.log 'onDeleteAll() called'


  $scope.requests = RequestFactory.query (data) ->
    $log.log 'loaded requests'
  , ->
    $log.log 'could not load requests'

]
