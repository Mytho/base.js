###
  Test
  ----

  Automagically executes all methods matching `regex`. By default all methods
  starting with `test` will be executed. The test will execute the `setUp`
  and `tearDown` before and after each individual test.

  Licensed under MIT license
  Copyright (c) 2013 Teun Zengerink
###

define -> class Test

  regex: /^test.*$/
  run: (name) ->
    if name.match @regex
      @setUp()
      test(name, => @[name]())
      @tearDown()
  runAll: -> @run(name) for name of @
  setUp: -> false
  tearDown: -> false

Test
