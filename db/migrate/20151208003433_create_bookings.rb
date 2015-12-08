class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :band_id, null: false
      t.integer :event_id, null: false
      t.integer :rank, null: false

      t.timestamps null: false
    end
  end
end
