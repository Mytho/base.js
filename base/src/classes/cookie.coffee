###
  Cookie
  ------

  Class that assists in reading and writing cookie data.

  Licensed under MIT license
  Copyright (c) 2013 Teun Zengerink
###

define -> class Cookie

  del: (key, path, domain) ->
    return false if not key || not @has(key)
    domain = if domain then "; domain=#{domain}" else ''
    path = if path then "; path=#{path}" else ''
    document.cookie = "#{encodeURIComponent(key)}=; expires=Thu, 01 Jan 1970 00:00:00 GMT#{domain}#{path}"
    true
  get: (key) -> decodeURIComponent(document.cookie.replace(new RegExp("(?:(?:^|.*;)\\s*#{encodeURIComponent(key).replace(/[\-\.\+\*]/g, '\\$&')}\\s*\\=\\s*([^;]*).*$)|^.*$"), '$1')) or null
  has: (key) -> (new RegExp("(?:^|;\\s*)#{encodeURIComponent(key).replace(/[\-\.\+\*]/g, "\\$&")}\\s*\\=")).test(document.cookie)
  set: (key, value, end, path, domain, secure) ->
    return false if not key || /^(?:expires|max\-age|path|domain|secure)$/i.test(key)
    expires = ''
    if end
      switch end.constructor
        when Number then expires = "; max-age=#{end}"
        when String then expires = "; expires=#{end}"
        when Date then expires = "; expires=#{end.toString()}"
    domain = if domain then "; domain=#{domain}" else ''
    path = if path then "; path=#{path}" else ''
    secure = if secure then "; secure" else ''
    document.cookie = "#{encodeURIComponent(key)}=#{encodeURIComponent(value)}#{expires}#{domain}#{path}#{secure}"
