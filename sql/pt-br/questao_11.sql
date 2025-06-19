-- 11.	Liste os 10 países com maior número de ataques, em ordem decrescente.
select
	c.country,
	count(*) as "quantidade de ataques"
from terrorism_act t
join country c on c.id = t.country_id
group by c.country
order by count(*) desc
limit 10;