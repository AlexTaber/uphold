class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string  :name, null: false
      t.text    :description
      t.decimal :price, precision: 9, scale: 2, null: false
      t.integer :event_id, null: false

      t.timestamps null: false
    end
  end
end
