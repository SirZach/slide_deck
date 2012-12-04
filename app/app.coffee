'use strict'

# Declare app level module which depends on filters, and services
App = angular.module('app', [
  'ngCookies'
  'ngResource'
  'app.controllers'
  'app.directives'
  'app.filters'
  'app.services'
])

App.config([
  '$routeProvider'
  '$locationProvider'

($routeProvider, $locationProvider, config) ->

  $routeProvider

    .when('/overview', {templateUrl: '/partials/overview.html'})
    .when('/unit-testing', {templateUrl: '/partials/unit-testing.html'})
    .when('/unit-testing/testrunners',
      {templateUrl: '/partials/testrunners.html'})
    .when('/unit-testing/libraries', {templateUrl: '/partials/libraries.html'})
    .when('/unit-testing/testacular',
      {templateUrl: '/partials/testacular.html'})
    .when('/unit-testing/bdd', {templateUrl: '/partials/bdd.html'})
    .when('/unit-testing/challenges', {templateUrl:'/partials/challenges.html'})
    .when('/unit-testing/examples',
      {templateUrl: '/partials/examples.html'})
    # Catch all
    .otherwise({redirectTo: '/overview'})

  # Without server side support html5 must be disabled.
  $locationProvider.html5Mode(false)
])
