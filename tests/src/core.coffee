###
  Core
  ----

  Tests configuration and method to run each Test provided by the required
  modules.

  Licensed under MIT license
  Copyright (c) 2013 Teun Zengerink
###

requirejs.config(
  paths
    tests: '../../classes'
    classes: '../../../../base/lib/classes'
)

requirejs [
  'classes/test/events'
], (tests...) -> (new Test).run() for Test in tests
