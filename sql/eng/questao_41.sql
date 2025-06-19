-- 41.  For each region, calculate an "instability index" defined as:
-- (total number of different attack types per country) x (average fractional percentage of successful attacks in the region)
-- List the regions with their indexes, ordered from highest to lowest. 

with cte_sum_attacks_regions as (
    select
        region_id,
        sum(attacks_country) as sum_attacks_countries,
        avg(perc_attacks_succesfull) as avg_attacks_succesfull_region
    from (
        select
            country_id,
            region_id,
            count(distinct attack_id) as attacks_country,
            sum(case when success then 1 else 0 end)::numeric / count(*) as perc_attacks_succesfull
        from terrorism_act
        where attack_id is not null
        group by country_id, region_id
    ) as sub
    group by region_id
)
select
    region,
    round(
        avg_attacks_succesfull_region * sum_attacks_countries, 2
    ) as instability_index
from cte_sum_attacks_regions sva
join region r on r.id = sva.region_id
order by instability_index desc;
