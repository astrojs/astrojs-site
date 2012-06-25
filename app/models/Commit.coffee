
class Commit extends Spine.Model
  @configure 'Commit', 'library', 'author', 'date', 'message', 'sha'
  
  getUrl: -> return "https://github.com/astrojs/#{@library}/commit/#{@sha}"
  
  getDate: ->
    d = new Date(@date)
    [year, month, day] = [d.getFullYear(), d.getMonth() + 1, d.getDate()]
    return "#{year}-#{month}-#{day}"
module.exports = Commit