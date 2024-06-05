--В отдельном файле написать скрипт, который создает таблицу,
--имеющую дубликаты строк. Написать скрипт, который удаляет
--дубликаты.

--Добавление повторных значений
insert into "CounterpartiesCopy2" 
	( "ID" 
	, "Name" 
	, "Address" 
	, "Counterparty_type" 
	) values
 (3, null, null, null)
,(4, null, null, null);

--Счетчик повторившихся значений
select 
	    "ID"
	   ,"Counterparty_type"
	   ,count(*)
from "CounterpartiesCopy2" cc  
group by ("ID", "Counterparty_type")
having count(*) > 1;

--Удаление повторных записей
delete 
from  "CounterpartiesCopy2" 
where ctid not in
(select  max(ctid) from "CounterpartiesCopy2" 
group by "ID");
