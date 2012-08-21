$.fn.extend

  pushDown: (speed, callback) ->

    if typeof speed == "function"
      callback = speed
      speed = 333

    return $(@).each ->
      $el = $(@)

      finalHeight = $el.show().outerHeight(true)

      $wrapper = $("<div>")
      $wrapper.css
        width: "100%"
        height: 0
        position: "relative"

      $container = $("<div>")
      $container.css
        width: "100%"
        position: "absolute"
        bottom: 0

      $wrapper.append($container)
      $wrapper.children().append $el.clone()

      $el.replaceWith($wrapper)

      $wrapper.animate({
        height: finalHeight
      }, speed, =>
        $wrapper.replaceWith($el)
        callback() if callback?
      )

  pushUp: (speed, callback) ->

    if typeof speed == "function"
      callback = speed
      speed = 333

    return $(@).each ->
      $el = $(@)

      fullHeight = $el.outerHeight(true)

      $wrapper = $("<div>")
      $wrapper.css
        width: "100%"
        height: fullHeight
        position: "relative"

      $container = $("<div>")
      $container.css
        width: "100%"
        position: "absolute"
        bottom: 0

      $wrapper.append($container)
      $wrapper.children().append $el.clone()

      $el.replaceWith($wrapper)

      $wrapper.animate({
        height: 0
      }, speed, =>
        $el.hide()
        $wrapper.replaceWith($el)
        callback() if callback?
      )