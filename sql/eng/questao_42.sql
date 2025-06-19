-- 42. Liste os cinco pares de país com maior número de ataques usando armas químicas, biológicas ou radiológicas. Inclua o ano, a quantidade e o tipo de arma mais comum nesse par.
with tab_armas_ataques_paises as (
    select
        *,
        case
            when
                ataq_armas_biologicas > ataq_armas_quimicas
                and ataq_armas_biologicas > ataq_armas_radiologicas
            then 1
            when
                ataq_armas_quimicas > ataq_armas_biologicas 
                and ataq_armas_quimicas > ataq_armas_radiologicas
            then 2
            else 3
        end as id_arma_mais_comum
    from (
        select
            country_id,
            iyear as ano,
            sum(case when weapon_id in (1, 2, 3) then 1 else 0 end) as quant_ataques_total,
            sum(case when weapon_id = 1 then 1 else 0 end) as ataq_armas_biologicas,
            sum(case when weapon_id = 2 then 1 else 0 end) as ataq_armas_quimicas,
            sum(case when weapon_id = 3 then 1 else 0 end) as ataq_armas_radiologicas
        from terrorism_act
        group by country_id, iyear
    ) as sub
),
tab_ataques_mais_comuns as (
    select
        country_id,
        ano,
        country as pais,
        id_arma_mais_comum,
        case
            when id_arma_mais_comum = 1
            then ataq_armas_biologicas
            when id_arma_mais_comum = 2
            then ataq_armas_quimicas
            else ataq_armas_radiologicas
        end as quant_ataques_arma_mais_comum
    from tab_armas_ataques_paises aap
    join country c on c.id = aap.country_id
)
select
    amc.ano,
    amc.pais as primeiro_pais,
    amco.pais as segundo_pais,
    weapon as arma_mais_comum,
    amc.quant_ataques_arma_mais_comum + amco.quant_ataques_arma_mais_comum as quant_ataques_arma_mais_comum
from tab_ataques_mais_comuns amc
join tab_ataques_mais_comuns amco on amc.ano = amco.ano
join weapon w on w.id = amc.id_arma_mais_comum
where amc.pais > amco.pais
and amc.quant_ataques_arma_mais_comum > 0
and amco.quant_ataques_arma_mais_comum > 0
order by quant_ataques_arma_mais_comum desc
limit 5;
