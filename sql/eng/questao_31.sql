-- 31.1.  Show how many countries have a percentage of successful attacks above the overall table average and the percentage difference for each.
with cte_rate_successfull_attacks as (
    select
        sub.country_id,
        sub.amount_of_attacks as successfull_attacks,
        count(*) as total_attacks_country,
        round((sub.amount_of_attacks::numeric / count(*)) * 100, 2) as success_percentage
    from (
        select
            country_id,
            count(*) as amount_of_attacks
        from terrorism_act t
        where success = true
        group by country_id
    ) as sub
    join terrorism_act t on sub.country_id = t.country_id 
    group by sub.country_id, sub.amount_of_attacks
),
cte_global_average_successfull_attacks as (
    select
        round((sum(case when success then 1 else 0 end)::numeric / count(*)) * 100, 2)
            as perc_avg_successfull
    from terrorism_act
)
select 
    country,
    (tas.success_percentage - m.perc_avg_successfull) as perc_higher_avg
from cte_rate_successfull_attacks tas
join country c on tas.country_id = c.id
cross join cte_global_average_successfull_attacks m
where tas.success_percentage > m.perc_avg_successfull
order by success_percentage desc;
