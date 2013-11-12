###
  TestCookie
  ----------

  Licensed under MIT license
  Copyright (c) 2013 Teun Zengerink
###

define [
  'tests/test',
  'classes/cookie',
], (
  Test,
  Cookie
) -> class TestCookie extends Test

  name: 'TestCookie'
  key: 'someKey'

  tearDown: -> document.cookie = "#{encodeURIComponent(@key)}=; expires=Thu, 01 Jan 1970 00:00:00 GMT"

  testGetSetAndDelete: ->
    cookie = new Cookie
    cookie.set(@key, 'someSampleValue')
    equal cookie.get(@key), 'someSampleValue'
    equal cookie.del(@key), true
    equal cookie.get(@key), null

TestCookie
