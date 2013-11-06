define ['../test', '../../../base/lib/utils'], (Test, Utils) ->

  class TestUtils extends Test
    default: false
    setUp: -> @variable = @default
    tearDown: -> @variable = @default
    testEventsOn: ->
      events = new Utils.Events
      events.on 'test', => @variable = true
      events.trigger 'test'
      ok @variable
    testEventsOff: ->
      events = new Utils.Events
      events.on 'test', => @variable = true
      events.off 'test'
      events.trigger 'test'
      ok not @variable
    testPubsubOn: ->
      Utils.pubsub.on 'test', => @variable = true
      Utils.pubsub.trigger 'test'
      ok @variable
    testPubsubOff: ->
      Utils.pubsub.on 'test', => @variable = true
      Utils.pubsub.off 'test'
      Utils.pubsub.trigger 'test'
      ok not @variable

  TestUtils
