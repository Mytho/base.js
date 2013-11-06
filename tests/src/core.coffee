requirejs ['classes/test/events'], (tests...) ->

  # Run each test provided by the modules
  (new Test).run() for Test in tests
