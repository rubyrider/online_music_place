window.MusicApp.controller 'ContentCtrl', [
  '$scope', 'model.content', 'utils.logging', '$http', '$location', '$routeParams', 'DateUtils',
  ($scope, Content, Logging, $http, $location, $routeParams, DateUtils) ->

    Content.getLatestSongs().then (response) ->
      $scope.songs = _.chunk(response, 6);

      Logging.info("[Models::Content]: #{$scope.albums}")

    Content.getHomePageContents().then (response) ->
      $scope.albums = _.chunk(response, 6);

      Logging.info("[Models::Content]: #{$scope.albums}")

    Content.getMoodPlaylists().then (response) ->
      $scope.mplaylists = _.chunk(response, 6)

      Logging.info("[Models::Content]: #{$scope.albums}")

]