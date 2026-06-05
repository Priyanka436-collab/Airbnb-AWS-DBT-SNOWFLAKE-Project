{{ config(
    materialized = 'incremental',unique_key='LISTING_ID')
}}

select 
    LISTING_ID,
    HOST_ID,
    PROPERTY_TYPE,
    ROOM_TYPE,
    ACCOMMODATES,
    BEDROOMS,
    BATHROOMS,
    PRICE_per_night,
    {{ tag('CAST(PRICE_per_night AS int)') }}  as price_per_night_tag,
    CREATED_AT
from {{ ref('bronze_listings') }}