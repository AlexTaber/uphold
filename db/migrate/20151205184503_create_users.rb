class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :email, null: false, unique: true
      t.string  :first_name, null: false
      t.string  :last_name, null: false
      t.string  :password_digest, null: false
      t.text    :bio
      t.boolean :admin, null: false, default: false
      t.integer :venue_id

      t.timestamps null: false
    end
  end
end
