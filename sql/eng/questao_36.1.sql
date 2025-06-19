-- 36.1.  For each year that is a multiple of 5 (e.g. 1970, 1975, 1980, etc.) and for each region, identify the country with the highest number of attacks in that year.
select
    year,
    country,
    region,
    attacks
from (
    select
        iyear as year,
        country_id,
        region_id,
        count(*) as attacks,
        row_number() over (
            partition by region_id
            order by count(*) desc
        ) as ranking
    from terrorism_act t
    where iyear % 5 = 0
    group by iyear, country_id, region_id
) as ra
join country c on c.id = ra.country_id
join region r on r.id = ra.region_id
where ranking = 1;