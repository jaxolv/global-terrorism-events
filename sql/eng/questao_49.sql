-- 49. For each target type, calculate the attack effectiveness defined as:
-- (number of successful attacks) / (total number of attacks on that target)
-- List the targets with effectiveness above 75%, ordered from most to least effective.

with cte_success_rate as (
    select
        target_id,
        round((attacks_success::numeric / attacks) * 100, 2) as rate_success
    from (
        select
            target_id,
            count(*) as attacks,
            sum(case
                    when success then 1 else 0
                end) as attacks_success
        from terrorism_act
        where target_id is not null
        and success is not null
        group by target_id
    ) as sub
)
select
    target,
    rate_success
from cte_success_rate sr
join target t on t.id = sr.target_id
where rate_success > 75
order by rate_success desc
