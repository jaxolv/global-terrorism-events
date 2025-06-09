-------------------------------------------------------------------------------
-- 1.	Liste todos os registros da tabela terrorism_act ocorridos no ano de 2010.
select * from terrorism_act
where iyear = 2010;

-- 2.	Liste o eventid, iyear, imonth e iday dos ataques que ocorreram no mês de janeiro.
select event_id id, iyear ano, imonth mes, iday dia
from terrorism_act
where imonth = 1;

-- 3.	Quantos ataques ocorreram no país com country_id = 217 (EUA)?
select count(*) "quantidade de ataques nos EUA"
from terrorism_act
where country_id = 217;

-- 4.	Liste os tipos de ataque (attack) únicos registrados na base.
select a.id, a.attack as tipo_de_ataque
from terrorism_act ta
join attack a on a.id = ta.event_id
order by a.id;

select count(*) from attack;

-- 5.	Liste o nome dos países onde houve pelo menos um ataque em 2015
select distinct c.country
from terrorism_act t
join country c on c.id = t.country_id
where t.iyear = 2015
order by c.country;

-- 6.	Conte quantos ataques utilizaram armas do tipo "Explosives".
select count(*) as "quantidade de ataques que usaram explosivos"
from terrorism_act t
join weapon w on w.id = t.weapon_id
where w.id = 6;

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

-- 9.	Quantos ataques foram feitos utilizando armas do tipo "Firearms" no ano de 2001?
select count(*) "quantidade de ataques por armas de fogo"
from terrorism_act
where weapon_id = 5;

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

-------------------------------------------------------------------------------

-- 11.	Liste os 10 países com maior número de ataques, em ordem decrescente.
select
	c.country,
	count(*) as "quantidade de ataques"
from terrorism_act t
join country c on c.id = t.country_id
group by c.country
order by count(*) desc
limit 10;

-- 12.	Para cada ano, mostre quantos ataques aconteceram.
select
	iyear as ano,
	count(*) as "quantidade de ataques"
from terrorism_act
group by iyear;

-- 13.	Liste os 5 tipos de armas mais utilizadas em ataques.
alter table terrorism_act drop column motive;

select
	w.weapon as armas,
	count(*) as "quantidade de ataques"
from terrorism_act t
join weapon w on w.id = t.weapon_id
group by w.weapon
order by count(*) desc
limit(5);

-- 14.	Para cada continente (região), exiba a quantidade total de ataques.
select
	r.region "região",
	count(*) "quantidade de ataques"
from terrorism_act t
join region r on r.id = t.region_id
group by region
order by count(*) desc;

-- 15.	Liste os países da região “Middle East & North Africa” com ataques e quantos ocorreram em cada.
select
	c.country "país",
	count(*) "quantidade de ataques no Oeste Médio e Norte da África"
from terrorism_act t
join country c on c.id = t.country_id
where region_id = 10
group by country
order by count(*) desc;

-- 16.	Liste os 5 anos com mais ataques utilizando o tipo de ataque “Bombing/Explosion”.
select
	iyear as ano,
	count(*) as "quantidade de ataques"
from terrorism_act
where attack_id = 3
group by iyear
order by count(*) desc
limit(5);

-- 17.	Mostre a média de ataques por país ao longo de todos os anos.
select
	pais,
	round(avg(quantidade_ataques)::numeric,2) as media_ataques_ano
from (
	select
		c.country pais,
		iyear ano,
		count(*) as quantidade_ataques
	from terrorism_act t
	join country c on c.id = t.country_id
	group by c.country, iyear
	order by pais
) A
group by pais
order by media_ataques_ano desc;

-- 18. Liste os países que sofreram ataques com mais de um tipo diferente de arma.
select *
from (
	select
		c.id,
		c.country,
		count (distinct t.weapon_id) as tipos_armas
	from terrorism_act t
	join country c on c.id = t.country_id
	group by c.id, c.country
)
where tipos_armas > 1
order by country;

-- 19.	Para cada tipo de alvo, mostre a soma de ataques registrados com armas incendiárias.
select
	tg.target,
	count(*) quantidade_ataques
from terrorism_act ta
join target tg on tg.id = ta.target_id
where weapon_id = 8
group by target
order by quantidade_ataques desc;

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

-------------------------------------------------------------------------------

-- 21.	Liste os países com aumento de número de ataques do ano 2000 para 2001.
select
	c.country as pais,
	A.ataques as ataques_em_2000,
	B.ataques as ataques_em_2001,
	round(((B.ataques/A.ataques)*100)::numeric, 2) || '%' as aumento_perc
