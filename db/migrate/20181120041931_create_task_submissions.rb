class CreateTaskSubmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :task_submissions do |t|
      t.references :task, foreign_key: true
      t.text :comment
      t.integer :state
      t.references :reward_request, foreign_key: true

      t.timestamps
    end
  end
end
