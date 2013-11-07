###
  TestEvents
  ----------

  Licensed under MIT license
  Copyright (c) 2013 Teun Zengerink
###

define [
  'tests/test',
  'classes/events'
], (
  Test,
  Events
) -> class TestEvents extends Test

  default: false
  setUp: -> @variable = @default
  tearDown: -> @variable = @default
  testEventsOn: ->
    events = new Events
    events.on 'test', => @variable = true
    events.trigger 'test'
    ok @variable
  testEventsOff: ->
    events = new Events
    events.on 'test', => @variable = true
    events.off 'test'
    events.trigger 'test'
    ok not @variable

TestEvents
