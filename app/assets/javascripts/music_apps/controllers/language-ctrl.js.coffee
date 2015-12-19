window.MusicApp.controller 'LangaugeCtrl', [
  '$scope', 'model.language', 'utils.logging','$http', '$location', '$routeParams', 'DateUtils',
  ($scope, Language, Logging, $http, $location, $routeParams, DateUtils) ->

    if $routeParams.id
      $("#jplayer_N").jPlayer( "clearMedia" );
      $("#jplayer_N").jPlayer( "destroy" );
      Language.getLanguage($routeParams.id).then (response) ->
        $scope.pageType = 'Language'
        $scope.album = response
        $scope.songs = response.songs
        window.MusicApp.murgi.addToPlaylist($scope.songs)
        $("#song-loader .cube-loader-active").hide()

        Logging.info("[Models::Genre]: #{$scope.songs}")
]