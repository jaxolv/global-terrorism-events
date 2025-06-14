-- 30.	Crie uma consulta que classifique os países por um "índice de periculosidade", definido como: soma total de ataques / (variedade de armas utilizadas * variedade de tipos de ataque)
with tab_indice_de_periculosidade as (
	select
		country as pais,
		region as regiao,
		total_de_ataques,
		quant_armas_usadas_ataques,
		quant_tipo_ataques_diferentes,
		round(
			total_de_ataques::numeric / nullif((quant_armas_usadas_ataques * quant_tipo_ataques_diferentes), 0), 2
		) as indice_de_periculosidade
	from (
		select
			country_id,
			region_id,
			count(distinct weapon_id) as quant_armas_usadas_ataques,
			count(distinct attack_id) as quant_tipo_ataques_diferentes,
			count(*) as total_de_ataques
		from terrorism_act t
		where weapon_id is not null
		and attack_id is not null
		group by country_id, region_id
	) as sub
	join country c on c.id = sub.country_id
	join region r on r.id = sub.region_id
)
select * from tab_indice_de_periculosidade
order by indice_de_periculosidade desc;
