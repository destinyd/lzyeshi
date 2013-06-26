class Admin::AdsController < InheritedResources::Base

  def create
    create!{ads_path}
  end
end
