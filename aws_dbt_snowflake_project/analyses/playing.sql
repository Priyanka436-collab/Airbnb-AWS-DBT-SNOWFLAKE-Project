select * from {{ ref('bronze_bookings') }} 
where NIGHTS_BOOKED > 1