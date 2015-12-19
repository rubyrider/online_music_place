window.MusicApp.controller 'GenreCtrl', [
  '$scope', 'model.genre', 'utils.logging','$http', '$location', '$routeParams', 'DateUtils',
  ($scope, Genre, Logging, $http, $location, $routeParams, DateUtils) ->

    if $routeParams.id
      $("#jplayer_N").jPlayer( "clearMedia" );
      $("#jplayer_N").jPlayer( "destroy" );
      Genre.getGenre($routeParams.id).then (response) ->
        $scope.album = response
        $scope.pageType = 'Genre'
        $scope.songs = response.songs
        window.MusicApp.murgi.addToPlaylist($scope.songs)
        $("#song-loader .cube-loader-active").hide()

        Logging.info("[Models::Genre]: #{$scope.songs}")
]