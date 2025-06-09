-- 5.	Liste o nome dos países onde houve pelo menos um ataque em 2015
select distinct c.country
from terrorism_act t
join country c on c.id = t.country_id
where t.iyear = 2015
order by c.country;