-- 22.	Encontre o país que teve o maior número de ataques com o tipo “Hostage Taking (Kidnapping)”.
select
	country as pais,
	count(*) as quantidade_sequestros
from terrorism_act t
join country c on c.id = t.country_id
where attack_id = 6
group by country
order by count(*) desc
fetch first row only;