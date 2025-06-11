--32.   Liste os 10 países com maior proporção de ataques contra propriedades privadas em relação ao total de ataques nesses países. Inclua o percentual e ordene do maior para o menor.

with total_ataques_por_pais as (
    select
        country_id,
        count(*) as total_ataques
    from terrorism_act
    group by country_id
),
ataques_propriedade_privada as (
    select
        t.country_id,
        count(*) as total_ataques_propriedades
    from terrorism_act t
    join total_ataques_por_pais app on app.country_id = t.country_id
    where t.target_id = 14
    group by t.country_id
)
select
    c.country,
    app.total_ataques_propriedades,
    tap.total_ataques,
    round((app.total_ataques_propriedades::numeric / tap.total_ataques) * 100, 2) as percentual_ataques_propriedades
from ataques_propriedade_privada app
join country c on c.id = app.country_id
join total_ataques_por_pais tap on tap.country_id = app.country_id
order by percentual_ataques_propriedades desc, total_ataques_propriedades desc, country
limit 10;
