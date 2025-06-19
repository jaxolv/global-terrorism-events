-- 14.	Para cada continente (região), exiba a quantidade total de ataques.
select
	r.region "região",
	count(*) "quantidade de ataques"
from terrorism_act t
join region r on r.id = t.region_id
group by region
order by count(*) desc;