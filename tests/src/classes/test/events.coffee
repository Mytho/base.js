###
  TestEvents
  ----------

  Licensed under MIT license
  Copyright (c) 2013 Teun Zengerink
###

define [
  '../../classes/test',
  '../../../../base/lib/classes/events'
], (
  Test,
  Events
) -> class TestEvents extends Test

  default: false
  setUp: -> @variable = @default

  # Test on/off/trigger functionality
  testEventsOn: ->
    events = new Events
    events.on 'test', -> @variable = not @default
    events.trigger 'test'
    equal @variable, not @default
  testEventsOff: ->
    events = new Events
    events.on 'test', -> @variable = not @default
    events.off 'test'
    events.trigger 'test'
    equal @variable, @default

  # TODO: Test event mapping functionality

TestEvents
