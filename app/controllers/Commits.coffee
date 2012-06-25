Lib     = require('models/Library')
Commit  = require('models/Commit')

class Commits extends Spine.Controller

  constructor: ->
    super
    @el = $("#activity")  # Not sure why this is not working as it should
    @getCommits()
  
  getCommits: ->
    libs = Lib.all()
    for lib in libs
      do (lib) =>
        api_url = "#{lib.url}/commits?per_page=3"
        options =
          dataType: 'jsonp'
          url: api_url
          callback: 'astrojsreposbaby'
          success: (response) =>
            meta = response["meta"]
            return null unless meta.status is 200
      
            commits = response["data"]
            for commit in commits
              params =
                library: lib.name
                author: commit['commit']['author']['name']
                date: commit['commit']['author']['date']
                message: commit['commit']['message']
                sha: commit['sha']
              item = new Commit params
              item.save()
              @append require('views/commit')(item)

        $.ajax(options)

module.exports = Commits