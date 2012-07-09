
class Library extends Spine.Model
  @configure 'Library', 'name', 'description', 'homepage', 'clone_url', 'created_at', 'pushed_at', 'updated_at', 'url', 'watchers', 'open_issues'
  
  getUrl: -> return @clone_url.split('.git')[0]
  
  getDocumentation: -> return "http://astrojs.github.com/#{@name}/"
  
module.exports = Library