{% set configs =[
{
   "table_name": "airbnb.Gold.obt",
    "columns": "gold_obt.booking_id,gold_obt.host_id,gold_obt.listing_id,gold_obt.total_amount,gold_obt.service_fee,gold_obt.cleaning_fee,gold_obt.accommodates,gold_obt.bedrooms,gold_obt.bathrooms,gold_obt.price_per_night,gold_obt.response_rate",
    "alias": "gold_obt"
},
{
    "table_name": "airbnb.Gold.Dim_listings",
     "columns": "",
     "alias": "Dim_listings",
     "join_condition": "gold_obt.listing_id = Dim_listings.listing_id"
},
{
    "table_name": "airbnb.Gold.Dim_hosts",
     "columns": "",
     "alias": "Dim_hosts",
     "join_condition": "gold_obt.host_id = Dim_hosts.host_id"
}
] %}


select 

  {{ configs[0]['columns'] }}

from
   {% for config in configs %}
   {% if loop.first %}
   {{ config['table_name'] }} as {{ config['alias'] }}
   {% else %}
   left join {{ config['table_name'] }} as {{ config['alias'] }} on {{ config['join_condition'] }}
   {% endif %}
{% endfor%}



