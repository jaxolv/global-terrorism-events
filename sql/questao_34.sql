-- 34.  Para cada ano, calcule a proporção de atentados com alvo diplomático e arma explosiva em relação ao total de atentados naquele ano. Liste os 5 anos com maior proporção e mostre o percentual.
with ataques_diplomatico_explosivos_ano as (
    select
        iyear ano,
        count(*) as total_dataques
    from terrorism_act
    where target_id = 7
    and weapon_id = 6
    group by iyear
),
ataques_total_ano as (
select
    iyear as ano,
    count(*) as total_dataques
from terrorism_act
group by iyear
)
select
    ata.ano,
    dea.total_dataques as ataques_diplomaticos_explosivos,
    ata.total_dataques as total_de_ataques,
    round((dea.total_dataques::numeric / ata.total_dataques) * 100, 2) as percentual
from ataques_total_ano ata
join ataques_diplomatico_explosivos_ano dea on dea.ano = ata.ano
order by percentual desc
limit 5;
