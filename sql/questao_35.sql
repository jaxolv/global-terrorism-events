-- 35.  Encontre os países onde mais de 50% dos ataques utilizam o mesmo tipo de ataque (ex: Bombing/Explosion). Mostre o país, o tipo de ataque e a proporção.
with quantidade_dataques_ptipo as (
    select
        t.country_id,
        c.country as pais,
        t.attack_id,
        a.attack as tipo_ataque,
        count(*) as quantidade_dataques
    from terrorism_act t
    join country c on c.id = t.country_id
    join attack a on a.id = t.attack_id
    group by t.country_id, c.country, t.attack_id, a.attack
),
quantidade_dataques_total as (
    select
        country_id,
        count(*) as quantidade_dataques
    from terrorism_act
    group by country_id
),
percentual_de_ataques as (
    select
        pais,
        tipo_ataque,
        round((tip.quantidade_dataques::numeric / tot.quantidade_dataques) * 100, 2) as percentual_no_pais
    from quantidade_dataques_total tot
    join quantidade_dataques_ptipo tip on tip.country_id = tot.country_id
)
select
    *
from percentual_de_ataques
where percentual_no_pais > 50.00
order by pais;