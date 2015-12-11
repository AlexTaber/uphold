class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string   :name, null: false
      t.text     :description, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.integer  :total_headliners, null: false, default: 1
      t.boolean  :live, null: false, default: false
      t.integer  :venue_id, null: false
      t.integer  :profile_image_id
      t.integer  :cover_image_id

      t.timestamps null: false
    end
  end
end
