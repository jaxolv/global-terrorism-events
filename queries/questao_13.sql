-- 13.	Liste os 5 tipos de armas mais utilizadas em ataques.
alter table terrorism_act drop column motive;

select
	w.weapon as armas,
	count(*) as "quantidade de ataques"
from terrorism_act t
join weapon w on w.id = t.weapon_id
group by w.weapon
order by count(*) desc
limit 5;