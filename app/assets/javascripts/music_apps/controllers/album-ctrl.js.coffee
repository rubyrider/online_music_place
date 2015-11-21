window.MusicApp.controller 'AlbumCtrl', [
  '$scope', 'model.album', 'utils.logging', '$http', '$location', '$routeParams', 'DateUtils',
  ($scope, Album, Logging, $http, $location, $routeParams, DateUtils) ->

    Album.getAlbum(1).then (response) ->
      $scope.album = response

      Logging.info("[Models::Album]: #{$scope.album}")

]