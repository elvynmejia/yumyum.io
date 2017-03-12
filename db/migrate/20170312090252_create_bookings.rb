class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :confirmation_number
      t.string :message
      t.datetime :date_time
      t.integer :party_size
      t.integer :restaurant_id

      t.timestamps null: false
    end
  end
end
