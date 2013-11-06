define ->

  ###
    Test
    ----
    Automagically executes all methods matching `regex`. By default all methods
    starting with `test` will be executed. The test will execute the `setUp`
    and `tearDown` before and after each individual test.
  ###

  class Test
    regex: /^test.*$/
    run: =>
      @setUp()
      for name of @
        @runTest(name) if @shouldRun(name)
      @tearDown()
    shouldRun: (name) -> name.match @regex
    setUp: -> false
    tearDown: -> false
    runTest: (name) -> test(name, @[name])

  Test
