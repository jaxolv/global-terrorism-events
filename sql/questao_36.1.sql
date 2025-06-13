-- 36.  Para cada região, informe o país com maior quantidade de ataques em anos múltiplos de 5 (ex: 1970, 1975, etc.)
-- 1.   Para cada ano múltiplo de 5 (ex: 1970, 1975, 1980, etc.) e para cada região, identifique o país com maior número de atentados naquele ano.
with ranking_ataques_mult_5 as (
    select
        iyear as ano,
        country_id,
        region_id,
        count(*) as total_ataques,
        row_number() over (
            partition by region_id
            order by count(*) desc
        ) as ranking
    from terrorism_act t
    where iyear % 5 = 0
    group by iyear, country_id, region_id
)
select
    ano,
    country as pais,
    ra.country_id,
    region as regiao,
    total_ataques
from ranking_ataques_mult_5 ra
join country c on c.id = ra.country_id
join region r on r.id = ra.region_id
where ranking = 1;