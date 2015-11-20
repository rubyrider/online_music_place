window.MusicApp.controller 'ContentCtrl', [
  '$scope', 'model.content', 'utils.logging', '$http', '$location', '$routeParams', 'DateUtils'
  ($scope, Content, Logging, $http, $location, $routeParams, DateUtils) ->

    Content.getHomePageContents().then (response) ->
      $scope.albums = response
      Logging.info("[Models::Content]: #{response}")

]