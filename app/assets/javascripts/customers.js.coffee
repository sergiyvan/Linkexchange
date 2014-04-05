# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
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

  $.each($('.visual_search').data('query'), (i,obj) ->
    visualSearch.searchBox.addFacet("Category", obj)
    x = visualSearch.searchBox.value()
    visualSearch.searchBox.value(x)
  )

  $('.edit_customer').submit(->
    $.each(visualSearch.searchQuery.facets(), (i, obj) ->
        input = $("<input>")
            .attr("type", "hidden")
            .attr("name", "customer[categories_raw[#{i}]]").val(obj.Category.substr(0,1)).appendTo(".edit_customer")
    )
  )

$(document).ready(ready)
$(document).on('page:load', ready)

