{{config(materialized='view')}}

with import_nj_002 as (
    select * from {{ source('silverscreen', 'nj_002') }}
)

select
    date_trunc('month', date) as month,
    movie_id,
    'NJ_002' as location_id,    
    sum(ticket_amount) as tickets_sold,
	sum(ticket_amount * ticket_price) as revenue
from import_nj_002
group by 1,2,3