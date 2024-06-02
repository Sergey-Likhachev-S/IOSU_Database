--В отдельном файле написать скрипт, который показывает работу с
--оператором MERGE.
select *
into table "CounterpartiesCopy1"  
from "Counterparties" 

insert into "CounterpartiesCopy1" 
values
	 (11, 'Цыпленков')
	,(12,'Турчинский');
	
select *
into table "CounterpartiesCopy2"
from "CounterpartiesCopy1"

delete from "CounterpartiesCopy2" 
where "ID" in (4, 5);

select * into "SourceTable"
from "CounterpartiesCopy1";

delete from  "SourceTable"
where  "ID" not in (1, 2, 3);

update "SourceTable"
set "Name" = 'Алексеев Алексей Алексеевич'
where "ID" = 8;

merge into "CounterpartiesCopy2" as Target
using "SourceTable" as source
on (Target."ID" = source."ID")
when matched 
then update 
set "Name" = source."Name"
when not matched
then insert 
values (source."ID", source."Name");
