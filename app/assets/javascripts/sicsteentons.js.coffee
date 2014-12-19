@app = angular.module('sicsteentons', ['ngResource', 'ui.bootstrap', 'ng-rails-csrf'])

@app.factory "RequestFactory", ['$resource', ($resource) ->
  $resource('/api/v1/requests/:id', {id: '@id'})
]
