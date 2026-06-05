{{ config(materialized='incremental', unique_key='HOST_ID') }}
select 
    host_id,
    REPLACE(HOST_NAME, ' ', '_') as host_name,
    host_since AS HOST_SINCE,
    IS_SUPERHOST AS IS_SUPERHOST,
    response_rate AS RESPONSE_RATE,
    case 
        when response_rate > 95 then 'Very Good'
        when response_rate > 80 then 'Good'
        else 'POOR'
    end as response_rate_Quality,
    CREATED_AT
from {{ ref('bronze_hosts') }}

