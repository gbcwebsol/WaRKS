this.disable_buttons = (guest) ->
  if guest
    $('.disabled_unless_guest').attr('disabled',null)
    $('.disabled_if_guest').attr('disabled','disabled')
  else
    $('.disabled_unless_guest').attr('disabled','disabled')
    $('.disabled_if_guest').attr('disabled',null)

$ ->
  disable_buttons $('#accept_number').length > 0
