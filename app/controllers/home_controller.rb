class HomeController < ApplicationController
  def index
    @groups = Group.available
  end

  def contact
    @contacts = Contact::Base.system
  end
end
