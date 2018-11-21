class AddChildToRewardRequests < ActiveRecord::Migration[5.2]
  def change
    add_reference :reward_requests, :child, foreign_key: true
  end
end
