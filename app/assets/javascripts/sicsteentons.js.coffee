@app = angular.module('sicsteentons', ['ngResource', 'ui.bootstrap', 'ng-rails-csrf', 'angularMoment'])

@app.factory "RequestFactory", ['$resource', ($resource) ->
  $resource('/api/v1/requests/:id', {id: '@id'})
]

@app.factory "FloorFactory", ['$resource', ($resource) ->
  $resource('/api/v1/floors/:id', {id: '@id'})
]
