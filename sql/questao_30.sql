-- 30.	Crie uma consulta que classifique os países por um "índice de periculosidade", definido como:
-- soma total de ataques / (variedade de armas utilizadas * variedade de tipos de ataque)
with quantidade_ataques_pais as (
	select
		c.country,
		t.country_id,
		count(*) as quantidade_ataques
	from terrorism_act t
	join country c on c.id = t.country_id
	group by country, country_id
),
tipos_armas_pais as (
	select
		country,
		weapon,
		count(*) as quantidade_ataques
	from terrorism_act t
	join quantidade_ataques_pais q on t.country_id = q.country_id
	join weapon w on w.id = t.weapon_id
	where weapon is not null
	group by country, weapon
),
variedade_armas_pais as (
	select
		country,
		count(*) as tipos_armas_usados
	from tipos_armas_pais
	group by country
),
tipos_ataques_pais as (
	select
		country,
		attack,
		count(*) as quantidade_ataques
	from terrorism_act t
	join quantidade_ataques_pais q on q.country_id = t.country_id
	join attack a on a.id = t.attack_id
	where attack is not null
	group by country, attack
),
variedades_ataques_pais as (
	select
		country,
		count(*) as tipos_ataques_usados
	from tipos_ataques_pais
	group by country
)
select
	vat.country,
	qat.quantidade_ataques,
	vat.tipos_ataques_usados as tipos_ataques,
	var.tipos_armas_usados as tipos_armas,
	round(qat.quantidade_ataques::numeric / nullif((tipos_ataques_usados * tipos_armas_usados), 0), 2) as indice_periculosidade
from variedades_ataques_pais vat
join variedade_armas_pais var on vat.country = var.country
join quantidade_ataques_pais qat on qat.country = vat.country
order by indice_periculosidade desc;