{{config(materialized='table')}}

with
import_movies as (
    select 
        movie_id,
        month,
        location_id,
        studio,
        rental_cost,
        movie_title,
        genre
    from {{ ref('int_movies') }}

)

, import_nj_monthly_revenue as (
    select
        month,
        movie_id,
        location_id,
        tickets_sold,
        revenue
    from {{ ref('int_nj_monthly_rev') }}

)

select
    mo.movie_id,
    mo.movie_title,
    mo.genre,
    mo.studio,
    mo.month,
    mo.location_id as location,
    nj.tickets_sold,
    mo.rental_cost,
    nj.revenue,
    round(nj.revenue / mo.rental_cost,2) as gross_margin
from import_movies as mo
left join import_nj_monthly_revenue nj 
on mo.movie_id = nj.movie_id and mo.location_id = nj.location_id and mo.month = nj.month
order by mo.month, mo.movie_id, mo.location_id
    

