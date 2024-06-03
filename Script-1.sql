--Показать   товары,   цена   которых   меньше   средней   цены   (Таблица
--Production.Product). Показать поля Name, Size и ListPrice.
SELECT 
	p."Name",
	p."Size" ,
	p."ListPrice" 
FROM "Production"."Product" p 
WHERE p."ListPrice" < (SELECT avg("ListPrice")
					   FROM "Production"."Product" p2 )
ORDER BY p."ListPrice" DESC 

