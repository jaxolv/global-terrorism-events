-- 17.	Mostre a média de ataques por país ao longo de todos os anos.
select
	pais,
	round(avg(quantidade_ataques)::numeric,2) as media_ataques_ano
from (
	select
		c.country pais,
		iyear ano,
		count(*) as quantidade_ataques
	from terrorism_act t
	join country c on c.id = t.country_id
	group by c.country, iyear
	order by pais
) A
group by pais
order by media_ataques_ano desc;