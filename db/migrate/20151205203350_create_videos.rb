class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string  :url, null: false
      t.integer :videoable_id, null: false
      t.string  :videoable_type, null: false

      t.timestamps null: false
    end
  end
end
