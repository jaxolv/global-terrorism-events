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