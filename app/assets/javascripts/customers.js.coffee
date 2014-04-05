# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  visualSearch = VS.init(
    container : $('.visual_search')
    query     : ''
    callbacks :
      facetMatches : (callback) ->
        callback [
          'Category'
        ]
      valueMatches : (facet, searchTerm, callback) ->
        switch facet
          when 'Category'
            callback $('.visual_search').data('facets')
  )