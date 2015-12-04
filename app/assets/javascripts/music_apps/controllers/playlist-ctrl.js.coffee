window.MusicApp.controller "PlaylistCtrl", [ "$scope", "model.playlist", "utils.logging", "$http", "$location", "$routeParams", "DateUtils", ($scope, Playlist, Logging, $http, $location, $routeParams, DateUtils) ->

  console.log($routeParams)

  Playlist.getUserPlaylists().then (response) ->
    $scope.playlists = response

  if $routeParams.id == 'surprise_me'
    Playlist.getRandom().then (response) ->
      console.log(response[0].play_list)
      console.log(response[0].songs)
      $scope.album = response[0].play_list
      $scope.songs = response[0].songs
  else if $routeParams.id
    Playlist.getSongs($routeParams.id).then (response) ->
      $scope.album = response
      $scope.songs = response.songs
  else
    Playlist.getPlaylists().then (response) ->
      $scope.albums = _.chunk(response, 4)
      Logging.info "[Models::Playlist]: " + $scope.albums

]