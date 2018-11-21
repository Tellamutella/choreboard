class AddNameToParents < ActiveRecord::Migration[5.2]
  def change
    add_column :parents, :name, :string
  end
end
