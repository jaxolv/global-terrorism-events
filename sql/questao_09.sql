-- 9.	Quantos ataques foram feitos utilizando armas do tipo "Firearms" no ano de 2001?
select count(*) "quantidade de ataques por armas de fogo"
from terrorism_act
where weapon_id = 5;