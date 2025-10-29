{{ config(materialized="view") }}

with import_movie_catalogue as (
    select * from {{ source('silverscreen', 'movie_catalogue') }}
)

select 
    movie_id, 
    movie_title, 
    coalesce(genre, 'Unknown') as genre, 
    studio
from import_movie_catalogue
