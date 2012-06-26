Activity = require('modules/Activity')

class Tweet extends Spine.Model
  @configure 'Tweet', 'name', 'text', 'created_at'
  @extend Activity

  getDate: ->
    d = new Date(@created_at)
    [year, month, day] = [d.getFullYear(), d.getMonth() + 1, d.getDate()]
    return "#{year}-#{month}-#{day}"
  
  getMessage: ->
    msg = @text.replace(/#(\w+)/gi, "<a href='https://twitter.com/#!/search/%23$1'>#$1</a>")
    msg = msg.replace(/@(\w+)/gi, "<a href='https://twitter.com/#!/$1'>@$1</a>")
    return msg
  
module.exports = Tweet