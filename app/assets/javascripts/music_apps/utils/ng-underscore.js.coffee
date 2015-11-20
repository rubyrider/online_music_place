underscore = angular.module('underscore', []);
underscore.factory('_', ['$window', ->
  $window._;
]);