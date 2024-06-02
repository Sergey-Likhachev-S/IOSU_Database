--В отдельном файле написать скрипт, который создает копию таблицы с выбранными полями.
select c."Name"
	  ,c."Address"
into table "CounterpartiesCopy1"
from "Counterparties" c 
