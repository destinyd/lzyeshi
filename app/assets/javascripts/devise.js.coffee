@show_trader_form = () ->
  if($('#user_is_trader:checked').size() == 0)
    $('#sign_up_trader').hide()
    $('#user_trader_attributes_name,#user_trader_attributes_address').attr('disabled',true)
  else
    $('#sign_up_trader').show()
    $('#user_trader_attributes_name,#user_trader_attributes_address').attr('disabled',false)

