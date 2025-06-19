-- 36.2.  Considering only years that are multiples of 5 (e.g. 1970, 1975, 1980, etc.), identify for each region the country that accumulated the highest total number of attacks over these years.
with cte_ranking_pais_regiao as (
    select
        country_id,
        region_id,
        sum_attacks,
        row_number() over (
            partition by region_id
            order by sum_attacks desc
        ) as ranking
    from (
        select
            country_id,
            region_id,
            count(*) as sum_attacks
        from terrorism_act
        where iyear % 5 = 0
        group by country_id, region_id
    ) as sub
    group by country_id, region_id, sum_attacks
)
select
    region,
    country,
    sum_attacks
from cte_ranking_pais_regiao ra
join country c on c.id = ra.country_id
join region r on r.id = ra.region_id
where ranking = 1;
