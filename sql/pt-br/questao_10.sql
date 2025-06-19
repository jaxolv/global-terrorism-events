-- 10.	Liste os países com ataques registrados no mês de dezembro.
select
	t.event_id as id,
	concat(t.iday, '/12/', t.iyear) as date,
	concat(t.city, ', ', t.provstate, ' (', c.country, ')') as location,
	case when success = true then 'succeed' else 'not succeed' end as "it succeeded?",
	gname,
	nkill as people_killed
from terrorism_act t
join country c on c.id = t.country_id
where imonth = 12;