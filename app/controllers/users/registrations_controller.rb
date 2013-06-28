class Users::RegistrationsController < Devise::RegistrationsController
  layout :registrations_layout
  add_crumb(I18n.t("action.registrations.new"))

  private
  def registrations_layout
    case action_name
    when 'edit'
      'user'
    when 'new'
      'span12'
    else
      'application'
    end
  end
end
