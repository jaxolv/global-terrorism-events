-- 25.	Encontre a região com a maior média de ataques por ano.
select
	A.region,
	round(avg(A.quantidade_de_ataques_por_regiao)::numeric, 2) as media_de_ataques_por_regiao
from (
	select
		t.iyear,
		t.region_id,
		r.region,
		count(*) as quantidade_de_ataques_por_regiao
	from terrorism_act t
	join region r on r.id = t.region_id
	group by iyear, region_id, region
) A
group by A.region
order by A.media_de_ataques_por_regiao desc
fetch first row only;