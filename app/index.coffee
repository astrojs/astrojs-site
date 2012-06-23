require('lib/setup')

Main  = require('controllers/Main')
Libs  = require('controllers/Libraries')
Docs  = require('controllers/Documentations')

class App extends Spine.Stack
  className: "astrojs"
  
  controllers:
    main  : Main
    libs  : Libs
    docs  : Docs
  
  routes:
    '/' : 'main'
  
  default: 'main'
  
  constructor: ->
    super
    Spine.Route.setup()

module.exports = App