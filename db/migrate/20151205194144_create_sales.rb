class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string  :key, null: false
      t.integer :user_id, null: false
      t.integer :package_id, null: false

      t.timestamps null: false
    end
  end
end
