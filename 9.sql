--9. Из таблицы Production.Culture показать значения поля Name в
--алфавитном порядке.
select c."Name" 
from "Production"."Culture" c 
order by c."Name" 