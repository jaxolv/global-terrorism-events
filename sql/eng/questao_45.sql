-- 45. For each decade, show the most lethal country (with the highest total number of deaths attributed to attacks) and the most commonly used attack type by that country in the decade.
with cte_country_decade_kills as (
    select
        country_id,
        decade,
        sum(case when kills > 0 then kills else 0 end) as kills_per_decade_country
    from (
        select
            country_id,
            (iyear / 10) * 10 as decade,
            sum(nkill) as kills
        from terrorism_act
        where nkill is not null
        group by country_id, decade
    ) as sub
    group by decade, country_id
),
cte_country_decade as (
    select
        country_id,
        decade,
        kills_per_decade_country,
        row_number() over(
            partition by decade
            order by kills_per_decade_country desc
        ) as ranking_kills
    from cte_country_decade_kills
    order by decade asc, kills_per_decade_country desc
),
cte_ataques_pais_decada as (
    select
        pd.country_id,
        pd.decade,
        attack_id,
        count(t.attack_id) as quant_ataques_tipo,
        ranking_kills
    from cte_country_decade pd
    join terrorism_act t on pd.country_id = t.country_id
    where pd.decade = (iyear / 10) * 10
    and attack_id is not null
    group by pd.country_id, decade, attack_id, ranking_kills
),
cte_ranking_countries_attacks_decade as (
    select
        *,
        row_number() over(
            partition by decade, country_id
            order by quant_ataques_tipo desc
        ) as ranking_ataques
    from cte_ataques_pais_decada
)
select
    c.country as pais,
    a.attack as tipo_ataques_mais_usado,
    decade,
    quant_ataques_tipo
from cte_ranking_countries_attacks_decade rap
join country c on c.id = rap.country_id
join attack a on a.id = rap.attack_id
where ranking_kills = 1
and ranking_ataques = 1
order by decade asc