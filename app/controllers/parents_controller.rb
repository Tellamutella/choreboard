class ParentsController < ApplicationController
  before_action :authenticate_parent!

  def dashboard
    @tasks = policy_scope(Task)
    @rewards = policy_scope(Reward)
    @task = current_parent.tasks.new
    @reward = current_parent.rewards.new
    @child = Child.new
  end
end
