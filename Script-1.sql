--Показать количество разнообразных цветов товара (Color) из
--таблицы Production.Product.
SELECT 
	"Color", 
	count("Color")
FROM 
	"Production"."Product" p 
GROUP BY 
	p."Color" 

