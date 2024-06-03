--Изменить запрос п.5 использовать GROUPING SETS. Отделить строки, 
--созданные с помощью агрегатных функций от строк из фактической таблицы.
SELECT 
    poh."EmployeeID",
    poh."ShipDate" ,
    AVG(poh."SubTotal"),
    GROUPING(poh."EmployeeID") AS "1",
    GROUPING(poh."ShipDate") AS "2"
FROM 
    "Purchasing"."PurchaseOrderHeader" poh 
GROUP BY 
    GROUPING SETS((poh."EmployeeID"), (poh."ShipDate"),())
