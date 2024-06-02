--В отдельном файле написать скрипт, который создает копию таблицы с выбранными полями.
select c."ID"
	  ,c."Name"
	  ,c."Address"
	  ,c."Counterparty_type"
into table "CounterpartiesCopy2"
from "Counterparties" c 
where "Counterparty_type" = '1'
