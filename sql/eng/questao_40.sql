-- 40.  List the three years with the highest percentage growth in attacks compared to the previous year. Ignore years with fewer than 100 attacks.

with cte_attacks_per_year as (
    select
        iyear as year,
        count(*) as attacks_per_yr
    from terrorism_act
    group by iyear
),
cte_percentage_range as (    
    select
        concat(year, ' - ', year_next) as intervalo_anos,
        attacks_per_yr as attacks_first_year,
        attacks_next_year,
        round(((attacks_next_year::numeric / attacks_per_yr) * 100) - 100, 2) as perc
    from (
        select
            a1.year,
            a1.attacks_per_yr,
            a2.year as year_next,
            a2.attacks_per_yr as attacks_next_year
        from cte_attacks_per_year a1
        join cte_attacks_per_year a2 on a1.year = a2.year - 1
        where a1.attacks_per_yr >= 100
    ) as sub
)
select
    *
from cte_percentage_range
where perc > 0
order by perc desc
limit 3;