-- 47. For each region, identify the attack type that resulted in the highest average number of deaths per event, considering only events between 2000 and 2010. List the region, the attack type, and the average fatalities.

with cte_kills_attack as (
    select
        region_id,
        attack_id,
        sum(nkill) as deaths,
        count(*) as n_attacks,
        round(sum(nkill)::numeric / count(*) , 2) as avg_deaths_attacks
    from terrorism_act
    where iyear between 2000 and 2010
    and nkill is not null
    and attack_id is not null
    group by attack_id, region_id
),
cte_ranking_avg_deaths as (
    select
        *,
        row_number() over(
            partition by region_id
            order by avg_deaths_attacks desc
        ) as ranking
    from cte_kills_attack
)
select
    region,
    attack,
    avg_deaths_attacks
from cte_ranking_avg_deaths rad
join region r on r.id = rad.region_id
join attack a on a.id = rad.attack_id
where ranking = 1
order by avg_deaths_attacks desc
