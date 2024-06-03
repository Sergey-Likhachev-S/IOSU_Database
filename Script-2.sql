--Показать список людей (поля FirstName, LastName), в котором указан уровень 
--человека в организации (OrganizationLevel) или нет, из таблиц Person.Person, 
--HumanResources.Employee, используя LEFT OUTER JOIN. 
SELECT 
	p."FirstName" ,
	p."LastName" ,
	e."OrganizationLevel" 
FROM 
	"Person"."Person" p 
	LEFT OUTER JOIN "HumanResources"."Employee" e 
	ON e."BusinessEntityID" = p."BusinessEntityID" 
