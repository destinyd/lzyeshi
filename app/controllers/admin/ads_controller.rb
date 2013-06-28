class Admin::AdsController < InheritedResources::Base
  before_filter :authenticate_admin!
  layout 'admin'

  def create
    create!{ads_path}
  end
end
