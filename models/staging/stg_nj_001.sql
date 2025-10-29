{{config(materialized='view')}}

with import_nj_001 as (
    select * from {{ source('silverscreen', 'nj_001') }}
)

select
    date_trunc('month', timestamp)::date as month,
    movie_id,
    'NJ_001' as location_id,    
    sum(ticket_amount) as tickets_sold,
	sum(transaction_total) as revenue
from import_nj_001
group by 1,2,3