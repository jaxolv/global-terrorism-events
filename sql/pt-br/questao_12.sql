-- 12.	Para cada ano, mostre quantos ataques aconteceram.
select
	iyear as ano,
	count(*) as "quantidade de ataques"
from terrorism_act
group by iyear;