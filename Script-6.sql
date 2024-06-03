--Показать список покупателей (CustomerID), которые имеют несколько сумм налога (TaxAmt), 
--из таблицы Sales.SalesOrderHeader, используя SELF JOIN. Сумма налога меньше 100.
SELECT 
	DISTINCT soh."CustomerID" 
FROM 
	"Sales"."SalesOrderHeader" soh 
	INNER JOIN "Sales"."SalesOrderHeader" soh2 
	ON soh."CustomerID" = soh2."CustomerID" 
	AND soh."TaxAmt" <>soh2."TaxAmt" 
	AND soh."TaxAmt" < 100
	AND soh2."TaxAmt" < 100

