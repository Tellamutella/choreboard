class AddPointToChildren < ActiveRecord::Migration[5.2]
  def change
    add_column :children, :point, :integer
  end
end
