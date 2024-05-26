--6. Из таблицы Sales.Store показать ID сотрудника
--(BusinessEntityID), название магазина (Name) и ID продавца
--(SalesPersonID). Показать только значения поля Name,
--принадлежащие списку ('Next-Door Bike Store', 'Area Bike
--Accessories', 'Top of the Line Bikes', 'Valley Toy
--Store', 'Global Plaza'). Использовать оператор IN
select s."BusinessEntityID" , s."Name" , s."SalesPersonID" 
from "Sales"."Store" s 
where s."Name" in 
('Next-Door Bike Store', 
'Area Bike Accessories', 
'Top of the Line Bikes', 
'Valley Toy
Store', 
'Global Plaza')