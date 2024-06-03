--Ограничить результирующий набор, полученный в п.8.
SELECT 
	p."ProductID" 
FROM 
	"Production"."Product" p 
EXCEPT 
SELECT 
	wo."ProductID" 
FROM 
	"Production"."WorkOrder" wo  
LIMIT 100
