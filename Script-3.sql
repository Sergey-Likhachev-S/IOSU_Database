--Найти количество номеров телефона разного типа (PhoneNumberTypeID) 
--из таблицы Person.PersonPhone, где номер начинается с 819. 
--Сортировать по возрастанию.
SELECT 
	pnt."Name"  AS "Тип" , 
	count(pp."PhoneNumber") AS "Количество"
FROM 
	"Person"."PersonPhone" pp 
	JOIN "Person"."PhoneNumberType" pnt 
	ON pnt."PhoneNumberTypeID" = pp."PhoneNumberTypeID" 
WHERE 
	pp."PhoneNumber" LIKE '819%'
GROUP BY 
	pnt."Name"  
ORDER BY 
	count(pp."PhoneNumber") ASC
