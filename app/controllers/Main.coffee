Libs    = require('controllers/Libraries')
Tweets  = require('controllers/Tweets')
Commits = require('controllers/Commits')

class Main extends Spine.Controller
  elements:    
    '#libraries'  : 'libraries'
    '#activity'   : 'activity'
    '#tweets'     : 'tweets'

  constructor: ->
    super

    @html require('views/main')()
    
    libs    = new Libs(el: @libraries)
    
    libs.bind "retrievedLibraries", @initControllers
    libs.getRepos()
    
  initControllers: ->
    new Commits(el: @activity)

module.exports =  Main