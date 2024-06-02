--В отдельном файле написать скрипт, который создает копию таблицы без данных.
select *
into table "CounterpartiesCopy3"
from "Counterparties" c 
where 1 = 2;
