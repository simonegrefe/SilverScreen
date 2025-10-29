with 
    invalide_rows as (
        select *
        from mart_monthly_performance
        where revenue < 0
    )

select * 
from invalide_rows