--4. Из таблицы Sales.SalesOrderDetail показать ID продажи
--(SalesOrderID) и ID товара (ProductID). Показать только те
--товары, у которых есть CarrierTrackingNumber
select sod."SalesOrderID" , sod."ProductID" 
from "Sales"."SalesOrderDetail" sod 
where sod."CarrierTrackingNumber" is not null