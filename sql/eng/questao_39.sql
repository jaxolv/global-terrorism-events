-- 39. For each target type, show the country with the highest number of attacks. Include the total number of attacks and sort the results by target type in alphabetical order.
with cte_attacks_target_country as (
    select
        target_id,
        country_id,
        sum(case when target_id is not null then 1 else 0 end) as attacks_target_country
    from terrorism_act
    group by target_id, country_id
),
cte_attacks_target as (
    select
        target_id,
        sum(case when target_id is not null then 1 else 0 end) as attacks_on_target
    from terrorism_act
    group by target_id
),
cte_ranking_attacks as (
    select
        target_id,
        country_id,
        attacks_target_country,
        row_number() over(
            partition by target_id
            order by attacks_target_country desc
        ) as ranking
    from cte_attacks_target_country aap
)
select
    raa.target_id,
    target,
    country,
    attacks_target_country,
    attacks_on_target
from cte_ranking_attacks raa
join country c on c.id = raa.country_id
join target t on t.id = raa.target_id
join cte_attacks_target qaa on qaa.target_id = raa.target_id
where ranking = 1
order by target;
