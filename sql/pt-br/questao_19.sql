-- 19.	Para cada tipo de alvo, mostre a soma de ataques registrados com armas incendiárias.
select
	tg.target,
	count(*) quantidade_ataques
from terrorism_act ta
join target tg on tg.id = ta.target_id
where weapon_id = 8
group by target
order by quantidade_ataques desc;