class RewardRequestsController < ApplicationController
  def create
    @reward = Reward.find(params[:reward_id])
    @reward_request = @reward.reward_requests.new(state: 0)
    @reward_request.child = current_child
    if @reward_request.save
      redirect_to playground_path
    else
      raise
    end
  end
end
