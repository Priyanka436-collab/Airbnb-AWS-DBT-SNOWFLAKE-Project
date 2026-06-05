{{
    config(materialized = 'ephemeral')
}}

with listings as 
(
select
    listing_id,
    property_type,
    room_type,
    price_per_night_tag,
    silver_listings_created_at
    from {{ ref('obt') }}
)
select * from listings