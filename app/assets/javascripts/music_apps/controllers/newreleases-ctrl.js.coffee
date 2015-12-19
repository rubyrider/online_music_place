window.MusicApp.controller 'NewreleasesCtrl', [
  '$scope', 'model.new_releases', 'utils.logging', '$http', '$location', '$routeParams', 'DateUtils',
  ($scope, NewReleases, Logging, $http, $location, $routeParams, DateUtils) ->

    NewReleases.getNewReleases().then (response) ->
      $scope.albums = _.chunk(response, 6);
      $("#song-loader .cube-loader-active").hide()

      Logging.info("[Models::Content]: #{$scope.albums}")

]