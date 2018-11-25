class RewardRequestsController < ApplicationController
  def create
    @reward = authorize Reward.find(params[:reward_id])
    @reward_request = @reward.reward_requests.new(state: 0)
    @reward_request.child = current_child
    if @reward_request.save
      respond_to do |format|
        format.html { redirect_to playground_path }
        format.js
      end
    else
      raise
    end
  end

  def update
    @reward_request = authorize RewardRequest.find(params[:id])
    @reward_request.state = params[:approved] == 'true' ? 1 : -1
    @reward_request.reward.claimed = params[:approved] == 'true'
    if @reward_request.save && @reward_request.reward.save
        respond_to do |format|
          format.js
        end
    # else
    #   respond_to do |format|
    #      format.html { render ... }
    #      format.js
    end
  end
end
