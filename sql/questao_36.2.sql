-- 36.  Para cada região, informe o país com maior quantidade de ataques em anos múltiplos de 5 (ex: 1970, 1975, etc.)
-- 2.   Considerando apenas os anos múltiplos de 5 (ex: 1970, 1975, 1980, etc.), identifique para cada região o país que acumulou o maior número total de ataques ao longo desses anos.
with acumulado_ataques_ppais as (
    select
        country_id,
        region_id,
        count(*) as somatorio_ataques
    from terrorism_act
    where iyear % 5 = 0
    group by country_id, region_id
), ranking_pais_regiao as (
    select
        country_id,
        region_id,
        somatorio_ataques,
        row_number() over (
            partition by region_id
            order by somatorio_ataques desc
        ) as ranking
    from acumulado_ataques_ppais
    group by country_id, region_id, somatorio_ataques
)
select
    region as regiao,
    country as pais,
    somatorio_ataques
from ranking_pais_regiao ra
join country c on c.id = ra.country_id
join region r on r.id = ra.region_id
where ranking = 1;
