$(document).on "turbolinks:load", ->
  $("#new_message").on "keypress", (e) ->
    if e && e.keyCode == 13
      e.preventDefault()
      if $(this).submit()
        $('#new_message').find('input:text').val('');

