###
  TestKeyHandler
  --------------

  Licensed under MIT license
  Copyright (c) 2013 Teun Zengerink
###

define [
  'tests/test',
  'classes/keyhandler',
], (
  Test,
  KeyHandler
) -> class TestKeyHandler extends Test

  name: 'TestKeyHandler'
  default: false
  variable: false
  setUp: -> @variable = @default

  testOn: ->
    keyHandler = new KeyHandler
    keyHandler.on 'space', => @variable = 'some-string'
    keyHandler.trigger 'space'
    keyHandler.off 'space'
    equal @variable, 'some-string'
  testOff: ->
    keyHandler = new KeyHandler
    keyHandler.on 'space', => @variable = 'some-other-string'
    keyHandler.off 'space'
    keyHandler.trigger 'space'
    equal @variable, @default
