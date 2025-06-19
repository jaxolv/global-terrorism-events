-- 35.  Find the countries where more than 50% of attacks use the same attack type (e.g., `Bombing/Explosion`). Show the country, the attack type, and the proportion.
with attacks_per_type as (
    select
        t.country_id,
        c.country,
        t.attack_id,
        a.attack as attack_type,
        count(*) as attacks
    from terrorism_act t
    join country c on c.id = t.country_id
    join attack a on a.id = t.attack_id
    group by t.country_id, c.country, t.attack_id, a.attack
),
total_attacks as (
    select
        country_id,
        count(*) as attacks
    from terrorism_act
    group by country_id
),
attack_percentage as (
    select
        country,
        attack_type,
        round((tip.attacks::numeric / tot.attacks) * 100, 2) as perc_in_country
    from total_attacks tot
    join attacks_per_type tip on tip.country_id = tot.country_id
)
select
    *
from attack_percentage
where perc_in_country > 50.00
order by country;