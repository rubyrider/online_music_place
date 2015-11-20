window.MusicApp.config [
  '$routeProvider', '$locationProvider', ($route, $location, $caches) ->

    $route.when(
      '/',
      templateUrl: '/assets/music_apps/templates/home/index.html'
      controller: 'ContentCtrl')
    .otherwise redirectTo: '/'
    $location.html5Mode true
]