{{ config(materialized='incremental', unique_key='BOOKING_ID') }}

select 
    BOOKING_ID,
    LISTING_ID,
    BOOKING_DATE,
    {{ multiply('nights_booked', 'booking_amount', 2) }} as total_amount,
    service_fee,
    cleaning_fee,
    CREATED_AT,
    booking_status
from {{ ref('bronze_bookings') }}
