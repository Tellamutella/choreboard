class CreateRewards < ActiveRecord::Migration[5.2]
  def change
    create_table :rewards do |t|
      t.references :parent, foreign_key: true
      t.references :child, foreign_key: true
      t.integer :price
      t.string :name
      t.text :details
      t.boolean :daily, default: false
      t.boolean :claimed, default: false

      t.timestamps
    end
  end
end
