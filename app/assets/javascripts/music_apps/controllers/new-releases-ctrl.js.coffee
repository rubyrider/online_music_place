window.MusicApp.controller 'NewReleasesCtrl', [
  '$scope', 'model.content', 'utils.logging', '$http', '$location', '$routeParams', 'DateUtils',
  ($scope, Content, Logging, $http, $location, $routeParams, DateUtils) ->

    Content.getHomePageContents().then (response) ->
      $scope.albums = _.chunk(response, 3);
      $("#song-loader .cube-loader-active").hide()

      Logging.info("[Models::Content]: #{$scope.albums}")

]