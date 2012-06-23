class Main extends Spine.Controller

  constructor: ->
    super

    @html require('views/main')()

module.exports =  Main