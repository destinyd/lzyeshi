class Admin::AdsController < InheritedResources::Base
  before_filter :authenticate_admin!
  layout 'admin'

  def create
    create!{ads_path}
  end

  protected
  def collection
    @ads ||= end_of_association_chain.accessible_by(current_ability).page params[:page]
  end
end
