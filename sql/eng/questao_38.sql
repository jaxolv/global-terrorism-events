-- 38.  Liste os cinco países com maior número de ataques em áreas sem identificação de cidade. Mostre a quantidade e o percentual em relação ao total do país.
select
    country as pais,
    soma_cidade_desconhecida,
    soma_ataques_no_pais,
    round((soma_cidade_desconhecida::numeric / soma_ataques_no_pais) * 100, 2) as percentual
from (
    select
        country_id,
        count(*) soma_ataques_no_pais,
        sum(case when city is null or city in ('Unknown', '') then 1 else 0 end) as soma_cidade_desconhecida
    from terrorism_act
    group by country_id
) as acd
join country c on c.id = acd.country_id
order by percentual desc
limit 5;