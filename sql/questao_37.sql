-- 37. Calcule o percentual de ataques bem-sucedidos para cada tipo de ataque. Ordene do maior para o menor e mostre apenas aqueles com pelo menos 100 registros.
with tipos_ataques_quantidades as (
    select
        attack_id,
        sum(case when success = true then 1 else 0 end) as atentados_bem_sucedidos,
        count(*) as todos_atentados
    from terrorism_act
    where attack_id is not null
    group by attack_id
)
select
    attack as tipo_atentado,
    atentados_bem_sucedidos,
    todos_atentados,
    round((atentados_bem_sucedidos::numeric / todos_atentados) * 100, 2) as percentual
from tipos_ataques_quantidades taq
join attack a on a.id = taq.attack_id
where todos_atentados >= 100
order by percentual desc;
