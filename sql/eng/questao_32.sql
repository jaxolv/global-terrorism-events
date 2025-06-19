--32.   Liste os 10 países com maior proporção de ataques contra propriedades privadas em relação ao total de ataques nesses países. Inclua o percentual e ordene do maior para o menor.
select
    country as pais,
    total_ataques_propriedades,
    total_ataques,
    round((total_ataques_propriedades::numeric / total_ataques) * 100, 2) as percentual_ataques_propriedades
from (
    select
        country_id,
        count(*) as total_ataques,
        sum(case when target_id = 14 then 1 else 0 end) as total_ataques_propriedades
    from terrorism_act
    group by country_id
) as ataques_por_pais
join country c on c.id = ataques_por_pais.country_id
order by percentual_ataques_propriedades desc, total_ataques_propriedades desc, country
limit 10;
