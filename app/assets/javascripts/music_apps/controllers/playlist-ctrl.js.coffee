window.MusicApp.controller "PlaylistCtrl", [ "$scope", "model.playlist", "utils.logging", "$http", "$location", "$routeParams", "DateUtils", ($scope, Playlist, Logging, $http, $location, $routeParams, DateUtils) ->

  console.log($routeParams)

  Playlist.getUserPlaylists().then (response) ->
    $scope.playlists = response

  if $routeParams.id == 'surprise_me'
    Playlist.getRandom().then (response) ->
      $scope.album = response
      $scope.songs = response.songs

      $(".p_playlist").html ""
      songs = response.songs
      i = 0

      while i < songs.length
        console.log songs[i]
        html_markup = "<li audiourl='" + songs[i].song_url + "' artist=''>" + songs[i].name + "</li>"
        console.log html_markup
        $("ul.p_playlist").append html_markup
        i++


  else if $routeParams.id
    Playlist.getSongs($routeParams.id).then (response) ->
      $scope.album = response
      $scope.songs = response.songs
  else
    Playlist.getPlaylists().then (response) ->
      $scope.albums = _.chunk(response, 4)
      Logging.info "[Models::Playlist]: " + $scope.albums

]