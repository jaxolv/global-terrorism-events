-- 46. For each country that had attacks in 3 or more consecutive years, identify the countries where the number of attacks increased year over year during those periods. List the country, the years when this occurred, and the number of attacks per year.

with cte_group_country as (
    select
        country_id,
        yr,
        yr - (1969 + rn) as gp,
        attacks
    from (
        select
            country_id,
            iyear as yr,
            count(*) as attacks,
            row_number() over(
                partition by country_id
                order by iyear
            ) as rn
        from terrorism_act
        group by country_id, iyear
    ) as sub
),
cte_condition_group as (
    select
        country_id,
        gp,
        count(*) consecutive_yrs
    from cte_group_country
    group by country_id, gp
    having count(*) >= 3
),
cte_all_groups_related as (
    select
        country_id,
        gp,
        yr,
        attacks,
        attacks_last_yr,
        (case when attacks > attacks_last_yr then 1 else 0 end) as it_grows
    from (
        select 
            gc.country_id,
            gc.yr,
            gc.gp,
            gc.attacks,
            lag(attacks, 1, 0) over(
                partition by gc.country_id
                order by gc.yr
            ) as attacks_last_yr
        from cte_group_country gc
        join cte_condition_group cg
            on gc.country_id = cg.country_id
            and gc.gp = cg.gp
    ) as sub
    group by country_id, gp, yr, attacks, attacks_last_yr
),
cte_consecutive_growths as (
    select
        agr.country_id,
        agr.gp,
        cg.consecutive_yrs,
        sum(it_grows) as consecutive_growths
    from cte_all_groups_related agr
    join cte_condition_group cg
        on cg.country_id = agr.country_id
        and cg.gp = agr.gp
    group by agr.country_id, agr.gp, cg.consecutive_yrs
)
select
    c.country,
    agr.yr as years,
    agr.attacks
from cte_all_groups_related agr
join country c
    on c.id = agr.country_id
join cte_consecutive_growths cg
    on cg.country_id = agr.country_id
    and cg.gp = agr.gp
where consecutive_growths = consecutive_yrs
order by country, years