
given_date= DateTime.parse("2016-11-15 13:00:00 -0400")

def create_booking(date, name, description, beginning_hour, ending_hour)

  Booking.create(date:        date,
                 name: name,
                 description: description,
                 beginning_hour: beginning_hour,
                 ending_hour: ending_hour)
end

create_booking(given_date,
               "Miguel",
               "programar",
               given_date.noon,
               given_date.noon + 2.hours)

create_booking(given_date,
               "Mariana",
               "programar",
               given_date.noon + 2.hours,
               given_date.noon + 4.hours)

create_booking(given_date.next_day,
               "Mariana",
               "programar",
               given_date.noon.next_day + 2.hours,
               given_date.next_day + 4.hours)

create_booking(given_date.next_week,
               "Mariana",
               "Estudiar",
               given_date.next_week + 2.hours,
               given_date.next_week + 4.hours)

create_booking(given_date.next_week(:friday),
               "Mariana",
               "Estudiar",
               given_date.next_week(:friday) + 2.hours,
               given_date.next_week(:friday) + 4.hours)


create_booking(given_date.next_week(:tuesday),
               "Mariana",
               "Estudiar",
               given_date.next_week(:tuesday) + 2.hours,
               given_date.next_week(:tuesday) + 4.hours)


