with
    invalide_rows as (
        select *
        from mart_monthly_performance
        where rental_cost < 0
    )

select * 
from invalide_rows