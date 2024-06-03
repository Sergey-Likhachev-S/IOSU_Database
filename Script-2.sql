
create table "Counterparties"
(
	"ID" INT
   ,"Name" VARCHAR (25)
   ,"Address" VARCHAR (25)
   ,"Counterparty_type" VARCHAR (25)
)

create table "Discounts"
(
	 "ID" INT
	,"Counterparty_ID" INT
	,"Start_date" VARCHAR (25)
	,"Expiration_date" VARCHAR (25)
	,"Discount_amount" VARCHAR (25)
)
