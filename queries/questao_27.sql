-- 27.	Utilize uma CTE para listar os países com ataques em todos os anos entre 2005 e 2010.
with ataques_ano_paises as (
	select
		country,
		iyear
	from terrorism_act t
	join country c on c.id = t.country_id
	where iyear between 2005 and 2010
	group by country, iyear
)
select
	country
from ataques_ano_paises
group by country
having count(distinct iyear) = 6
order by country;