$('document').ready ->
  statesCities = []
  loadStatesCities((data)->
    statesCities = data
  )
  
  $('#search').keyup ->
    if $('#search').val().trim().length >= 3
      if statesCities == null || statesCities.length == 0
        loadStatesCities((data)->
          cidade = searchCities(data, $('#search').val())
          console.log(cidade)
        )
      else
        cidade = searchCities(statesCities, $('#search').val())
        console.log(cidade)
    
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