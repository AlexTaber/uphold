class CreateBandsEvents < ActiveRecord::Migration
  def change
    create_table :bands_events do |t|
      t.integer :band_id, null: false
      t.integer :event_id, null: false

      t.timestamps null: false
    end
  end
end
