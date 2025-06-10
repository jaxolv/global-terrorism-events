-- 21.	Liste os países com aumento de número de ataques do ano 2000 para 2001.
select
	c.country as pais,
	A.ataques as ataques_em_2000,
	B.ataques as ataques_em_2001,
	round(((B.ataques/A.ataques)*100)::numeric, 2) || '%' as aumento_perc
from (
	select
		country_id,
		round(count(*)::numeric) as ataques
	from terrorism_act
	where iyear = 2000
	group by country_id
	) A join (
	select
		country_id,
		round(count(*)::numeric) as ataques
	from terrorism_act
	where iyear = 2001
	group by country_id
	) B on B.country_id = A.country_id
join country c on c.id = A.country_id
where B.ataques > A.ataques
order by B.ataques - A.ataques desc;