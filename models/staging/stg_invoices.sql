{{config(materialized='table')}}

with
import_invoices as (
select * from {{ source('silverscreen', 'invoices') }}
)

    select 
            movie_id,
            month,
            location_id,
            studio,
            min(total_invoice_sum) as rental_cost
    from import_invoices
    group by 1,2,3,4

