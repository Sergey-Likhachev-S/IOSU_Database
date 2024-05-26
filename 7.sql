--7. Показать поля BusinessEntityID, AccountNumber, Name,
--PurchasingWebServiceURL из таблицы Purchasing.Vendor.
--Неизвестные адреса сайтов магазинов (PurchasingWebServiceURL)
--заменить значением 'not available'. Названия полей оставить без
--изменений.
select v."BusinessEntityID" , v."AccountNumber" , v."Name" , 
coalesce (v."PurchasingWebServiceURL", 'not available') as "PurchasingWebServiceURL"
from "Purchasing"."Vendor" v 