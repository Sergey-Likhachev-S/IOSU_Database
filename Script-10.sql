--Пропустить 15 строк из результирующего набора, полученного в п.9
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
OFFSET 15
