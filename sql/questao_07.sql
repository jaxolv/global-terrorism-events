-- 7.	Mostre os ataques realizados no continente "South America".
select
	t.event_id,
	concat(t.iday, '/', t.imonth, '/', t.iyear) as date,
	t.extended,
	r.region,
	t.city,
	t.success,
	t.gname
from terrorism_act t
join region r on r.id = t.region_id
where r.id = 3
order by date;