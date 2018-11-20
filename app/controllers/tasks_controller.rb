class TasksController < ApplicationController

  def new
    @task = Task.new
    authorize @task
  end

  def create
    @task = current_parent.tasks.new(task_params)
    authorize @task
    if @task.save
      redirect_to @task
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

  end

  def task_params
    params.require(:task).permit(:parent_id, :objective, :key_results, :child_id, :mandatory)
  end
end
