###
  Url
  ---

  Class that assists in creating the correct Url for any environment.

  Licensed under MIT license
  Copyright (c) 2013 Teun Zengerink
###

define -> class Url

  # Strip leading and trailing slashes of a given string.
  __stripSlashes: (str) -> str.replace /^\/|\/$/g, ''

  # Set the base URI when it is provided
  constructor: (baseUri = '') -> @baseUri = @__stripSlashes baseUri

  # Get the base URL for the application.
  base: (protocol = '') ->
    protocol = protocol || window.location.protocol.replace(':', '')
    "#{protocol}://#{window.location.host}#{if @baseUri then '/' else ''}#{@baseUri}"

  # Get a full application URL for a given URI.
  site: (uri, protocol) -> "#{@base protocol}/#{@__stripSlashes uri}"

Url
