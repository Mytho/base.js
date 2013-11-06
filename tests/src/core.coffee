requirejs ['tests/utils'], (tests...) ->

  (new Test).run() for Test in tests
