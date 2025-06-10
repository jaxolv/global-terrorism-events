-- 24.	Liste os 3 países com maior diversidade de tipos de armas utilizadas.
select
	c.country,
	count(distinct t.weapon_id) as quantidade_de_armas_diferentes
from terrorism_act t
join country c on c.id = t.country_id
group by country
order by quantidade_de_armas_diferentes desc
limit 3;