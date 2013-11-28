class Admin::ApksController < InheritedResources::Base
  before_filter :authenticate_admin!
  layout 'left_nav'

  def create
    create!{apks_path}
  end

  def update
    update!{apks_path}
  end

  def updated_version
    @apk = Apk.find(params[:id]).updated_version
  end

  protected
  def collection
    @apks ||= end_of_association_chain.accessible_by(current_ability).download.page params[:page]
  end
end
