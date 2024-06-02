--Показать список продуктов (ProductID), которые имеют несколько различных 
--остатков на складах (Quantity), из таблицы Production.ProductInventory, используя SELF JOIN.
SELECT 
	DISTINCT pi2."ProductID"  
FROM 
	"Production"."ProductInventory" pi2
	INNER JOIN "Production"."ProductInventory" pi3 
	ON pi3."ProductID"  = pi2."ProductID"  
	AND pi2."LocationID" <> pi3."LocationID" 
ORDER BY pi2."ProductID" 

