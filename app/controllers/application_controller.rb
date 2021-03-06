class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  add_crumb I18n.t("title"), '/'

  #helper_method :current_trader

  def after_sign_in_path_for(resource)
    #admin login in domain
    #if resource.has_role?(:admin)
      #users_url(subdomain: ENV['ADMIN_SUBDOMAIN'])
      ##user login in subdomain
    #els
    if resource.has_role?(:trader)
      if resource.trader
        dashboard_url(subdomain: ENV['TRADER_SUBDOMAIN'])
      else
        root_url(subdomain: ENV['SUBDOMAIN'])
      end
      #subdomain_root_path
    else
      super
    end
  end

  def after_sign_out_path_for(resource)
    #puts "called from after_sign_out_path"
    root_url(:subdomain => ENV['SUBDOMAIN'])
  end

  def after_sign_up_path_for(resource)
    if resource.has_role?(:trader)
      new_trader_url(subdomain: ENV['TRADER_SUBDOMAIN'])
    else
      super
    end
  end

  def authenticate_admin!
    not_found unless current_user.has_role? :admin
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
