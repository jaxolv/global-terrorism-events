-- 16.	Liste os 5 anos com mais ataques utilizando o tipo de ataque “Bombing/Explosion”.
select
	iyear as ano,
	count(*) as "quantidade de ataques"
from terrorism_act
where attack_id = 3
group by iyear
order by count(*) desc
limit 5;