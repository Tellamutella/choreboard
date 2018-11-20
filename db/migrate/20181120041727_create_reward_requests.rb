class CreateRewardRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :reward_requests do |t|
      t.references :reward, foreign_key: true
      t.integer :state

      t.timestamps
    end
  end
end
