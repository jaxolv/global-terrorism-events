-- 4.	Liste os tipos de ataque (attack) únicos registrados na base.
select a.id, a.attack as tipo_de_ataque
from terrorism_act ta
join attack a on a.id = ta.event_id
order by a.id;