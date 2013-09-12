class Dashing.Errbit extends Dashing.Widget

  ready: ->
    @ready = true
    @start()

  onData: (data) ->
    clearInterval @interval if @interval
    @start() if @ready == true

  start: ->
    @views().hide()
    @firstView().show()

    @index = 0
    @startAnimation()

  startAnimation: ->
    @interval = setInterval @animateView.bind(this), 5000

  animateView: ->
    @currentView().hide()
    @determineNextView()
    if @views().length == 1
      @currentView().show()
    else
      @currentView().fadeIn()

  determineNextView: ->
    if (@index + 1) >= @views().length
      @index = 0
    else
      @index += 1

  currentView: ->
    $(@views()[@index])

  firstView: ->
    $(@views()[0])

  views: ->
    $(@node).find "ul li"
