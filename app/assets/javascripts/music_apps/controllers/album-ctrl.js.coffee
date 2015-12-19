window.MusicApp.controller 'AlbumCtrl', [
  '$scope', 'model.album', 'utils.logging','$http', '$location', '$routeParams', 'DateUtils',
  ($scope, Album, Logging, $http, $location, $routeParams, DateUtils) ->

    Album.getUserPlaylists().then (response) ->
      $scope.playlists = response

    if $routeParams.id
      Album.getAlbum($routeParams.id).then (response) ->
        $scope.album = response
        $scope.songs = response.songs
        $("#jplayer_N").jPlayer( "clearMedia" );
        $("#jplayer_N").jPlayer( "destroy" );
        window.MusicApp.murgi.addToPlaylist($scope.songs)
        $("#song-loader .cube-loader-active").hide()
        Logging.info("[Models::Album]: #{$scope.album}")
    else
      Album.getAlbums().then (response) ->
        $scope.albums = _.chunk(response, 4);


    $scope.add_click = (msg) ->
#      $('#playlist-modal').modal('show')

      song_id = msg.id
      $('#playlist-modal').modal('show')
      form_url = "/api/v1/users/#{window.current_user.id}/songs/#{msg.id}/play_lists/toggle_presence_in_play_list"
      $('#new_play_list').attr('action', form_url)
]