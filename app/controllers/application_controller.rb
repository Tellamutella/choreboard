class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_parent!
  before_action :authenticate_child!
  include Pundit

   after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

   private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

end


