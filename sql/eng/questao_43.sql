-- 43. Show, for each country, the percentage difference between the total number of attacks and the total number of successful attacks. List only countries with at least 100 attacks.
select
    country,
    round((count(*)::numeric / sum(case when success then 1 else 0 end) - 1) * 100, 2) as succesfull_perc_difference
from terrorism_act t
join country c on c.id = t.country_id
group by country
having count(*) >= 100;
