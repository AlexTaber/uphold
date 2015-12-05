class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url, null: false
      t.string :name, null: false
      t.integer :linkable_id, null: false
      t.string  :linkable_type, null: false

      t.timestamps null: false
    end
  end
end
