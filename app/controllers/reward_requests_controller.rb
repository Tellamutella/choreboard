class RewardRequestsController < ApplicationController
  skip_before_action :authenticate_parent!, only: %i[create]
  skip_before_action :authenticate_child!, only: %i[create]
  def new
    @reward_request = RewardRequest.new(state: -1, child: current_child)
    authorize @reward_request
    @rewards = Reward.where(daily: true).where(child: current_child)
  end

  def create
    @reward_request = RewardRequest.new(state: -1, child: current_child)
    @reward = Reward.find(reward_request_params[:reward_id])
    @reward_request.reward = @reward
    if @reward_request.save
      redirect_to playground_path
    else
      render :new
    end
  end

  private

  def reward_request_params
    params.require(:reward_request).permit(:reward_id)
  end
end
