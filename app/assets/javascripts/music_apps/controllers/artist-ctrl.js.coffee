window.MusicApp.controller 'ArtistCtrl', [
  '$scope', 'model.artist', 'utils.logging', '$http', '$location', '$routeParams', 'DateUtils',
  ($scope, Artist, Logging, $http, $location, $routeParams, DateUtils) ->

    Artist.getArtist(1).then (response) ->
      $scope.artist = response

      Logging.info("[Models::Artist]: #{$scope.artist}")

]