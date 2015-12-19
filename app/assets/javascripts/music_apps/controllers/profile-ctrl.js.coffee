window.MusicApp.controller "ProfileCtrl", [ "$scope", "model.profile", "utils.logging", "$http", "$location", "$routeParams", "DateUtils", ($scope, Profile, Logging, $http, $location, $routeParams, DateUtils) ->

  console.log('hello');

  if $routeParams.id
    Profile.getProfile($routeParams.id).then (response) ->
      $scope.profile = response
      $scope.songs = response.songs
      Logging.info "[Models::Profile]: " + $scope.artist
      $("#song-loader .cube-loader-active").hide()

  else
    Artist.getAllArtist().then (response) ->
      $scope.artists = _.chunk(response, 4);

]