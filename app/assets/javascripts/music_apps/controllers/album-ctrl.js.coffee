window.MusicApp.controller 'AlbumCtrl', [
  '$scope', 'model.album', 'utils.logging', '$http', '$location', '$routeParams', 'DateUtils',
  ($scope, Album, Logging, $http, $location, $routeParams, DateUtils) ->
    console.log($routeParams.id)
    Album.getAlbum($routeParams.id).then (response) ->
      $scope.album = response
      $scope.songs = response.songs

      Logging.info("[Models::Album]: #{$scope.album}")

]