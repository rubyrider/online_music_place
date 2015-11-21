window.MusicApp.config [
  '$routeProvider', '$locationProvider', ($route, $location, $caches) ->

    $route
    .when(
      '/',
      templateUrl: '/assets/music_apps/templates/home/index.html'
      controller: 'ContentCtrl')
    .when(
      '/albums/:id',
      templateUrl: '/assets/music_apps/templates/albums/index.html'
      controller: 'AlbumCtrl'
    )
    .when(
      '/new_releases',
      templateUrl: '/assets/music_apps/templates/home/index.html'
      controller: 'NewreleasesCtrl'
    )
    .when(
      '/artists/:id',
      templateUrl: '/assets/music_apps/templates/artists/index.html'
      controller: 'ArtistCtrl'
    )
    .otherwise redirectTo: '/'
    $location.html5Mode true
]