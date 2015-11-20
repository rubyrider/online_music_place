window.MusicApp = angular.module('MusicApp', [
    'restangular', 'templates', 'ngRoute', 'ngSanitize',  'underscore'
])

window.MusicApp.config [
  '$httpProvider'
  ($httpProvider) ->
    $httpProvider.defaults.headers.common['AUTHORIZATION-TOKEN'] = $('meta[name=auth-token]').attr('content')
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]

window.MusicApp.config [
  'RestangularProvider'
  (RestangularProvider) ->
    RestangularProvider.setBaseUrl('/api/v1/')
    RestangularProvider.setRequestSuffix('.json')
]

window.MusicApp.run ->