-- 8.	Liste os ataques que foram feitos contra o alvo "Private Citizens & Property".
select
	ta.event_id,
	concat(ta.iday, '/', ta.imonth, '/', ta.iyear) as date,
	ta.extended,
	ta.city,
	ta.success,
	ta.gname,
	tg.target
from terrorism_act ta
join target tg on tg.id = ta.target_id
where ta.target_id = 14;