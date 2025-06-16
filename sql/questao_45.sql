-- 45. Para cada década, mostre o país mais letal (com maior número total de mortes atribuídas a ataques) e o tipo de ataque mais utilizado por esse país na década.
with tab_pais_decada_mortes as (
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
tab_ranking_pais_decadas as (
    select
        *,
        row_number() over(
            partition by decada
            order by mortes_por_decada_pais desc
        ) as ranking
    from tab_pais_decada_mortes
)
select
    country as pais,
    decada,
    mortes_por_decada_pais
from tab_ranking_pais_decadas rpd
join country c on c.id = rpd.country_id
where ranking = 1
order by decada asc, mortes_por_decada_pais desc;
