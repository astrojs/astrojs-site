
class Commit extends Spine.Model
  @configure 'Commit', 'library', 'author', 'date', 'message', 'sha'
  
  getUrl: -> return "https://github.com/astrojs/#{@library}/commit/#{@sha}"
  
module.exports = Commit