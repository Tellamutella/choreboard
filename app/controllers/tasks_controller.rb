class TasksController < ApplicationController
   skip_before_action :authenticate_child!, only: %i[show new create]
  def new
    @task = Task.new
    authorize @task
  end

  def create
    @task = current_parent.tasks.new(task_params)
    authorize @task
    if @task.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])
    authorize @task
    @task.destroy
    redirect_to @task_path
  end

  def edit
  end

  def update
  end

  def show
    @task = Task.find(params[:id])
    authorize @task
  end

  def task_params
    params.require(:task).permit(:objective, :key_results, :child_id, :mandatory)
  end
end
