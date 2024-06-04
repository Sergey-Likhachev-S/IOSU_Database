--Вывести название должности сотрудника, а также название должности
--сотрудника,   имеющего   большее   количество   отпускных   часов.
--Учитывать только действующих ("HumanResources"."Employee").				  
select e1."NationalIDNumber"
      ,e1."JobTitle" 
      ,(
         select e2."NationalIDNumber"
         from "HumanResources"."Employee" e2     
         where e2."JobTitle" = e1."JobTitle" and e2."NationalIDNumber" <> e1."NationalIDNumber"
         order by e2."NationalIDNumber" 
         limit 1
       )
      ,(
         select e2."JobTitle"
        from "HumanResources"."Employee" e2   
        where e2."JobTitle" = e1."JobTitle" and e2."NationalIDNumber" <>e1."NationalIDNumber"
         order by e2."NationalIDNumber"   
         limit 1   
       ) 
from "HumanResources"."Employee" e1;  
