'use strict'

App = angular.module('btl', [])

App.controller('')

App.controller("ChooseElectorateController", ['$scope', '$http', ($scope, $http) ->
  divisions = {}
  houseOfReps = {}
  senate = {}
  $scope.states = {}

  $scope.divisionsForState = {}

  $http.get("/json/states.json").success (data) -> $scope.states = data
  $http.get("/json/house_of_representatives.json").success (data) -> houseOfReps = data
  $http.get("/json/senate.json").success (data) -> senate = data
  $http.get("/json/divisions.json").success (data) -> divisions = data

  $scope.stateChanged = ->
    if $scope.stateId
      $scope.divisionsForState = _.object(_.filter(_.pairs(divisions), (div) -> $scope.stateId == div[1].state))
    else
      $scope.divisionsForState = {}
    $scope.divisionChanged()

    $scope.state = $scope.states[$scope.stateId]
    $scope.senators = senate[$scope.stateId]

  $scope.divisionChanged = ->
    $scope.division = divisions[$scope.divisionId]
    $scope.representative = houseOfReps[$scope.divisionId]

])

# Declare app level module which depends on filters, and services
# App = angular.module('app', [
#   'ngCookies'
#   'ngResource'
#   'app.controllers'
#   'app.directives'
#   'app.filters'
#   'app.services'
#   'partials'
# ])

# App.config([
#   '$routeProvider'
#   '$locationProvider'

# ($routeProvider, $locationProvider, config) ->

#   $routeProvider

#     .when('/todo', {templateUrl: '/partials/todo.html'})
#     .when('/view1', {templateUrl: '/partials/partial1.html'})
#     .when('/view2', {templateUrl: '/partials/partial2.html'})

#     # Catch all
#     .otherwise({redirectTo: '/todo'})

#   # Without server side support html5 must be disabled.
#   $locationProvider.html5Mode(false)
# ])
