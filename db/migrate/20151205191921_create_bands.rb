class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string  :name, null: false
      t.text    :bio
      t.integer :service_id

      t.timestamps null: false
    end
  end
end
