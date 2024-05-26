--5. Показать поля ProductCategoryID и Name из таблицы
--Production.ProductCategory. Показать только те товары,
--название которых начинается на букву 'C'.
select pc."ProductCategoryID" , pc."Name" 
from "Production"."ProductCategory" pc 
where pc."Name" like 'C%'