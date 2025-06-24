-- 48. Identifique ataques coordenados, ou seja, eventos no mesmo país, no mesmo dia, com o mesmo tipo de ataque. Liste os países com mais ocorrências desse tipo, o número de vezes que isso aconteceu, e os anos mais comuns desses ataques.

with cte_list_countries_groups as (
    select
        country_id,
        iday as dd,
        imonth as mm,
        iyear,
        attack_id,
        count(*) as attacks
    from terrorism_act
    where attack_id is not null
    group by iday, imonth, iyear, country_id, attack_id
    having count(*) > 1
),
cte_list_countries_years as (
    select
        country_id,
        iyear,
        count(*) as attacks,
        row_number() over(
            partition by country_id
            order by count(*) desc
        ) as ranking
    from cte_list_countries_groups
    group by country_id, iyear
    order by country_id
)
select
    country,
    iyear as year,
    attacks
from cte_list_countries_years lcy
join country c on c.id = lcy.country_id
where ranking = 1
order by attacks desc