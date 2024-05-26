--2. Показать поля ProductDescriptionID, [Description] из
--таблицы Production.ProductModelProductDescription.
select pmpdc."ProductDescriptionID", pd."Description" 
from "Production"."ProductModelProductDescriptionCulture" pmpdc 
join "Production"."ProductDescription" pd on pd."ProductDescriptionID" = pmpdc."ProductDescriptionID" 
