class CreateSounds < ActiveRecord::Migration
  def change
    create_table :sounds do |t|
      t.string  :url, null: false
      t.integer :soundable_id, null: false
      t.string  :soundable_type, null: false

      t.timestamps null: false
    end
  end
end
