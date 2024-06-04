--Ранжирование   сотрудников   по   должности   в   алфавитном   порядке.
--("HumanResources"."Employee").  Примечание   к   ранжированию  –
--ранг  может  начинаться  с  произвольного  числа   (например,  2  или  5),
--главное – ранг не должен уменьшаться.
SELECT 
	"BusinessEntityID" ,
	"JobTitle" ,
	(SELECT count(*)
	FROM "HumanResources"."Employee" e2
	WHERE e2."JobTitle"<=e."JobTitle") AS "Range" 
FROM "HumanResources"."Employee" e 
ORDER BY "Range"

