'use strict'

### Controllers ###

angular.module('app.controllers', [])

.controller('AppCtrl', [
    '$scope'
  '$location'
  '$resource'
  '$rootScope'

($scope, $location, $resource, $rootScope) ->

  # Uses the url to determine if the selected
  # menu item should have the class active.
  $scope.$location = $location
  $scope.$watch('$location.path()', (path) ->
    $scope.activeNavId = path || '/'
  )

  # getClass compares the current url with the id.
  # If the current url starts with the id it returns 'active'
  # otherwise it will return '' an empty string. E.g.
  #
  #   # current url = '/products/1'
  #   getClass('/products') # returns 'active'
  #   getClass('/orders') # returns ''
  #
  $scope.getClass = (id) ->
    if $scope.activeNavId.substring(0, id.length) == id
      return 'active'
    else
      return ''
])

.controller('TodoCtrl', [
  '$scope'

($scope) ->

  $scope.todos = [
    text: "learn angular"
    done: true
  ,
    text: "build an angular app"
    done: false
  ]

  $scope.addTodo = ->
    $scope.todos.push
      text: $scope.todoText
      done: false

    $scope.todoText = ""

  $scope.remaining = ->
    count = 0
    angular.forEach $scope.todos, (todo) ->
      count += (if todo.done then 0 else 1)

    count

  $scope.archive = ->
    oldTodos = $scope.todos
    $scope.todos = []
    angular.forEach oldTodos, (todo) ->
      $scope.todos.push todo  unless todo.done

])

.controller('OverviewCtrl', [
  '$scope'

  ($scope) ->

    $scope.topics = [#topics
        {
            linkText : "Javascript unit-testing and d3.js",
            uri : "#/overview",
            subs : [#subtopics
                {
                    linkText : "Javascript Unit-Testing",
                    uri : "#/unit-testing",
                    subs : [#granular
                      {
                        linkText : "Test Runners",
                        uri : "#/unit-testing/testrunners"
                      },{
                        linkText : "Testacular",
                        uri : "#/unit-testing/testacular"
                      },{
                        linkText : "BDD",
                        uri : "#/unit-testing/bdd"
                      },{
                        linkText : "Examples!",
                        uri : "#/unit-testing/examples"
                      },{
                        linkText : "Libraries",
                        uri : "#/unit-testing/libraries"
                      }
                    ]
                },{
                    linkText : "d3.js",
                    uri : "#/d3",
                    subs : [
                        {
                            linkText : "What is it?",
                            uri : "#/d3/about"
                        },{
                            linkText : "No callbacks...say wha?",
                            uri : "#/d3/no-callbacks"
                        }
                    ]
                }
            ]
        }
    ]
])