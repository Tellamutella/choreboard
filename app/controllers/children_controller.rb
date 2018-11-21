class ChildrenController < ApplicationController
  skip_before_action :authenticate_child!, only: %i[new create]
  skip_before_action :authenticate_parent!, only: :playground
  def playground
  end

  ###########################################
  def new
    @child = authorize current_parent.children.new
  end

  def create
    @child = authorize current_parent.children.new(child_params)
    if @child.save
      redirect_to dashboard_path
    else
      render :new
    end
  end
  ############################################

  private

  def child_params
    params.require(:child).permit(:email, :password)
  end
end
