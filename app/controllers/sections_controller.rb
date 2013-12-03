class SectionsController < InheritedResources::Base
  before_filter :authenticate_user!, except: [:index, :show]
  layout 'span12'
end
