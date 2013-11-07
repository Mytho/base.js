###
  Core
  ----

  Tests configuration and method to run each Test provided by the required
  modules.

  Licensed under MIT license
  Copyright (c) 2013 Teun Zengerink
###

requirejs [
  'classes/test/events',
  'classes/test/keyhandler',
], (tests...) -> 
  (new Test).runAll() for Test in tests
