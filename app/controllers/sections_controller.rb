class SectionsController < InheritedResources::Base
  before_filter :authenticate_admin!, except: [:index, :show]
  layout 'span12'
end
