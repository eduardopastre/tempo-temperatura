$('document').ready ->
  statesCities = []
  loadStatesCities((data)->
    statesCities = data
  )
  
  $('#search-city').keyup ->
    if $('#search-city').val().trim().length >= 3
      if statesCities == null || statesCities.length == 0
        loadStatesCities((data)->
          cities = searchCities(data, $('#search-city').val())
          appendCities($("#search-results"), cities)
        )
      else
        cities = searchCities(statesCities, $('#search-city').val())
        appendCities($("#search-results"), cities)
    
# ---------------------------- functions -------------------------------#

loadStatesCities = (callback)->
  $.getJSON('estados-cidades.json', (data)->
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
    element.append("<a href='http://localhost:3000'>"+val+"</a>")
  )