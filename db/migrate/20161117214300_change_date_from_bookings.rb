class ChangeDateFromBookings < ActiveRecord::Migration[5.0]
  def change
    change_column :bookings, :date, :datetime
  end
end
