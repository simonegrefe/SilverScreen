{{config(materialized='table')}}

select 
    month,
    movie_id,
    location_id,
    tickets_sold,
    revenue
from {{ ref('stg_nj_001') }}

UNION

select    
    month,
    movie_id,
    location_id,
    tickets_sold,
    revenue
from {{ ref('stg_nj_002') }}

UNION

select    
    month,
    movie_id,
    location_id,
    tickets_sold,
    revenue
from {{ ref('stg_nj_003') }}
order by month, movie_id