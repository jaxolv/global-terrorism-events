-- 40.  Liste os três anos com o maior crescimento percentual de ataques em relação ao ano anterior. Ignore os anos com menos de 100 ataques.

with tab_ataques_por_ano as (
    select
        iyear as ano,
        count(*) as ataques_por_ano
    from terrorism_act
    group by iyear
),
tab_ataques_ano_seguinte as (
    select
        a1.ano,
        a1.ataques_por_ano,
        a2.ano as ano_seguinte,
        a2.ataques_por_ano as ataques_ano_seguinte
    from tab_ataques_por_ano a1
    join tab_ataques_por_ano a2 on a1.ano = a2.ano - 1
    where a1.ataques_por_ano >= 100
),
tab_crescimento_percentual as (    
    select
        concat(ano, ' - ', ano_seguinte) as intervalo_anos,
        ataques_por_ano as ataques_no_primeiro_ano,
        ataques_ano_seguinte,
        round(((ataques_ano_seguinte::numeric / ataques_por_ano) * 100) - 100, 2) as percentual
    from tab_ataques_ano_seguinte
)
select
    *
from tab_crescimento_percentual
where percentual > 0
order by percentual desc
limit 3;