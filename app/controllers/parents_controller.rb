class ParentsController < ApplicationController
  # skip_before_action :authenticate_child!
  def dashboard
    @tasks = policy_scope(Task)
    @rewards = policy_scope(Reward)
    @task = current_parent.tasks.new
    @reward = current_parent.rewards.new
  end
end
