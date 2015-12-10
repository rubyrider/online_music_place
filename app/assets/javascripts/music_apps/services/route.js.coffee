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
      templateUrl: '/assets/music_apps/templates/albums/list.html'
      controller: 'NewreleasesCtrl'
    )
    .when(
      '/albums',
      templateUrl: '/assets/music_apps/templates/albums/list.html'
      controller: 'AlbumCtrl'
    )
    .when(
      '/artists',
      templateUrl: '/assets/music_apps/templates/artists/list.html'
      controller: 'ArtistCtrl'
    )
    .when(
      '/artists/:id',
      templateUrl: '/assets/music_apps/templates/artists/index.html'
      controller: 'ArtistCtrl'
    )
    .when(
      '/play_lists',
      templateUrl: '/assets/music_apps/templates/playlist/index.html'
      controller: 'PlaylistCtrl'
    )
    .when(
      '/play_lists/:id',
      templateUrl: '/assets/music_apps/templates/albums/index.html'
      controller: 'PlaylistCtrl'
    )
    .when(
      '/play_lists/surprise_me',
      templateUrl: '/assets/music_apps/templates/albums/index.html'
      controller: 'PlaylistCtrl'
    )
    $location.html5Mode true
]