window.MusicApp.controller "PlaylistCtrl", [ "$scope", "model.playlist", "utils.logging", "$http", "$location", "$routeParams", "DateUtils", ($scope, Playlist, Logging, $http, $location, $routeParams, DateUtils) ->
  if $routeParams.id
    Playlist.getSongs($routeParams.id).then (response) ->
      $scope.album = response
      $scope.songs = response.songs

  else
    Playlist.getPlaylists().then (response) ->
      $scope.albums = _.chunk(response, 4)
      Logging.info "[Models::Playlist]: " + $scope.albums

]