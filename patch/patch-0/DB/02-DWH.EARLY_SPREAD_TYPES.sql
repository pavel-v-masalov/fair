set define off
-- load row: DWH.EARLY_SPREAD_TYPES, Excel row# 4
begin
update DWH.EARLY_SPREAD_TYPES
	set
		"EARLY_SPREAD_TYPE_KEY"=1,
		"EARLY_SPREAD_TYPE_NAME"='Спред + комиссия'
where
		"EARLY_SPREAD_TYPE_KEY"=1;
if sql%rowcount = 0 then
insert into DWH.EARLY_SPREAD_TYPES ("EARLY_SPREAD_TYPE_KEY","EARLY_SPREAD_TYPE_NAME" ) 
values (
	1,
	'Спред + комиссия'
);
end if;
end;
/
-- load row: DWH.EARLY_SPREAD_TYPES, Excel row# 5
begin
update DWH.EARLY_SPREAD_TYPES
	set
		"EARLY_SPREAD_TYPE_KEY"=2,
		"EARLY_SPREAD_TYPE_NAME"='Мораторий + спред'
where
		"EARLY_SPREAD_TYPE_KEY"=2;
if sql%rowcount = 0 then
insert into DWH.EARLY_SPREAD_TYPES ("EARLY_SPREAD_TYPE_KEY","EARLY_SPREAD_TYPE_NAME" ) 
values (
	2,
	'Мораторий + спред'
);
end if;
end;
/
commit;
