window.MusicApp.controller 'ContentCtrl', [
  '$scope', 'model.content', 'utils.logging', '$http', '$location', '$routeParams', 'DateUtils',
  ($scope, Content, Logging, $http, $location, $routeParams, DateUtils) ->

    Content.getHomePageContents().then (response) ->
      $scope.albums = _.chunk(response, 4);

      Logging.info("[Models::Content]: #{$scope.albums}")

    Content.getRandomPlaylists().then (response) ->
      $scope.random_playlist_id = response

    Content.getUserPlaylists().then (response) ->
      $scope.playlists = response

      Logging.info("[Models::Content]: #{$scope.albums}")

]