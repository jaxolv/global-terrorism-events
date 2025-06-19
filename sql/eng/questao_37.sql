-- 37. Calculate the percentage of successful attacks for each attack type. Order from highest to lowest and show only those with at least 100 records.
select
    attack,
    attacks_succesfull,
    all_attacks,
    round((attacks_succesfull::numeric / all_attacks) * 100, 2) as perc
from (
    select
        attack_id,
        sum(case when success = true then 1 else 0 end) as attacks_succesfull,
        count(*) as all_attacks
    from terrorism_act
    where attack_id is not null
    group by attack_id
) as sub
join attack a on a.id = sub.attack_id
where all_attacks >= 100
order by perc desc;
