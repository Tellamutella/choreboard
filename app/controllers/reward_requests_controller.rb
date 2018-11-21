class RewardRequestsController < ApplicationController
  before_action :authenticate_child!
  def new
    @reward_request = RewardRequest.new(state: -1, child: current_child)
    authorize @reward_request
    @rewards = Reward.where(daily: true).where(child: current_child)
    @reward = Reward.find(params[:reward_id])
  end

  def create
    @reward = Reward.find(params[:reward_id])
    @reward_request = RewardRequest.new(reward_request_params)
    @reward_request.child = current_child
    @reward_request.reward = @reward
    authorize @reward_request
    if @reward_request.save
      redirect_to playground_path
    else
      render :new
    end
  end

  private

  def reward_request_params
    params.require(:reward_request).permit(:reward_id, :state)
  end
end
