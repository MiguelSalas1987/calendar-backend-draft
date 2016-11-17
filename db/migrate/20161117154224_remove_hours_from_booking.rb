class RemoveHoursFromBooking < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookings,  :hours, :integer
    remove_column :bookings,  :timeInit, :datetime
  end
end
