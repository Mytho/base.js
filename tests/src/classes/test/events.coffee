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
  varOne: false
  varTwo: false
  setUp: -> @varOne = @varTwo = @default

  testEventsBind: ->
    events = new Events
    el = document.getElementsByTagName('html')[0]
    events.bind el, 'click', (arg) => @varOne = arg
    events.fire el, 'click', 'some-test-string'
    events.unbind el, 'click'
    equal @varOne, 'some-test-string'
  testEventsBindMap: ->
    events = new Events
    element = document.getElementsByTagName('html')[0]
    events.bind element,
      mouseenter: => @varOne = 'some-test-string'
      mouseleave: => @varTwo = 'some-test-string'
    events.fire element, 'mouseenter'
    events.fire element, 'mouseleave'
    events.unbind element, 'mouseenter'
    events.unbind element, 'mouseleave'
    equal @varOne, 'some-test-string'
    equal @varTwo, 'some-test-string'
  testEventsUnbind: ->
    events = new Events
    el = document.getElementsByTagName('html')[0]
    events.bind el, 'click', => @varOne = not @default
    events.unbind el, 'click'
    events.fire el, 'click'
    equal @varOne, @default
  testEventsOn: ->
    events = new Events
    events.on 'test', (arg) => @varOne = arg
    events.trigger 'test', 'some-test-string'
    equal @varOne, 'some-test-string' 
  testEventsOnMap: ->
    events = new Events
    events.on
      testOne: => @varOne = 'some-test-string'
      testTwo: => @varTwo = 'some-test-string'
    events.trigger 'testOne'
    events.trigger 'testTwo'
    events.off 'testOne'
    events.off 'testTwo'
    equal @varOne, 'some-test-string'
    equal @varTwo, 'some-test-string'
  testEventsOff: ->
    events = new Events
    events.on 'test', => @varOne = not @default
    events.off 'test'
    events.trigger 'test'
    equal @varOne, @default

TestEvents
