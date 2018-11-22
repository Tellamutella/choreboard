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
    @task_submission = TaskSubmission.find(:task_id)
    @task_submission.state = 1
    @task_submission.save

    if current_child.tasks.select(&:mandatory).all? {|task| task.task_submissions.any? ? task.task_submissions.last.state == 1 : false }
      # trigger/unblock reward request
    end
  end

  def reject(msg)
    @task_submission = TaskSubmission.find(:task_id)
    @task_submission.state = -1
    @task_submission.comment = msg
    if @task_submission.save # need to validate reject msg length
      redirect_to dashboard_path
    else
      render 'tast_submissions/new'
    end
  end

  private

  def task_submission_params
    params.require(:task_submission).permit(:task_id, :comment, :photo)
  end
end
