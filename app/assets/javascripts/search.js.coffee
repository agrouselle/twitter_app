# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

resetForm = (element) ->
  inputs = $(element).find("input[type=text]")

  for input in inputs
    @value = ''

$(document).ready ->
  $('#search-form button[type=reset]').bind 'click', (event) =>
    resetForm '#search-form'