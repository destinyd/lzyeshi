class HomeController < ApplicationController
  def index
    @groups = Group.all
  end

  def contact
    @contacts = Contact::Base.system
  end
end
