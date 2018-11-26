class ChildrenController < ApplicationController
  before_action :authenticate_child!, only: :playground
  before_action :authenticate_parent!, only: %i[new create]

  def playground
    @tasks = current_child.tasks
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
