# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  if $(window).width() < 600
    $('.today').addClass('card');
  
  $('.see-more-details').click ->
    $('#more-details').show(200)