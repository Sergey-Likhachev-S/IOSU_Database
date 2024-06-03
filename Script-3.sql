alter table "Counterparties"
alter column "ID"
set not null;

alter table "Counterparties"
alter column "Name"
set not null;

alter table "Counterparties"
alter column "Address"
set not null;

alter table "Counterparties"
alter column "Counterparty_type"
set not null;

alter table "Discounts"
alter column "ID"
set not null;

alter table "Discounts"
alter column "Counterparty_ID"
set not null;

alter table "Discounts"
alter column "Start_date"
set not null;

alter table "Discounts"
alter column "Expiration_date"
set not null;

alter table "Discounts"
alter column "Discount_amount"
set not null;
