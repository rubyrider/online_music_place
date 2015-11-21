window.MusicApp.config [
  '$routeProvider', '$locationProvider', ($route, $location, $caches) ->

    $route
    .when(
      '/',
      templateUrl: '/assets/music_apps/templates/home/index.html'
      controller: 'ContentCtrl')
    .when(
      '/new_releases',
      templateUrl: '/assets/music_apps/templates/home/index.html',
      controller: 'NewReleasesCtrl'
    )
    .otherwise redirectTo: '/'
    $location.html5Mode true
]