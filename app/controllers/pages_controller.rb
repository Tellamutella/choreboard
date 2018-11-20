class PagesController < ApplicationController
  skip_before_action :authenticate_parent!, only: :home
  skip_before_action :authenticate_child!, only: :home

  def home
  end
end
