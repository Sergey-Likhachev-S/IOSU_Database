--10. Показать название (Name) и размер (Size) товара из таблицы
--Production.Product, если имеются товары только размера 'M'.
--Заменить размер товара на NULL, если он имеет значение 'M'.
--Названия поля Size заменить на Class.
select p."Name" ,
case 
	when p."Size" = 'M'then null
	else p."Size" 
end as "Class"
from "Production"."Product" p 
where "Size" ='M'

select p."ProductID" , p."Name" , nullif (p."Color", 'Red') as "Color"
from "Production"."Product" p 
where p."Color" is not null and p."Color" != 'Red'