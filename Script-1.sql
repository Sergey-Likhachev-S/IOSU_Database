--Показать цену за штуку (UnitPrice) и поля Name, 
--ProductNumber из таблиц Production.Product, Sales.SalesOrderDetail.
SELECT 
	sod."UnitPrice" ,
	p."Name" ,
	p."ProductNumber" 
FROM
	"Production"."Product" p 
	JOIN "Sales"."SalesOrderDetail" sod 
	ON sod."ProductID" = p."ProductID" 

