--Показать список ProductID, которые содержатся в таблице 
--Production.Product, но не содержатся в таблице Production.WorkOrder.
SELECT 
	p."ProductID" 
FROM 
	"Production"."Product" p 
EXCEPT 
SELECT 
	wo."ProductID" 
FROM 
	"Production"."WorkOrder" wo  

