-- 31.2. Agora mostre os países que estão abaixo da taxa de INSUCESSO de atentados.
with ataques_insucesso as (
    select
        c.country,
        country_id,
        count(*) as quantidade_ataques
    from terrorism_act t
    join country c on c.id = t.country_id
    where success = false
    group by country_id, country
),
taxa_ataques_mal_sucedidos as (
    select
        a.country_id,
        a.quantidade_ataques as ataques_sem_sucesso,
        count(*) as quantidade_total_ataques_no_pais,
        round((a.quantidade_ataques::numeric / count(*)) * 100, 2) as percentual_insucesso
    from ataques_insucesso a
    join terrorism_act t on a.country_id = t.country_id 
    group by a.country_id, a.quantidade_ataques
),
media_global_ataques_insucesso as (
    select
        round(sum(case when success = false then 1 else 0 end)::numeric / count(*), 2) * 100
            as media_perc_insucesso
    from terrorism_act
)
select
    ai.country,
    tam.percentual_insucesso
from taxa_ataques_mal_sucedidos tam
join ataques_insucesso ai on ai.country_id = tam.country_id
cross join media_global_ataques_insucesso m
where tam.percentual_insucesso < m.media_perc_insucesso
order by tam.percentual_insucesso desc;
