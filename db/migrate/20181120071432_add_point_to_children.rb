class AddPointToChildren < ActiveRecord::Migration[5.2]
  def change
    add_column :children, :point, :integer, default: 0
  end
end
