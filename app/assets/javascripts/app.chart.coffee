class App.Chart
  constructor: (@el) ->
    # intialize some stuff

  render: ->
    puts "paint index"

$(document).on "page:change", ->
  return 
  f = new App.Chart $("#chart")
  f.render()