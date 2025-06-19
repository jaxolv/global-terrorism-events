-- 20.	Liste os ataques que envolveram alvos diplomáticos e armas do tipo “Fake Weapons”.
select
	t.event_id,
	concat (
		lpad(iday::text, 2, '0'), '/',
		lpad(imonth::text, 2, '0'), '/',
		iyear
	) as date,
	concat (
		coalesce(t.city, 'Cidade desconhecida'), ', ',
		coalesce(t.provstate, 'Estado/província desconhecido(a)'),
		' (',c.country,')'
	) as location,
	t.success
from terrorism_act t
join country c on t.country_id = c.id
where t.target_id = 7 and t.weapon_id = 7;