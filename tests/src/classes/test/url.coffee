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
  uriOne: 'some/longer/uri'
  uriTwo: '/some/longer/uri/'
  uriThree: 'some/longer/uri/'

  testBase: -> equal (new Url).base(), "#{window.location.protocol}//#{window.location.host}#{require.toUrl ''}"
  testSite: ->
    url = new Url
    equal url.site(@uriOne), "#{window.location.protocol}//#{window.location.host}#{require.toUrl ''}#{@uriOne}"
    equal url.site(@uriTwo), "#{window.location.protocol}//#{window.location.host}#{require.toUrl ''}#{@uriTwo.replace /^\/|\/$/g, ''}"
    equal url.site(@uriThree), "#{window.location.protocol}//#{window.location.host}#{require.toUrl ''}#{@uriThree.replace /^\/|\/$/g, ''}"
