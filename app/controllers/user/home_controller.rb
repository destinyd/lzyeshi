class User::HomeController < ApplicationController
  layout 'left_nav'
  def index
    
  end

  def authentications
    @authentications = current_user.authentications
  end
end
