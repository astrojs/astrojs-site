Lib  = require('models/Library')

class Libraries extends Spine.Controller

  constructor: ->
    super
  
  getRepos: ->
    options =
      dataType: 'jsonp'
      url: 'https://api.github.com/orgs/astrojs/repos'
      callback: 'astrojsreposbaby'
      success: (response) =>
        meta = response["meta"]
        return null unless meta.status is 200
        
        repos = response["data"]
        for repo in repos
          item = new Lib repo
          item.save()
        repos = Lib.all()
        @append require('views/libs')(repos)
        @trigger 'retrievedLibraries'

    $.ajax(options)

module.exports = Libraries