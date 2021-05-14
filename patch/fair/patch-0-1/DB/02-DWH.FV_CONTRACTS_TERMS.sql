-- load row: DWH.FV_CONTRACTS_TERMS, Excel row# 4
begin
update DWH.FV_CONTRACTS_TERMS
	set
		"CONTRACTS_TERMS_KEY"=1,
		"CONTRACTS_TERMS_NAME"='44-‘«'
where
		"CONTRACTS_TERMS_KEY"=1;
if sql%rowcount = 0 then
insert into DWH.FV_CONTRACTS_TERMS ("CONTRACTS_TERMS_KEY","CONTRACTS_TERMS_NAME" ) 
values (
	1,
	'44-‘«'
);
end if;
end;
/
-- load row: DWH.FV_CONTRACTS_TERMS, Excel row# 5
begin
update DWH.FV_CONTRACTS_TERMS
	set
		"CONTRACTS_TERMS_KEY"=2,
		"CONTRACTS_TERMS_NAME"='223-‘«'
where
		"CONTRACTS_TERMS_KEY"=2;
if sql%rowcount = 0 then
insert into DWH.FV_CONTRACTS_TERMS ("CONTRACTS_TERMS_KEY","CONTRACTS_TERMS_NAME" ) 
values (
	2,
	'223-‘«'
);
end if;
end;
/
-- load row: DWH.FV_CONTRACTS_TERMS, Excel row# 6
begin
update DWH.FV_CONTRACTS_TERMS
	set
		"CONTRACTS_TERMS_KEY"=3,
		"CONTRACTS_TERMS_NAME"='»Ì‰Ë‚Ë‰Û‡Î¸Ì˚Â ÍÓÚËÓ‚ÍË'
where
		"CONTRACTS_TERMS_KEY"=3;
if sql%rowcount = 0 then
insert into DWH.FV_CONTRACTS_TERMS ("CONTRACTS_TERMS_KEY","CONTRACTS_TERMS_NAME" ) 
values (
	3,
	'»Ì‰Ë‚Ë‰Û‡Î¸Ì˚Â ÍÓÚËÓ‚ÍË'
);
end if;
end;
/
-- load row: DWH.FV_CONTRACTS_TERMS, Excel row# 7
begin
update DWH.FV_CONTRACTS_TERMS
	set
		"CONTRACTS_TERMS_KEY"=4,
		"CONTRACTS_TERMS_NAME"='—¡”À— 1'
where
		"CONTRACTS_TERMS_KEY"=4;
if sql%rowcount = 0 then
insert into DWH.FV_CONTRACTS_TERMS ("CONTRACTS_TERMS_KEY","CONTRACTS_TERMS_NAME" ) 
values (
	4,
	'—¡”À— 1'
);
end if;
end;
/
-- load row: DWH.FV_CONTRACTS_TERMS, Excel row# 8
begin
update DWH.FV_CONTRACTS_TERMS
	set
		"CONTRACTS_TERMS_KEY"=5,
		"CONTRACTS_TERMS_NAME"='—¡”À— 2'
where
		"CONTRACTS_TERMS_KEY"=5;
if sql%rowcount = 0 then
insert into DWH.FV_CONTRACTS_TERMS ("CONTRACTS_TERMS_KEY","CONTRACTS_TERMS_NAME" ) 
values (
	5,
	'—¡”À— 2'
);
end if;
end;
/
-- load row: DWH.FV_CONTRACTS_TERMS, Excel row# 9
begin
update DWH.FV_CONTRACTS_TERMS
	set
		"CONTRACTS_TERMS_KEY"=6,
		"CONTRACTS_TERMS_NAME"='—¡”À— 3'
where
		"CONTRACTS_TERMS_KEY"=6;
if sql%rowcount = 0 then
insert into DWH.FV_CONTRACTS_TERMS ("CONTRACTS_TERMS_KEY","CONTRACTS_TERMS_NAME" ) 
values (
	6,
	'—¡”À— 3'
);
end if;
end;
/
-- load row: DWH.FV_CONTRACTS_TERMS, Excel row# 10
begin
update DWH.FV_CONTRACTS_TERMS
	set
		"CONTRACTS_TERMS_KEY"=7,
		"CONTRACTS_TERMS_NAME"='—¡”À— 4'
where
		"CONTRACTS_TERMS_KEY"=7;
if sql%rowcount = 0 then
insert into DWH.FV_CONTRACTS_TERMS ("CONTRACTS_TERMS_KEY","CONTRACTS_TERMS_NAME" ) 
values (
	7,
	'—¡”À— 4'
);
end if;
end;
/
-- load row: DWH.FV_CONTRACTS_TERMS, Excel row# 11
begin
update DWH.FV_CONTRACTS_TERMS
	set
		"CONTRACTS_TERMS_KEY"=8,
		"CONTRACTS_TERMS_NAME"='—¡”À— 5'
where
		"CONTRACTS_TERMS_KEY"=8;
if sql%rowcount = 0 then
insert into DWH.FV_CONTRACTS_TERMS ("CONTRACTS_TERMS_KEY","CONTRACTS_TERMS_NAME" ) 
values (
	8,
	'—¡”À— 5'
);
end if;
end;
/
-- load row: DWH.FV_CONTRACTS_TERMS, Excel row# 12
begin
update DWH.FV_CONTRACTS_TERMS
	set
		"CONTRACTS_TERMS_KEY"=9,
		"CONTRACTS_TERMS_NAME"='—¡”À— 6'
where
		"CONTRACTS_TERMS_KEY"=9;
if sql%rowcount = 0 then
insert into DWH.FV_CONTRACTS_TERMS ("CONTRACTS_TERMS_KEY","CONTRACTS_TERMS_NAME" ) 
values (
	9,
	'—¡”À— 6'
);
end if;
end;
/
