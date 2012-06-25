Tweet  = require('models/Tweet')

class Tweets extends Spine.Controller
  @userUrl = "http://twitter.com/statuses/user_timeline/386330001.json"
  @mentionsUrl = ""
  
  constructor: ->
    super
    @el = $("#activity")  # Not sure why this is not working as it should
    @getTweets()

  getTweets: ->
    options =
      dataType: 'jsonp'
      url: Tweets.userUrl
      callback: 'astrojstweetsbaby'
      success: (response) =>
        for tweet in response[0..3]
          params =
            text: tweet['text']
            created_at: tweet['created_at']
          item = new Tweet params
          item.save()
          @append require('views/tweet')(item)
        
    $.ajax(options)

module.exports = Tweets