-- 26.	Liste todos os países onde foram registrados ataques com armas biológicas, químicas ou radiológicas.
select
	c.country,
	w.weapon,
	count(*) as quantidade_de_ataques
from terrorism_act t
join country c on c.id = t.country_id
join weapon w on w.id = t.weapon_id
where weapon_id in (1, 2, 3)
group by country, weapon
order by country;