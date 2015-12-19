window.MusicApp.controller "PlaylistCtrl", [ "$scope", "model.playlist", "utils.logging", "$http", "$location", "$routeParams", "DateUtils", ($scope, Playlist, Logging, $http, $location, $routeParams, DateUtils) ->

  console.log($routeParams)

  Playlist.getUserPlaylists().then (response) ->
    $scope.playlists = response

  if $routeParams.id == 'surprise_me'
    Playlist.getRandom().then (response) ->
      $scope.album = response
      $scope.songs = response.songs
      $("#jplayer_N").jPlayer( "clearMedia" );
      $("#jplayer_N").jPlayer( "destroy" );
      window.MusicApp.murgi.addToPlaylist($scope.songs)
      $("#song-loader .cube-loader-active").hide()

  else if $routeParams.id
    Playlist.getSongs($routeParams.id).then (response) ->
      $scope.album = response
      $scope.songs = response.songs
      $("#jplayer_N").jPlayer( "clearMedia" );
      $("#jplayer_N").jPlayer( "destroy" );
      window.MusicApp.murgi.addToPlaylist($scope.songs)
      $("#song-loader .cube-loader-active").hide()

  else
    Playlist.getPlaylists().then (response) ->
      $scope.albums = _.chunk(response, 4)
      Logging.info "[Models::Playlist]: " + $scope.albums
      $("#song-loader .cube-loader-active").hide()


]