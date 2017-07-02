# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on('turbolinks:load', ->
  $.get("/artists/suggestions").then (suggestions) ->
    data = suggestions.map (suggestion) -> suggestion.name
    $('#search').typeahead({source: data})
  $('#tag_list').tokenfield()
)
