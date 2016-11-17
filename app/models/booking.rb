class Booking < ApplicationRecord

  def self.search(date)
    given_date = Date.parse(date)
    beginning_of_week = given_date.beginning_of_week(:sunday)
    end_of_week       = given_date.end_of_week()     #sunday
    bookings_data = Booking.where("date > ? and date  < ?",
                                     "#{beginning_of_week}",
                                     "#{end_of_week}")

    bookings = bookings_data.map do |booking|
      {
        date:           booking.date.localtime,
        name:           booking.name,
        description:    booking.description,
        beginning_hour: booking.beginning_hour.localtime,
        ending_hour:    booking.ending_hour.localtime,
        id:             booking.id
      }
    end
    bookings
  end
end
