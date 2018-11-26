class RewardsController < ApplicationController
  def index
  @rewards = policy_scope(Reward).order(created_at: :desc)
  end

  def show
    @reward = Reward.find(params[:id])
    authorize @reward
  end

  def new
    @reward = Reward.new
    authorize @reward
  end

  def create
    @reward = Reward.new(reward_params)
    @reward.parent = current_parent
    authorize @reward
    if @reward.save
      redirect_to dashboard_path
    end
  end

  # def update
  #   if @reward.update(reward_params)
  #     redirect_to dashboard_path
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  # end

  private

  def reward_params
    params.require(:reward).permit(:name, :details, :price, :child_id, :daily)
  end
end
