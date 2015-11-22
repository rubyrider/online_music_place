window.MusicApp.controller 'AlbumCtrl', [
  '$scope', 'model.album', 'utils.logging', '$http', '$location', '$routeParams', 'DateUtils',
  ($scope, Album, Logging, $http, $location, $routeParams, DateUtils) ->
    console.log($routeParams.id)
    Album.getAlbum($routeParams.id).then (response) ->
      $scope.album = response
      $scope.songs = response.songs

      Logging.info("[Models::Album]: #{$scope.album}")

    $scope.add_click = (msg) ->
#      $('#playlist-modal').modal('show')

      song_id = msg.id
      $('#playlist-modal').modal('show')
      form_url = "/api/v1/users/#{window.current_user.id}/songs/#{msg.id}/play_lists/toggle_presence_in_play_list"
      $('#new_play_list').attr('action', form_url)


]