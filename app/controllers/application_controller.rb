class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, :alert => exception.message
  end

  include ApplicationHelper

  private
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
  def after_sign_in_path_for(resource)
    dashboard_path
  end
  def after_sign_up_path_for(resource)
  	dashboard_path
  end
end
