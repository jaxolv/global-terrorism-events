-- 15.	Liste os países da região “Middle East & North Africa” com ataques e quantos ocorreram em cada.
select
	c.country "país",
	count(*) "quantidade de ataques no Oeste Médio e Norte da África"
from terrorism_act t
join country c on c.id = t.country_id
where region_id = 10
group by country
order by count(*) desc;