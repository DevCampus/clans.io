Steroids =
  load: (callback) ->
    callback ?= ->

    if _.contains window.location.search.slice(1).split('&'), 'steroids'
      console.log('steroids loaded')
      script = document.createElement('script')
      script.type = 'text/javascript'
      script.src = 'http://localhost/cordova.js'
      script.onload = ->
        Session.set('steroids', true)
        document.addEventListener("deviceready", callback, false)
      script.onerror = (err) ->
        Session.set('steroids-error', err)
        callback(err)

      head = document.getElementsByTagName('head')[0]
      head.appendChild(script)

    else
      console.log('steroids disabled')
      Session.set('steroids', false)
