class CreateBandMembers < ActiveRecord::Migration
  def change
    create_table :band_members do |t|
      t.integer :band_id, null: false
      t.integer :musician_id, null: false

      t.timestamps null: false
    end
  end
end
