-- 50. Create a relative attack risk metric for each country, defined as:
-- (attacks per million inhabitants)
-- Consider only countries with known population data in a fictional auxiliary table called population(country_id, population_millions) and order the countries from most to least "dangerous".

with cte_attacks_population as (
    select
        country_id,
        round(count(*)::numeric / (population / 1000000), 2) as attacks_population
    from terrorism_act t
    join population p on p.id = t.country_id
    where population > 100000000
    group by country_id, population
)
select
    country,
    attacks_population
from cte_attacks_population ap
join country c on c.id = ap.country_id
order by attacks_population desc