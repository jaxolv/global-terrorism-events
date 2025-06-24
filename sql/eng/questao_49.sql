-- 49.  Para cada tipo de alvo, calcule a eficácia dos atentados definida como:
--  (número de ataques bem-sucedidos) / (número total de ataques ao alvo)
--  Liste os alvos com eficácia acima de 75%, ordenados do mais eficaz ao menos.

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
