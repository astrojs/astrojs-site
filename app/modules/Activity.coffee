Activity =
  sortByDate: (key) ->
    
    items = @.all()
    
    sorted = items.sort( (a, b) ->
      [d1, d2] = [new Date(a[key]), new Date(b[key])]
      return d2 - d1
    )
    return sorted
    
module.exports = Activity