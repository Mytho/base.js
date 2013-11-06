define ->

  # Events
  # ------
  # Your class can extend this simple `Events` class to support events by
  # itself. The events class also accepts an object containing a map of
  # 'name/function'-pairs.
  class Events
    __events: {}
    __map: (map) -> @on(name, fn) for fn, name in map
    off: (name) -> @__events[name] = []
    on: (name, fn) ->
      @__map(name) if typeof name is 'object'
      @__events[name] = [] if typeof @__events[name] is 'undefined'
      @__events[name].push fn
    trigger: (name, args...) -> fn.apply(@, args) for fn in @__events[name]

  # Create a globally available pubsub instance
  pubsub: new Events

  Events: Events
