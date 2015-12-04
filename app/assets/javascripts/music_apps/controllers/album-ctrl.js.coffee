window.MusicApp.controller 'AlbumCtrl', [
  '$scope', 'model.album', 'utils.logging', '$http', '$location', '$routeParams', 'DateUtils',
  ($scope, Album, Logging, $http, $location, $routeParams, DateUtils) ->

    Album.getUserPlaylists().then (response) ->
      $scope.playlists = response

    Album.getAlbum($routeParams.id).then (response) ->
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

      Logging.info("[Models::Album]: #{$scope.album}")

    $scope.add_click = (msg) ->
#      $('#playlist-modal').modal('show')

      song_id = msg.id
      $('#playlist-modal').modal('show')
      form_url = "/api/v1/users/#{window.current_user.id}/songs/#{msg.id}/play_lists/toggle_presence_in_play_list"
      $('#new_play_list').attr('action', form_url)
]