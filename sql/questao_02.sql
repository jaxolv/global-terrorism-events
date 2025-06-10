-- 2.	Liste o eventid, iyear, imonth e iday dos ataques que ocorreram no mês de janeiro.
select event_id id, iyear ano, imonth mes, iday dia
from terrorism_act
where imonth = 1;