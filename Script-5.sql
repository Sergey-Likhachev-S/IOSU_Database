--Показать товары, цена которых меньше средней цены в том же стиле
--(Таблица  Production.Product).  Показать поля  Name,  ListPrice
--и Style.
SELECT 
	"Name" , 
	"ListPrice" , 
	"Style"  
FROM "Production"."Product" p 
WHERE "ListPrice" < (SELECT avg("ListPrice") 
					FROM "Production"."Product" p2
					WHERE p."Style" = p2."Style")
