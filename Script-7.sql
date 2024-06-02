
alter table "Discounts"
add constraint "CH_Discounts_Counterparty_ID"
check ("Counterparty_ID" > 0);
