###
  TestEvents
  ----------

  Licensed under MIT license
  Copyright (c) 2013 Teun Zengerink
###

define [
  'tests/test',
  'classes/events',
], (
  Test,
  Events
) -> class TestEvents extends Test

  name: 'TestEvents'
  default: false
  varOne: false
  varTwo: false
  setUp: -> @varOne = @varTwo = @default

  testBind: ->
    el = document.getElementsByTagName('html')[0]
    (new Events)
      .bind(el, 'click', (arg) => @varOne = arg)
      .fire(el, 'click', 'some-test-string')
      .unbind(el, 'click')
    equal @varOne, 'some-test-string'
  testBindMap: ->
    el = document.getElementsByTagName('html')[0]
    (new Events)
      .bind(el,
        mouseenter: => @varOne = 'some-test-string'
        mouseleave: => @varTwo = 'some-test-string'
      )
      .fire(el, ['mouseenter', 'mouseleave'])
      .unbind(el, ['mouseenter', 'mouseleave'])
    equal @varOne, 'some-test-string'
    equal @varTwo, 'some-test-string'
  testUnbind: ->
    el = document.getElementsByTagName('html')[0]
    (new Events)
      .bind(el, 'click', => @varOne = not @default)
      .unbind(el, 'click')
      .fire(el, 'click')
    equal @varOne, @default
  testOn: ->
    (new Events)
      .on('test', (arg) => @varOne = arg)
      .trigger('test', 'some-test-string')
    equal @varOne, 'some-test-string'
  testOnMap: ->
    (new Events)
      .on(
        testOne: => @varOne = 'some-test-string'
        testTwo: => @varTwo = 'some-test-string'
      )
      .trigger(['testOne', 'testTwo'])
      .off(['testOne', 'testTwo'])
    equal @varOne, 'some-test-string'
    equal @varTwo, 'some-test-string'
  testOff: ->
    events = new Events
    events.on 'test', => @varOne = not @default
    events.off 'test'
    events.trigger 'test'
    equal @varOne, @default
