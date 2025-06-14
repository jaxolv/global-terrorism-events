-- 41.  Para cada região, calcule um “índice de instabilidade” definido como:
-- (número total de tipos diferentes de ataques por país) x (percentual fracionário médio de ataques bem-sucedidos na região)
-- Liste as regiões com seus índices, ordenadas do maior para o menor.

with tab_somatorio_variedade_ataques_regiao as (
    select
        region_id,
        sum(quant_ataques_tipo_pais) as somatorio_variedades_ataques_paises
    from (
        select
            country_id,
            region_id,
            count(distinct attack_id) as quant_ataques_tipo_pais
        from terrorism_act
        where attack_id is not null
        group by country_id, region_id
    ) as sub_paises_tipos_ataques
    group by region_id
),
tab_media_percentuais_ataques_bem_sucedidos_regiao as (
    select
        region_id,
        avg(percentual_ataques_bem_sucedidos) as media_ataques_bem_sucedidos_regiao
    from (
        select
            country_id,
            region_id,
            sum(case when success then 1 else 0 end)::numeric / count(*) as percentual_ataques_bem_sucedidos
        from terrorism_act
        group by country_id, region_id
    ) as sub_percentuais_ataques_bem_sucedidos_pais
    group by region_id
)
select
    region as regiao,
    round(
        media_ataques_bem_sucedidos_regiao * somatorio_variedades_ataques_paises, 2
    ) as indice_de_instabilidade
from tab_media_percentuais_ataques_bem_sucedidos_regiao mpr
join tab_somatorio_variedade_ataques_regiao sva on mpr.region_id = sva.region_id
join region r on r.id = mpr.region_id
order by indice_de_instabilidade desc;
