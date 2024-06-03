--Изменить запрос п.5 использовать CUBE. Отделить строки, 
--созданные с помощью агрегатных функций от строк из фактической таблицы.
SELECT 
	poh."EmployeeID" ,
	poh."ShipDate" ,
	avg(poh."SubTotal"),
	GROUPING(poh."EmployeeID") AS "1",
      GROUPING(poh."ShipDate") AS "2"
FROM 
	"Purchasing"."PurchaseOrderHeader" poh 
GROUP BY 
	CUBE (poh."EmployeeID" , poh."ShipDate")	
