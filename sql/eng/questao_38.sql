-- 38.  List the five countries with the highest number of attacks in areas with unidentified cities. Show the quantity and the percentage relative to the country’s total.
select
    country,
    sum_city_unknown,
    sum_attack_country,
    round((sum_city_unknown::numeric / sum_attack_country) * 100, 2) as perc
from (
    select
        country_id,
        count(*) sum_attack_country,
        sum(case when city is null or city in ('Unknown', '') then 1 else 0 end) as sum_city_unknown
    from terrorism_act
    group by country_id
) as sub
join country c on c.id = sub.country_id
order by perc desc
limit 5;
