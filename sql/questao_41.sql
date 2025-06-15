-- 41.  Para cada região, calcule um “índice de instabilidade” definido como:
-- (número total de tipos diferentes de ataques por país) x (percentual fracionário médio de ataques bem-sucedidos na região)
-- Liste as regiões com seus índices, ordenadas do maior para o menor.

with tab_somatorio_variedade_ataques_regiao as (
    select
        region_id,
        sum(quant_ataques_tipo_pais) as somatorio_variedades_ataques_paises,
        avg(percentual_ataques_bem_sucedidos) as media_ataques_bem_sucedidos_regiao
    from (
        select
            country_id,
            region_id,
            count(distinct attack_id) as quant_ataques_tipo_pais,
            sum(case when success then 1 else 0 end)::numeric / count(*) as percentual_ataques_bem_sucedidos
        from terrorism_act
        where attack_id is not null
        group by country_id, region_id
    ) as sub_paises_tipos_ataques
    group by region_id
)
select
    region as regiao,
    round(
        media_ataques_bem_sucedidos_regiao * somatorio_variedades_ataques_paises, 2
    ) as indice_de_instabilidade
from tab_somatorio_variedade_ataques_regiao sva
join region r on r.id = sva.region_id
order by indice_de_instabilidade desc;
