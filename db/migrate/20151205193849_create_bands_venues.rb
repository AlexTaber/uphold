class CreateBandsVenues < ActiveRecord::Migration
  def change
    create_table :bands_venues do |t|
      t.integer :band_id, null: false
      t.integer :venue_id, null: false

      t.timestamps null: false
    end
  end
end
