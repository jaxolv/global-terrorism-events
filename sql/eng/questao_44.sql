-- 44. Liste os cinco países com a maior média de tipos diferentes de ataque por ano (variedade anual).
with tab_pais_por_media as (
    select 
        country_id,
        round(avg(tipos_ataques_por_ano), 2) as media_variedade_ataques_por_pais
    from (
        select
            country_id,
            iyear,
            count(distinct attack_id) as tipos_ataques_por_ano
        from terrorism_act
        where attack_id is not null
        group by country_id, iyear
    ) as sub
    group by country_id
)
select
    country,
    media_variedade_ataques_por_pais
from tab_pais_por_media m
join country c on c.id = m.country_id
order by media_variedade_ataques_por_pais desc
limit 5;
