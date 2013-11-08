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
  __handlers: {}

  # List of PubSub events.
  __events: {}

  # Map an object of 'name/function'-pair events.
  __mapOn: (map) -> @on(name, fn) for name, fn of map
  __mapBind: (element, map) -> @bind(element, name, fn) for name, fn of map

  # Add options to bind events to elements.
  bind: (element, name, fn) ->
    @__mapBind element, name if typeof name is 'object'
    @__handlers[element] = {} if typeof @__handlers[element] is 'undefined'
    @__handlers[element][name] = [] if typeof @__handlers[element][name] is 'undefined'
    @__handlers[element][name].push fn
    if element.addEventListener
      element.addEventListener name, fn, false
    else
      element.attachEvent "on#{name}", fn
    @
  fire: (element, name, args...) ->
    if @__handlers[element] and @__handlers[element][name]
      fn.apply(@, args) for fn in @__handlers[element][name]
    @
  unbind: (element, name) ->
    if @__handlers[element] and @__handlers[element][name]
      for fn in @__handlers[element][name]
        if element.removeEventListener
          element.removeEventListener name, fn, false
        else
          element.detachEvent name, fn
        @__handlers[element][name] = []
    @

  # Add simple PubSub-functionality to the class.
  off: (name) ->
    @__events[name] = []
    @
  on: (name, fn) ->
    @__mapOn(name) if typeof name is 'object'
    @__events[name] = [] if typeof @__events[name] is 'undefined'
    @__events[name].push fn
    @
  trigger: (name, args...) ->
    fn.apply(@, args) for fn in @__events[name]
    @

Events
