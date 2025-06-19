-- 45. Para cada década, mostre o país mais letal (com maior número total de mortes atribuídas a ataques) e o tipo de ataque mais utilizado por esse país na década.
with cte_pais_decada_mortes as (
    select
        country_id,
        decada,
        sum(case when mortes > 0 then mortes else 0 end) as mortes_por_decada_pais
    from (
        select
            country_id,
            (iyear / 10) * 10 as decada,
            sum(nkill) as mortes
        from terrorism_act
        where nkill is not null
        group by country_id, decada
    )
    group by decada, country_id
),
cte_pais_decada as (
    select
        country_id,
        decada,
        mortes_por_decada_pais,
        row_number() over(
            partition by decada
            order by mortes_por_decada_pais desc
        ) as ranking_mortes
    from cte_pais_decada_mortes
    order by decada asc, mortes_por_decada_pais desc
),
cte_ataques_pais_decada as (
    select
        pd.country_id,
        pd.decada,
        attack_id,
        count(t.attack_id) as quant_ataques_tipo,
        ranking_mortes
    from cte_pais_decada pd
    join terrorism_act t on pd.country_id = t.country_id
    where pd.decada = (iyear / 10) * 10
    and attack_id is not null
    group by pd.country_id, decada, attack_id, ranking_mortes
),
cte_ranking_ataques_pais_decada as (
    select
        *,
        row_number() over(
            partition by decada, country_id
            order by quant_ataques_tipo desc
        ) as ranking_ataques
    from cte_ataques_pais_decada
)
select
    c.country as pais,
    a.attack as tipo_ataques_mais_usado,
    decada,
    quant_ataques_tipo
from cte_ranking_ataques_pais_decada rap
join country c on c.id = rap.country_id
join attack a on a.id = rap.attack_id
where ranking_mortes = 1
and ranking_ataques = 1
order by decada asc