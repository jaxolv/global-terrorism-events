-- 31.1.  Mostrar quantos países tem o percentual de atentados bem sucedidos que estão acima da média total da tabela e a diferença percentual de cada.
with taxa_ataques_sucesso as (
    select
        a.country_id,
        a.quantidade_ataques as ataques_com_sucesso,
        count(*) as quantidade_total_ataques_no_pais,
        round((a.quantidade_ataques::numeric / count(*)) * 100, 2) as percentual_sucesso
    from (
        select
            country_id,
            count(*) as quantidade_ataques
        from terrorism_act t
        where success = true
        group by country_id
    ) a
    join terrorism_act t on a.country_id = t.country_id 
    group by a.country_id, a.quantidade_ataques
),
media_global_ataques_sucesso as (
    select
        round((sum(case when success then 1 else 0 end)::numeric / count(*)) * 100, 2)
            as media_perc_sucesso
    from terrorism_act
)
select 
    country as pais,
    (tas.percentual_sucesso - m.media_perc_sucesso) as percentual_maior_da_media
from taxa_ataques_sucesso tas
join country c on tas.country_id = c.id
cross join media_global_ataques_sucesso m
where tas.percentual_sucesso > m.media_perc_sucesso
order by percentual_sucesso desc;
