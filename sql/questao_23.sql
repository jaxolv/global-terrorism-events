-- 23.	Para cada país, mostre o tipo de ataque mais comum.
select
	country as pais,
	attack as ataque_mais_comum,
	quantidade_ataques
from (
	select
		c.country,
		a.attack,
		count(*) as quantidade_ataques,
		row_number() over (
			partition by c.id
			order by count(*) desc
	) as rank
	from terrorism_act t
	join attack a on a.id = t.attack_id
	join country c on c.id = t.country_id
	group by c.id, c.country, a.id, a.attack
	) A
where rank = 1
order by quantidade_ataques desc;