-- 42. List the five country pairs with the highest number of attacks using chemical, biological, or radiological weapons. Include the year for each pair, the number of attacks, and the most common weapon type used by both.
with cte_attacks_weapon_countries as (
    select
        *,
        case
            when
                attacks_biological_weapons > attacks_chemical_weapons
                and attacks_biological_weapons > attacks_radiological_weapons
            then 1
            when
                attacks_chemical_weapons > attacks_biological_weapons 
                and attacks_chemical_weapons > attacks_radiological_weapons
            then 2
            else 3
        end as weapon_id
    from (
        select
            country_id,
            iyear as year,
            sum(case when weapon_id in (1, 2, 3) then 1 else 0 end) as attacks,
            sum(case when weapon_id = 1 then 1 else 0 end) as attacks_biological_weapons,
            sum(case when weapon_id = 2 then 1 else 0 end) as attacks_chemical_weapons,
            sum(case when weapon_id = 3 then 1 else 0 end) as attacks_radiological_weapons
        from terrorism_act
        group by country_id, iyear
    ) as sub
),
cte_most_common_attacks as (
    select
        country_id,
        year,
        country,
        weapon_id,
        case
            when weapon_id = 1
            then attacks_biological_weapons
            when weapon_id = 2
            then attacks_chemical_weapons
            else attacks_radiological_weapons
        end as attacks_most_common_weapon
    from cte_attacks_weapon_countries aap
    join country c on c.id = aap.country_id
)
select
    amc.year,
    amc.country as first_country,
    amco.country as second_country,
    weapon,
    amc.attacks_most_common_weapon + amco.attacks_most_common_weapon as attacks_most_common_weapon
from cte_most_common_attacks amc
join cte_most_common_attacks amco on amc.year = amco.year
join weapon w on w.id = amc.weapon_id
where amc.country > amco.country
and amc.attacks_most_common_weapon > 0
and amco.attacks_most_common_weapon > 0
order by attacks_most_common_weapon desc
limit 5;
