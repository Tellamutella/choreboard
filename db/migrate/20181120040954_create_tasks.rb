class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :parent, foreign_key: true
      t.string :objective
      t.text :key_results
      t.references :child, foreign_key: true
      t.boolean :mandatory, default: false

      t.timestamps
    end
  end
end
