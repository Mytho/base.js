###
  Events
  ------

  Your class can extend this simple `Events` class to support events by
  itself. The events class also accepts an object containing a map of
  'name/function'-pairs.

  Licensed under MIT license
  Copyright (c) 2013 Teun Zengerink
###

define -> class Events

  # Event handlers for the events bound to elements.
  _handlers: {}

  # List of PubSub events.
  _events: {}

  _mapPubSub: (method, obj, args...) ->
    if Object::toString.call(obj) is '[object Array]'
      method.apply(@, [name, args]) for name in obj
    else
      method.apply(@, [name, fn, args]) for name, fn of obj
  _mapEvents: (method, element, obj, args...) ->
    if Object::toString.call(obj) is '[object Array]'
      method.apply(@, [element, name, args]) for name in obj
    else
      method.apply(@, [element, name, fn, args]) for name, fn of obj

  # Add options to bind events to elements.
  bind: (element, name, fn) ->
    @_mapEvents(@bind, element, name) if typeof name is 'object'
    @_handlers[element] = {} if typeof @_handlers[element] is 'undefined'
    @_handlers[element][name] = [] if typeof @_handlers[element][name] is 'undefined'
    @_handlers[element][name].push fn
    if element.addEventListener
      element.addEventListener name, fn, false
    else
      element.attachEvent "on#{name}", fn
    @
  fire: (element, name, args...) ->
    @_mapEvents(@fire, element, name) if typeof name is 'object'
    if @_handlers[element] and @_handlers[element][name]
      fn.apply(@, args) for fn in @_handlers[element][name]
    @
  unbind: (element, name) ->
    @_mapEvents(@unbind, element, name) if typeof name is 'object'
    if @_handlers[element] and @_handlers[element][name]
      for fn in @_handlers[element][name]
        if element.removeEventListener
          element.removeEventListener name, fn, false
        else
          element.detachEvent name, fn
        @_handlers[element][name] = []
    @

  # Add simple PubSub-functionality to the class.
  off: (name) ->
    @_mapPubSub(@off, name) if typeof name is 'object'
    @_events[name] = []
    @
  on: (name, fn) ->
    @_mapPubSub(@on, name) if typeof name is 'object'
    @_events[name] = [] if typeof @_events[name] is 'undefined'
    @_events[name].push fn
    @
  trigger: (name, args...) ->
    if typeof name is 'object'
      @_mapPubSub(@trigger, name, args)
    else
      fn.apply(@, args) for fn in @_events[name]
    @
