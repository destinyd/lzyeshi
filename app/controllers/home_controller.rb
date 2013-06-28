class HomeController < ApplicationController
  layout 'span12', only: [:index, :download]
  def index
    @groups = Group.home_index
  end

  def contact
    @contacts = Contact::Base.own
    add_crumb(I18n.t("action.home.contact")) { |instance| instance.send :contact_path }
  end

  def download
    add_crumb(I18n.t("action.home.download")) { |instance| instance.send :download_path }
    @apks = Apk.download
  end
end
