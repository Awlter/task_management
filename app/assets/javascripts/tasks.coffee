# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $('#show_closed').on 'change', (e) ->
    $target = $(e.target)
    currentState = $target.is(':checked')
    $.cookie('showClosedTask', currentState, { path:'/' })
    $('.list-group-item.closed').toggle(currentState).toggleClass('d-flex', currentState)