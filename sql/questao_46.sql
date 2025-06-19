-- 46. Para cada país que teve ataques em 3 anos consecutivos ou mais, identifique os países cuja quantidade de ataques cresceu ano a ano nesses períodos. Liste o país, os anos em que isso ocorreu, e o número de ataques em cada ano.
/*
[x] Listar países e anos que tiveram ataques
[x] Listar países com 3 ou mais anos de ataques consecutivos
[x] Identificar quais anos cresceram os ataques nesses países
[ ] Listar:
    [X] O país
    [ ] Os anos
    [ ] O número de ataques de cada ano
*/

with cte_agrupamento_por_ano as (
    select
        country_id,
        ano,
        ano - (rn + 1969) as id_grupo_sequencial,
        quantidade_ataques,
        lag(quantidade_ataques, 1, 0) over(
            partition by country_id
            order by ano
        ) as ataques_ano_anterior
    from (
        select
            country_id,
            iyear as ano,
            count(*) as quantidade_ataques,
            row_number() over(
                partition by country_id
                order by iyear
            ) as rn
        from terrorism_act
        group by iyear, country_id
        having count(*) > 0
    ) as sub
    group by country_id, ano, ano - (rn + 1969), quantidade_ataques
),
cte_sequencia_anos_aumento as (
    select
        country_id,
        id_grupo_sequencial,
        aumentou,
        count(*) as anos_aumento_sequencia
    from (
        select
            country_id,
            id_grupo_sequencial,
            quantidade_ataques,
            ataques_ano_anterior,
            quantidade_ataques > ataques_ano_anterior as aumentou
        from cte_agrupamento_por_ano
        group by country_id, id_grupo_sequencial, quantidade_ataques, ataques_ano_anterior
    ) as sub
    group by country_id, id_grupo_sequencial, aumentou
),
cte_anos_consecutivos as (
    select
        country_id,
        id_grupo_sequencial,
        count(*) as anos_consecutivos
    from cte_agrupamento_por_ano
    group by country_id, id_grupo_sequencial
    having count(*) >= 3
),
cte_anos_consecutivos_crescimento as (
    select
        saa.country_id,
        saa.id_grupo_sequencial,
        ac.anos_consecutivos,
        saa.anos_aumento_sequencia,
        ac.anos_consecutivos = saa.anos_aumento_sequencia as todos_anos_tiveram_aumento
    from cte_anos_consecutivos ac
    join cte_sequencia_anos_aumento saa on saa.country_id = ac.country_id
    where ac.anos_consecutivos = saa.anos_aumento_sequencia
    group by saa.country_id, saa.id_grupo_sequencial, ac.anos_consecutivos, saa.anos_aumento_sequencia
)
select
    country as pais,
    acc.id_grupo_sequencial,
    acc.anos_consecutivos
from cte_anos_consecutivos_crescimento acc
join country c on c.id = acc.country_id
join cte_agrupamento_por_ano apa on apa.country_id = acc.country_id
group by country, acc.id_grupo_sequencial, acc.anos_consecutivos

