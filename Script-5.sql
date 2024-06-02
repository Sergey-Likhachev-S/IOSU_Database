--Показать список остатков на складах (Quantity), которые соответствуют
--нескольким продуктам (ProductID), из таблицы Production.ProductInventory, используя SELF JOIN
SELECT
	DISTINCT pi2."Quantity"
FROM 
	"Production"."ProductInventory" pi2  
	INNER JOIN "Production"."ProductInventory" pi3 
	ON pi3."Quantity" <> pi2."Quantity"
	AND pi2."ProductID" = pi3."ProductID"

