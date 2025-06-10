-- 18. Liste os países que sofreram ataques com mais de um tipo diferente de arma.
select *
from (
	select
		c.id,
		c.country,
		count (distinct t.weapon_id) as tipos_armas
	from terrorism_act t
	join country c on c.id = t.country_id
	group by c.id, c.country
)
where tipos_armas > 1
order by country;
