-- 39. Para cada tipo de alvo, mostre o país com maior número de ataques. Inclua o total de ataques e ordene os resultados pelo tipo de alvo em ordem alfabética.
with ataques_alvo_pais as (
    select
        target_id,
        country_id,
        sum(case when target_id is not null then 1 else 0 end) as todos_ataques_alvos_pais
    from terrorism_act
    group by target_id, country_id
),
quantidade_ataques_alvo as (
    select
        target_id,
        sum(case when target_id is not null then 1 else 0 end) as todos_ataques_ao_alvo
    from terrorism_act
    group by target_id
),
ranking_ataques_alvo as (
    select
        target_id,
        country_id,
        todos_ataques_alvos_pais,
        row_number() over(
            partition by target_id
            order by todos_ataques_alvos_pais desc
        ) as ranking
    from ataques_alvo_pais aap
)
select
    raa.target_id as id_alvo,
    target as alvo,
    country as pais,
    todos_ataques_alvos_pais,
    todos_ataques_ao_alvo
from ranking_ataques_alvo raa
join country c on c.id = raa.country_id
join target t on t.id = raa.target_id
join quantidade_ataques_alvo qaa on qaa.target_id = raa.target_id
where ranking = 1
order by target;
