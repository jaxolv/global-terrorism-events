-- 34.  Para cada ano, calcule a proporção de atentados com alvo diplomático e arma explosiva em relação ao total de atentados naquele ano. Liste os 5 anos com maior proporção e mostre o percentual.
select
    ano,
    total_de_ataques_diplom_expl as ataques_diplomaticos_explosivos,
    total_de_ataques,
    round((total_de_ataques_diplom_expl::numeric / total_de_ataques) * 100, 2) as percentual
from (
    select
        iyear as ano,
        count(*) as total_de_ataques,
        sum(case when target_id = 7 and weapon_id = 6 then 1 else 0 end) as total_de_ataques_diplom_expl
    from terrorism_act
    group by iyear
    )
order by percentual desc
limit 5;
