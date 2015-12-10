class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name, null: false
      t.text   :bio, null: false
      t.float  :latitude
      t.float  :longitude
      t.string :city, null: false
      t.string :state, null: false
      t.string :street, null: false
      t.string :country, null: false, default: "US"


      t.timestamps null: false
    end
  end
end
