Tweet  = require('models/Tweet')

class Tweets extends Spine.Controller
  @feeds =
    astrojs:  "http://twitter.com/statuses/user_timeline/386330001.json",
    dotastro: "http://search.twitter.com/search.json?q=%23dotastro"
  
  constructor: ->
    super
    @el = $("#tweets")
    @bind 'render', @render
    @getTweets()

  getTweets: ->
    [number, count] = [2, 0]
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
              @append require('views/tweets')(item)
            count += 1
            @trigger "render" if count is number
        
        $.ajax(options)

  render: ->
    tweets = Tweet.sortByDate('created_at')
    @append require('views/tweets')(tweets)

module.exports = Tweets