###
  TestUrl
  -------

  Licensed under MIT license
  Copyright (c) 2013 Teun Zengerink
###

define [
  'tests/test',
  'classes/url',
], (
  Test,
  Url
) -> class TestUrl extends Test

  name: 'TestUrl'
  baseOne: 'some/base'
  baseTwo: 'some/other/base/'
  uriOne: 'some/longer/uri'
  uriTwo: '/some/longer/uri/'

  testBase: ->
    urlOne = new Url @baseOne
    urlTwo = new Url @baseTwo
    equal urlOne.base(), "#{window.location.protocol}//#{window.location.host}/#{@baseOne}"
    equal urlTwo.base(), "#{window.location.protocol}//#{window.location.host}/#{@baseTwo.replace /^\/|\/$/g, ''}"
  testSite: ->
    urlOne = new Url @baseOne
    urlTwo = new Url @baseTwo
    equal urlOne.site(@uriOne), "#{window.location.protocol}//#{window.location.host}/#{@baseOne}/#{@uriOne}"
    equal urlTwo.site(@uriTwo), "#{window.location.protocol}//#{window.location.host}/#{@baseTwo.replace /^\/|\/$/g, ''}/#{@uriTwo.replace /^\/|\/$/g, ''}"

TestUrl
