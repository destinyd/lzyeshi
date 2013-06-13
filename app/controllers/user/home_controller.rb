class User::HomeController < ApplicationController
  layout 'user'
  def index
    
  end

  def authentications
    @authentications = current_user.authentications
  end
end
