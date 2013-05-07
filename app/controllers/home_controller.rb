class HomeController < ApplicationController
  def index
    @groups = Group.available
  end

  def contact
    @contacts = Contact::Base.system
    add_crumb(I18n.t("action.home.contact")) { |instance| instance.send :contact_path }
  end

  def download
    add_crumb(I18n.t("action.home.download")) { |instance| instance.send :download_path }
  end
end
