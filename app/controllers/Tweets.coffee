Tweet  = require('models/Tweet')

class Tweets extends Spine.Controller
  @feeds =
    amit:  "http://twitter.com/statuses/user_timeline/386330001.json",
    astrojs: "http://twitter.com/statuses/user_timeline/601192485.json"
    dotastroH: "http://search.twitter.com/search.json?q=%23dotastro"
    astrojsH: "http://search.twitter.com/search.json?q=%23astrojs"
  @numFeeds = 4
  
  constructor: ->
    super
    @el = $("#tweets")
    @bind 'render', @render
    @getTweets()

  getTweets: ->
    count = 0
    for search, feed of Tweets.feeds
      do (search, feed) =>
        options =
          dataType: 'jsonp'
          url: feed
          callback: 'astrojstweetsbaby'
          success: (response) =>
            response = response["results"] if response.results?

            for tweet in response[0..2]
              params =
                name: search
                text: tweet['text']
                created_at: tweet['created_at']
              item = new Tweet params
              item.save()
            count += 1
            @trigger "render" if count is Tweets.numFeeds
        
        $.ajax(options)

  render: ->
    tweets = Tweet.sortByDate('created_at')
    @append require('views/tweets')(tweets)

module.exports = Tweets