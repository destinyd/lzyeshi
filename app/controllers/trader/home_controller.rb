class Trader::HomeController < ApplicationController
  def index
    if trader_signed_in?
      redirect_to dashboard_path
    else
      redirect_to new_trader_session_path
    end
  end

  def dashboard
    
  end

  def contact
    
  end
end
