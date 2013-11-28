class Trader::HomeController < ApplicationController
  layout 'left_nav'
  #layout 'application', only: :index
  def index
    if user_signed_in?
      redirect_to dashboard_path
    else
      render :index
      #redirect_to new_user_session_url(subdomain: ENV["SUBDOMAIN"])
    end
  end

  def dashboard
    
  end

  def contact
    
  end
end
