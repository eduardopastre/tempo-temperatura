$(document).on 'turbolinks:load', ->
  statesCities = []
  loadStatesCities((data)->
    statesCities = data
  )
  
  $('#search-city').keyup ->
    searchVal = $('#search-city').val()
    if searchVal.trim().length >= 3
      if statesCities == null || statesCities.length == 0
        loadStatesCities((data)->
          cities = searchCities(data, searchVal)
          appendCities($("#search-results"), cities)
        )
      else
        cities = searchCities(statesCities, searchVal)
        appendCities($("#search-results"), cities)
    else if searchVal == ""
      $("#search-results").empty()

  $('#search-city').blur ->
    #setTimeout -> 
      #$("#search-results").empty()
    #, 300

  #$('#search-city').focus ->

    
# ---------------------------- functions -------------------------------#

loadStatesCities = (callback)->
  $.getJSON('/estados-cidades.json', (data)->
    callback(data)
  )

searchCities = (statesCities, filter)->
  filter = filter.toLowerCase().replace(/\s/g, '')
  cities = []
  $.each(statesCities, (key, val)->
    $.each(val, (keyStates, valStates)->
      $.each(valStates.cidades, (keyCities, valCities)->
        idx = valCities.toLowerCase().replace(/\s/g, '').indexOf(filter)
        if idx > 0
          cities.push(valStates.sigla+" - "+valCities)
        else if idx == 0
          cities.unshift(valStates.sigla+" - "+valCities)
      )
    )
  )
  cities

appendCities = (element, cities)->
  element.empty()
  $.each(cities, (key, val)->
    params = val.split('-')
    link = "http://localhost:3000/previsao/cidade/"+params[1].trim()+"/"+params[0].trim()
    element.append("<a href='"+link+"'>"+val+"</a>")
  )