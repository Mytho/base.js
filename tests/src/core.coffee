###
  Core
  ----

  Tests configuration and method to run each Test provided by the required
  modules.

  Licensed under MIT license
  Copyright (c) 2013 Teun Zengerink
###

require.config window.BASE.config

requirejs [
  'tests/test/cookie',
  'tests/test/events',
  'tests/test/keyhandler',
  'tests/test/url',
], (tests...) -> 
  (new Test).runAll() for Test in tests
