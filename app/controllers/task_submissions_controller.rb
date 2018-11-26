class TaskSubmissionsController < ApplicationController
  def new
    @task_submission = TaskSubmission.new(state: 0, child: current_child)
    authorize @task_submission
    @tasks = Task.where(mandatory: true, child: current_child)
    @task = Task.find(params[:task_id])
  end

  def create
    @task = Task.find(params[:task_id])
    @task_submission = TaskSubmission.new(task_submission_params)
    @task_submission.child = current_child
    @task_submission.task = @task
    authorize @task_submission
    if @task_submission.save
      redirect_to playground_path
    else
      render :new
    end
  end

  def update
    @task_submission = authorize TaskSubmission.find(params[:id])
    @task_submission.state = params[:approved] == 'true' ? 1 : -1
    @task_submission.save
    if @task_submission.save
        respond_to do |format|
          format.js
        end
    # else
    #   respond_to do |format|
    #      format.html { render ... }
    #      format.js
    end
  end

  private

  def task_submission_params
    params.require(:task_submission).permit(:task_id, :comment, :photo)
  end
end
