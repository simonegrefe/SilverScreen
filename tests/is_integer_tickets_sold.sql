with   
    is_integer as (
        select *
        from {{ ref('mart_monthly_performance') }}
        where tickets_sold is not null
        and tickets_sold != floor(tickets_sold)
    )

select *
from is_integer




