{{config(materialized='table')}}

with import_invoice as (
    select 
        movie_id,
        month,
        location_id,
        studio,
        rental_cost
    from {{ ref('stg_invoices') }}

)

, import_movies as (
    select 
        movie_id,
        movie_title,
        genre,
        studio
    from {{ ref('stg_movie_catalogue') }}
    
)

select
    inv.movie_id,
    inv.month,
    inv.location_id,
    inv.studio,
    mov.movie_title,
    mov.genre,
    inv.rental_cost
from import_invoice inv
left join import_movies mov on inv.movie_id = mov.movie_id
order by inv.movie_id, inv.month, inv.location_id