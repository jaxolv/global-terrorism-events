-- 34.  For each year, calculate the proportion of attacks targeting diplomatic entities with explosive weapons relative to the total number of attacks that year. List the top 5 years with the highest proportion and show the percentage.
select
    year,
    attacks_diplom_expl as attacks_diplomatics_explosives,
    attacks,
    round((attacks_diplom_expl::numeric / attacks) * 100, 2) as perc
from (
    select
        iyear as year,
        count(*) as attacks,
        sum(case when target_id = 7 and weapon_id = 6 then 1 else 0 end) as attacks_diplom_expl
    from terrorism_act
    group by iyear
    )
order by perc desc
limit 5;
