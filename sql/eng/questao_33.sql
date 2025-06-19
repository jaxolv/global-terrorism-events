-- 33.  For each weapon type, show the average number of successful attacks per region.
select
    weapon,
    sum(total_attacks) as attacks_successfull,
    count(*) as amount_regions,
    round(sum(total_attacks)::numeric/count(*), 2) as avg_attacks_successfull
from (
    select
        weapon_id,
        weapon,
        region_id,
        region,
        count(*) as total_attacks
    from terrorism_act t
    join weapon w on w.id = t.weapon_id
    join region r on r.id = t.region_id
    where weapon_id is not null
    and success = true
    group by region_id, region, weapon_id, weapon
)
group by weapon
order by weapon;
