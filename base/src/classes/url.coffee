###
  Url
  ---

  Class that assists in creating the correct URL for any environment based on
  the requirejs config variable.

  Licensed under MIT license
  Copyright (c) 2013 Teun Zengerink
###

define -> class Url

  # Strip leading and trailing slashes of a given string.
  __normalize: (str) -> str.replace /^\/|\/$/g, ''

  # Get the base URL for the application.
  base: (protocol = '') ->
    protocol = protocol || window.location.protocol.replace(':', '')
    "#{protocol}://#{window.location.host}#{require.toUrl ''}"

  # Get a full application URL for a given URI.
  site: (uri, protocol) -> "#{@base protocol}#{@__normalize uri}"
