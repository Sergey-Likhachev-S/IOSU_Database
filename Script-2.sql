--В отдельном файле написать скрипт, который создает полную копию одной из таблиц.
select *
into table "CounterpartiesCopy"
from "Counterparties" c 
