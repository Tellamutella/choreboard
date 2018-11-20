class AddNameToChildren < ActiveRecord::Migration[5.2]
  def change
    add_column :children, :name, :string
  end
end
