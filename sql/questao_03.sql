-- 3.	Quantos ataques ocorreram no país com country_id = 217 (EUA)?
select count(*) "quantidade de ataques nos EUA"
from terrorism_act
where country_id = 217;