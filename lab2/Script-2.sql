--Найти суммарную цену (ListPrice) товара размера M из таблицы Production.Product, не учитывать пустые и нулевые значения
SELECT 
	p."ProductID",
	p."Name",
	sum(p."ListPrice") AS "Суммарная стоимость"
FROM 
	"Production"."Product" p 
WHERE 
	p."Size" = 'M'
	AND p."ListPrice" IS NOT NULL 
	AND p."ListPrice" != 0
GROUP BY p."ProductID" , p."Name" 
ORDER BY sum(p."ListPrice")

