--8. Показать поля ProductID, Name из таблицы Production.Product
--с применением функции COALESCE(). Показать поле Meauserement,
--так, чтобы, если значение в поле Style известно, то показать его, а
--иначе, показать значение в поле Color. Если и в поле Color значение
--неизвестно, то вывести значение 'UNKNOWN'.
select p."ProductID" , p."Name" , 
coalesce ("Style", "Color", 'unlnown') as "Meauserement"
from "Production"."Product" p 