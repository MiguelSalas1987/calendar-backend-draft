class AddHoursFromBooking < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :beginning_hour, :datetime
    add_column :bookings, :ending_hour,    :datetime
  end
end
