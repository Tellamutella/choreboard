class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception #, unless: -> { request.format.json? }

  include Pundit
  alias pundit_user current_parent

  after_action :verify_authorized, except: [:index, :dashboard, :playground], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: [:index], unless: :skip_pundit?
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def after_sign_in_path_for(resource)
    if resource.class.name == "Parent"
      "/dashboard"
    else
      "/playground"
    end
  end

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
