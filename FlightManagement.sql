
-- select * from flights;
-- select * from passengers;
-- select * from bookings;
-- select * from airports;

-- 1. Retrive all the flight numbers from New Delhi to London.

select flight_number
from Flights
where origin_airport = 'New Delhi' and destination_airport = 'London';

use flights_management;

-- 2. Get all passengers who are born after the year 2000.

select *
from passengers
where year(date_of_birth) > 2000;

-- 3. Get all the bookings in the months of June,July and August.


select * 
from bookings
where month(booking_date) in (6, 7, 8);


-- 4. Get all the passenger names who are travelling to London.

select Passengers.first_name, Passengers.last_name
from Passengers
join Bookings 
on Passengers.passenger_id = Bookings.passenger_id
join Flights 
on Bookings.flight_id = Flights.flight_id
join Airports 
on Flights.destination_airport = Airports.airport_code
where Airports.city = 'London';


-- 5. What is the total number of flight departing from Syydney?.

select count(*) as total_flights
from Flights
join Airports 
on Flights.origin_airport = Airports.airport_code
where Airports.city = 'Sydney';

-- 6. Which country has the most number of airports?.

select country, count(*) as num_airports
from Airports
group by country
order by num_airports desc
limit 1;

-- 7. What is the total number of bookings for each flight?.

select flight_id, count(*) as total_bookings
from Bookings
group by flight_id;


-- 8. Get flight scheduled between 1st May and 7th May, with both dates included.

select * from flights
where departure_time >= '2024-05-01 00:00:00' and departure_time <= '2024-05-07 23:59:59'



