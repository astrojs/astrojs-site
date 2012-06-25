require('lib/setup')

Main  = require('controllers/Main')

class App extends Spine.Stack
  className: "astrojs"
  
  controllers:
    main  : Main
  
  routes:
    '/' : 'main'
  
  default: 'main'
  
  constructor: ->
    super
    Spine.Route.setup()

module.exports = App