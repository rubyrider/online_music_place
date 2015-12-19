window.MusicApp.controller "ArtistCtrl", [ "$scope", "model.artist", "utils.logging", "$http", "$location", "$routeParams", "DateUtils", ($scope, Artist, Logging, $http, $location, $routeParams, DateUtils) ->

  console.log('hello');

  if $routeParams.id
    Artist.getArtist($routeParams.id).then (response) ->
      $scope.artist = response.artist
      $scope.songs = response.songs
      Logging.info "[Models::Artist]: " + $scope.artist
      $("#song-loader .cube-loader-active").hide()

  else
    Artist.getAllArtist().then (response) ->
      $scope.artists = _.chunk(response, 4);

]