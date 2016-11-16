
given_date= Date.parse("2016-11-15 21:57:50 -0400")

def create_booking(date, timeInit, hours, name, description)

Booking.create(date:        date,
               timeInit:    timeInit,
               hours:       hours,
               description: description,
               name: name)
end

create_booking(given_date, given_date.noon, 1, "Miguel", "programar" )
create_booking(given_date.next_day, given_date.noon, 1, "Mariana", "programar" )
create_booking(given_date.next_week, given_date.noon, 1, "Nestor", "Tocar guitarra" )
create_booking(given_date.next_week(:friday), given_date.noon, 1, "Daniel", "Reunion de trabajo" )
create_booking(given_date.next_week.next_week(:tuesday), given_date.noon, 1, "Miguel", "Estudiar" )
