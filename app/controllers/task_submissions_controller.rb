class TaskSubmissionsController < ApplicationController
  before_action :authenticate_child!

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
      p @task_submission
      redirect_to playground_path
    else
      render :new
    end
  end

  def approve
    # @task_submission = TaskSubmission.find(:task_id)
    # @task_submission.state = 1
    # @task_submission.save

    # @mandatory_task = @task.where(mandatory: true, child: current_child)
    # @mandatory_task.each do |task|
    # if task.state < 1

    # set state of task_submission = 1
    # save submission
    # check if all mandatory task complete
    # if yes: trigger reward request, if no: do nothing
  end

  def reject
    # set state of task_submission = -1
    # set comment to something
    # save submission
  end

  private

  def task_submission_params
    params.require(:task_submission).permit(:task_id, :comment, :photo)
  end
end