from (
	select
		country_id,
		round(count(*)::numeric) as ataques
	from terrorism_act
	where iyear = 2000
	group by country_id
	) A join (
	select
		country_id,
		round(count(*)::numeric) as ataques
	from terrorism_act
	where iyear = 2001
	group by country_id
	) B on B.country_id = A.country_id
join country c on c.id = A.country_id
where B.ataques > A.ataques
order by B.ataques - A.ataques desc;

-- 22.	Encontre o país que teve o maior número de ataques com o tipo “Hostage Taking (Kidnapping)”.
select * from attack where id = 6;

select
	country as pais,
	count(*) as quantidade_sequestros
from terrorism_act t
join country c on c.id = t.country_id
where attack_id = 6
group by country
order by count(*) desc
fetch first row only;

-- 23.	Para cada país, mostre o tipo de ataque mais comum.
select
	country as pais,
	attack as ataque_mais_comum,
	quantidade_ataques
from (
	select
		c.country,
		a.attack,
		count(*) as quantidade_ataques,
		row_number() over (
			partition by c.id
			order by count(*) desc
	) as rank
	from terrorism_act t
	join attack a on a.id = t.attack_id
	join country c on c.id = t.country_id
	group by c.id, c.country, a.id, a.attack
	) A
where rank = 1
order by quantidade_ataques desc;

-- 24.	Liste os 3 países com maior diversidade de tipos de armas utilizadas.
select
	c.country,
	count(distinct t.weapon_id) as quantidade_de_armas_diferentes
from terrorism_act t
join country c on c.id = t.country_id
group by country
order by quantidade_de_armas_diferentes desc
limit 3;

-- 25.	Encontre a região com a maior média de ataques por ano.
select
	A.region,
	round(avg(A.quantidade_de_ataques_por_regiao)::numeric, 2) as media_de_ataques_por_regiao
from (
	select
		t.iyear,
		t.region_id,
		r.region,
		count(*) as quantidade_de_ataques_por_regiao
	from terrorism_act t
	join region r on r.id = t.region_id
	group by iyear, region_id, region
) A
group by A.region
order by A.media_de_ataques_por_regiao desc
fetch first row only;

-- 26.	Liste todos os países onde foram registrados ataques com armas biológicas, químicas ou radiológicas.
select
	c.country,
	w.weapon,
	count(*) as quantidade_de_ataques
from terrorism_act t
join country c on c.id = t.country_id
join weapon w on w.id = t.weapon_id
where weapon_id in (1, 2, 3)
group by country, weapon
order by country;

-- 27.	Utilize uma CTE para listar os países com ataques em todos os anos entre 2005 e 2010.
with ataques_ano_paises as (
	select
		country,
		iyear
	from terrorism_act t
	join country c on c.id = t.country_id
	where iyear between 2005 and 2010
	group by country, iyear
)
select
	country
from ataques_ano_paises
group by country
having count(distinct iyear) = 6
order by country;

-- 28.	Liste os pares de países com ataques que ocorreram no mesmo ano, na mesma região e com o mesmo tipo.
with ataques_pais_regiao_tipo as (
	select
		c.country,
		r.region,
		a.attack,
		t.iyear as ano,
		count(*) as quantidade_de_ataques
	from terrorism_act t
	join country c on c.id = t.country_id
	join region r on r.id = t.region_id
	join attack a on a.id = t.attack_id
	where attack is not null
	group by country, region, attack, iyear
)
select
	A.country as pais_1,
	B.country as pais_2,
	A.region as regiao,
	A.attack as tipo_ataque,
	A.ano
from ataques_pais_regiao_tipo A
join ataques_pais_regiao_tipo B
	on A.ano = B.ano
	and A.region = B.region
	and A.attack = B.attack
	and A.country > B.country
order by A.ano, A.quantidade_de_ataques;

-- 29.	Encontre o país com maior número de ataques contra alvos civis ("Private Citizens & Property") usando "Firearms".
select
	c.country as pais,
	count(*) as quantidade_de_ataques
from terrorism_act t
join country c on c.id = t.country_id
where t.weapon_id = 5
and t.target_id = 14
group by c.country
order by count(*) desc
limit 1;

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
selectj
	vat.country,
	qat.quantidade_ataques,
	vat.tipos_ataques_usados as tipos_ataques,
	var.tipos_armas_usados as tipos_armas,
	round(qat.quantidade_ataques::numeric / nullif((tipos_ataques_usados * tipos_armas_usados), 0), 2) as indice_periculosidade
from variedades_ataques_pais vat
join variedade_armas_pais var on vat.country = var.country
join quantidade_ataques_pais qat on qat.country = vat.country
order by indice_periculosidade desc;

-------------------------------------------------------------------------------

-- 31.






























