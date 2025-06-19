-- 29.	Encontre o país com maior número de ataques contra alvos civis ("Private Citizens & Property") usando "Firearms".
select
	c.country as pais,
	count(*) as quantidade_de_ataques
from terrorism_act t
join country c on c.id = t.country_id
where t.weapon_id = 5
and t.target_id = 14
group by c.country
order by count(*) desc
limit 1;