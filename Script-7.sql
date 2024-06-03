--Показать комбинированный список таблиц Person.Address, 
--Person.BusinessEntityAddress по полям AddressID, ModifiedDate, используя UNION.
SELECT 
	a."AddressID" ,
	a."ModifiedDate" 
FROM 
	"Person"."Address" a 
UNION 
SELECT 
	bea."AddressID" ,
	bea."ModifiedDate" 
FROM "Person"."BusinessEntityAddress" bea 
