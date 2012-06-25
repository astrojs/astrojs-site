Activity = require('modules/Activity')

class Tweet extends Spine.Model
  @configure 'Tweet', 'name', 'text', 'created_at'
  @extend Activity

  getDate: ->
    d = new Date(@created_at)
    [year, month, day] = [d.getFullYear(), d.getMonth() + 1, d.getDate()]
    return "#{year}-#{month}-#{day}"
    
module.exports = Tweet