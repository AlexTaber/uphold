class CreateMusicians < ActiveRecord::Migration
  def change
    create_table :musicians do |t|
      t.string  :first_name, null: false
      t.string  :last_name, null: false
      t.text    :bio
      t.string  :instruments

      t.timestamps null: false
    end
  end
end
