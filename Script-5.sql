--Вывести EmployeeID, ShipDate и среднее по SubTotal 
--для всевозможных EmployeeID с одинаковой ShipDate из 
--таблицы Purchasing.PurchaseOrderHeader. (Использовать ROLLUP)
SELECT 
	poh."EmployeeID" ,
	poh."ShipDate" ,
	avg(poh."SubTotal")
FROM 
	"Purchasing"."PurchaseOrderHeader" poh 
WHERE 
	poh."EmployeeID" IS NOT NULL 
	AND poh."ShipDate" IS NOT NULL 
GROUP BY 
	ROLLUP (poh."EmployeeID" , poh."ShipDate")
