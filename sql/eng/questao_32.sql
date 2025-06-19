--32.   List the 10 countries with the highest proportion of attacks against private properties relative to the total number of attacks in those countries. Include the percentage and order from highest to lowest.
select
    country,
    total_attacks_properties,
    attacks_total,
    round((total_attacks_properties::numeric / attacks_total) * 100, 2) as percentage_attacks_properties
from (
    select
        country_id,
        count(*) as attacks_total,
        sum(case when target_id = 14 then 1 else 0 end) as total_attacks_properties
    from terrorism_act
    group by country_id
) as attacks_per_countries
join country c on c.id = attacks_per_countries.country_id
order by percentage_attacks_properties desc, total_attacks_properties desc, country
limit 10;
