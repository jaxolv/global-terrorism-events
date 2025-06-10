-- 31.  Mostrar quantos países tem o percentual de atentados bem sucedidos que estão acima da média total da tabela e a diferença percentual de cada.
with ataques_sucesso as (
    select
        c.country,
        country_id,
        success,
        count(*) as quantidade_ataques
    from terrorism_act t
    join country c on c.id = t.country_id
    where success = true
    group by success, country_id, country
),
taxa_ataques_sucesso as (
    select
        a.country_id,
        a.quantidade_ataques as ataques_com_sucesso,
        count(*) as quantidade_total_ataques_no_pais,
        round((a.quantidade_ataques::numeric / count(*)) * 100, 2) as percentual_sucesso
    from ataques_sucesso a
    join terrorism_act t on a.country_id = t.country_id 
    group by a.success, a.country_id, a.quantidade_ataques
)
select 
    country,
    percentual_sucesso
from taxa_ataques_sucesso tas
join country c on c.id = tas.country_id
order by percentual_sucesso;
-- A concluir...

