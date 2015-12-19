window.MusicApp.config [
  '$routeProvider', '$locationProvider', ($route, $location, $caches) ->

    $route
    .when(
      '/',
      templateUrl: '/assets/music_apps/templates/home/index.html'
      controller: 'ContentCtrl')
    .when(
      '/search',
      templateUrl: '/assets/music_apps/templates/search/index.html'
      controller: 'SearchCtrl')
    .when(
      '/albums/:id',
      templateUrl: '/assets/music_apps/templates/albums/index.html'
      controller: 'AlbumCtrl'
    ).when(
      '/search/',
      templateUrl: '/assets/music_apps/templates/home/index.html'
      controller: 'ContentCtrl'
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
      '/genres/:id',
      templateUrl: '/assets/music_apps/templates/home/genre.html'
      controller: 'GenreCtrl'
    )
    .when(
      '/languages/:id',
      templateUrl: '/assets/music_apps/templates/home/genre.html'
      controller: 'LangaugeCtrl'
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
      '/playlists',
      templateUrl: '/assets/music_apps/templates/playlist/index.html'
      controller: 'PlaylistCtrl'
    )
    .when(
      '/playlists/:id',
      templateUrl: '/assets/music_apps/templates/albums/index.html'
      controller: 'PlaylistCtrl'
    )
    .when(
      '/playlists/surprise_me',
      templateUrl: '/assets/music_apps/templates/albums/index.html'
      controller: 'PlaylistCtrl'
    )
    .when(
      '/songs/',
      templateUrl: '/assets/music_apps/templates/albums/index.html'
      controller: 'PlaylistCtrl'
    )
    .when(
      '/profile/:id',
      templateUrl: '/assets/music_apps/templates/albums/index.html'
      controller: 'PlaylistCtrl'
    )
    $location.html5Mode true
]