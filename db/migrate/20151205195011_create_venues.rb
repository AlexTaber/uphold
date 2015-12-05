class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name, null: false
      t.text   :bio, null: false

      t.timestamps null: false
    end
  end
end
