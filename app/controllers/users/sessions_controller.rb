class Users::SessionsController < Devise::SessionsController
  layout 'span12'

  add_crumb(I18n.t("controller.sessions"))
end

