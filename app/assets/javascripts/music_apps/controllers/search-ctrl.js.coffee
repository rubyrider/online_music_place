window.MusicApp.controller 'SearchCtrl', [
  '$scope', 'model.album', 'utils.logging', '$http', '$location', '$routeParams', 'DateUtils',
  ($scope, Album, Logging, $http, $location, $routeParams, DateUtils) ->
    $scope.submitSearchForm = ->
      if($scope.query)
        $location.path('/search').search(query: $scope.query )
      else
        alert('Please enter your query')

]