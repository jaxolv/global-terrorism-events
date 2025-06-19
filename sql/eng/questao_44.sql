-- 44. List the five countries with the highest average number of different attack types per year (annual variety). 
with cte_country_per_avg as (
    select 
        country_id,
        round(avg(attacks_per_year), 2) as avg_types_attacks_country
    from (
        select
            country_id,
            iyear,
            count(distinct attack_id) as attacks_per_year
        from terrorism_act
        where attack_id is not null
        group by country_id, iyear
    ) as sub
    group by country_id
)
select
    country,
    avg_types_attacks_country
from cte_country_per_avg m
join country c on c.id = m.country_id
order by avg_types_attacks_country desc
limit 5;
