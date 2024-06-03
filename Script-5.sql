
alter table "Discounts"
add constraint "FK_Counterparties_Discounts"
foreign key ("Counterparty_ID")
references "Counterparties" ("ID");
