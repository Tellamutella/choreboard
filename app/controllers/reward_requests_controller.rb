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

  def update
    @reward_request = RewardRequest.find(params[:id])
    @reward_request.state = params[:approved] == 'true' ? 1 : -1
    @reward_request.save
    # if @reward_request.save
    #    respond_to do |format|
    #       format.html { redirect_to ... }
    #       format.js
    # else
    #   respond_to do |format|
    #      format.html { render ... }
    #      format.js
    # end
  end
end
