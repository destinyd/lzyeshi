class SectionsController < InheritedResources::Base
  before_filter :authenticate_admin!, except: [:index, :show]
  add_crumb(I18n.t("controller.sections")) { |instance| instance.send :sections_path }
  layout 'span12'
end
