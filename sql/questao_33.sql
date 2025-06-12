-- 33.  Para cada tipo de arma, mostre o número médio de ataques bem-sucedidos por região.
with sucesso_ataques_arma_regiao as (
    select
        weapon_id,
        weapon,
        region_id,
        region,
        count(*) as total_ataques
    from terrorism_act t
    join weapon w on w.id = t.weapon_id
    join region r on r.id = t.region_id
    where weapon_id is not null
    and success = true
    group by region_id, region, weapon_id, weapon
)
select
    weapon,
    sum(total_ataques) as total_ataques_sucesso,
    count(*) as quantidade_regioes,
    round(sum(total_ataques)::numeric/count(*), 2) as media_ataques_bem_sucedidos
from sucesso_ataques_arma_regiao
group by weapon
order by weapon;
