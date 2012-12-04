'use strict'

# jasmine specs for controllers go here

# TODO figure out how to test Controllers that use modules
describe "controllers", ->

  beforeEach(module "app.controllers")

  describe "OverviewCtrl", ->

    it "should make scope testable", inject ($rootScope, $controller) ->
      scope = $rootScope.$new()
      ctrl = $controller "OverviewCtrl",
        $scope: scope,
      expect(scope.topics.length).toBe(1)
