class HomeController < ApplicationController
  def index
    @groups = Group.all
  end

  def contact
    
  end
end
