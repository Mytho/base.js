###
  TestKeyHandler
  --------------

  Licensed under MIT license
  Copyright (c) 2013 Teun Zengerink
###

define [
  '../../classes/test',
  '../../../../base/lib/classes/keyhandler',
], (
  Test,
  KeyHandler
) -> class TestKeyHandler extends Test

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

  # TODO: Tests throws global failure on keypress, fix it

TestKeyHandler
