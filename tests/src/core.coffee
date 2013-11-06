requirejs ['tests/classes'], (tests...) ->

  (new Test).run() for Test in tests
