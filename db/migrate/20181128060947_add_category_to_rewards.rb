class AddCategoryToRewards < ActiveRecord::Migration[5.2]
  def change
    add_column :rewards, :category, :string
  end
end
