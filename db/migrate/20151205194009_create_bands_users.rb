class CreateBandsUsers < ActiveRecord::Migration
  def change
    create_table :bands_users do |t|
      t.integer :band_id, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
