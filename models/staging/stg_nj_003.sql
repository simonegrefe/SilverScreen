{{config(materialized='view')}}

with import_nj_003 as (
    select * from {{ source('silverscreen', 'nj_003') }}
)

select
    date_trunc('month', timestamp)::date as month,
    details as movie_id,
    'NJ_003' as location_id,    
    sum(amount) as tickets_sold,
	sum(total_value) as revenue
from import_nj_003
where product_type = 'ticket'
group by 1,2,3
