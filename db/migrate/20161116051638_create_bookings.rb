class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.date :date
      t.datetime :timeInit
      t.integer :hours
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
