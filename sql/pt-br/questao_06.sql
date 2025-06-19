-- 6.	Conte quantos ataques utilizaram armas do tipo "Explosives".
select count(*) as "quantidade de ataques que usaram explosivos"
from terrorism_act t
join weapon w on w.id = t.weapon_id
where w.id = 6;