--Вывести пол, где средний возраст больше 42 лет 
--из таблицы HumanResources.Employee (не учитывать пустые значения).
SELECT 
	e."Gender" AS "Пол",
	EXTRACT (years FROM avg(age(current_date , e."BirthDate"))) AS "Средний возраст"
FROM 
	"HumanResources"."Employee" e 
WHERE 
	e."BirthDate" IS NOT NULL 
GROUP BY 
	e."Gender" 
HAVING 
	avg(age(current_date , e."BirthDate")) >= INTERVAL '42 years'
