--Показать список товаров (поле Name), в котором указан, есть ли у товара дата начала 
--отслеживания цены (StartDate) или нет, из таблицы Production.ProductListPriceHistory, 
--Production.Product, используя RIGHT OUTER JOIN.
SELECT 
	p."Name" ,
	plph."StartDate" 
FROM 
	"Production"."ProductListPriceHistory" plph 
	RIGHT OUTER JOIN "Production"."Product" p 
	ON p."ProductID" = plph."ProductID" 
