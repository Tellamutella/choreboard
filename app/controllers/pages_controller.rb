class PagesController < ApplicationController
  skip_before_action :authenticate_parent!, only: :home
  def home
  end
end
