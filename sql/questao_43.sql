-- 43. Mostre, para cada país, a diferença percentual entre o total de ataques e o total de ataques bem-sucedidos. Liste apenas os países com pelo menos 100 ataques.
select
    country as pais,
    round((count(*)::numeric / sum(case when success then 1 else 0 end) - 1) * 100, 2)
        as percentual_diferenca_ataques_bem_sucedidos
from terrorism_act t
join country c on c.id = t.country_id
group by country
having count(*) >= 100;
