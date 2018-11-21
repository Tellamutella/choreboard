class AddChildToTaskSubmissions < ActiveRecord::Migration[5.2]
  def change
    add_reference :task_submissions, :child, foreign_key: true
    add_column :task_submissions, :photo, :string
    change_column :task_submissions, :state, :integer, :default => 0
  end
end
