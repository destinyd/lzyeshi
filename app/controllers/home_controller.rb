class HomeController < ApplicationController
  layout 'span12', only: [:index, :download]
  def index
    @groups = Group.home_index
    @articles = Article.recent
  end

  def contact
    @contacts = Contact::Base.own
    @comments = Comment.system.limit(1)
    add_crumb(I18n.t("action.home.contact")) { |instance| instance.send :contact_path }
  end

  def download
    add_crumb(I18n.t("action.home.download")) { |instance| instance.send :download_path }
    @apks = Apk.download
  end
end
