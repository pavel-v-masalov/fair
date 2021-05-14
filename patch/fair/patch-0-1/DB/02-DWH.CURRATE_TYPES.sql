set define off
-- load row: DWH.CURRATE_TYPES, Excel row# 4
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=1,
		"CURRENCY_LETTER_CD"='RUB',
		"FIXFLOAT"='fix',
		"CURRENCY_KEY"=125,
		"FIXFLOAT_CD"='FIXED',
		"CONTRACTS_TERMS_KEY"=1
where
		"CURRATE_TYPE_KEY"=1;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	1,
	'RUB',
	'fix',
	125,
	'FIXED',
	1
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 5
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=7,
		"CURRENCY_LETTER_CD"='RUB',
		"FIXFLOAT"='fix',
		"CURRENCY_KEY"=125,
		"FIXFLOAT_CD"='FIXED',
		"CONTRACTS_TERMS_KEY"=2
where
		"CURRATE_TYPE_KEY"=7;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	7,
	'RUB',
	'fix',
	125,
	'FIXED',
	2
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 6
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=8,
		"CURRENCY_LETTER_CD"='RUB',
		"FIXFLOAT"='float',
		"CURRENCY_KEY"=125,
		"FIXFLOAT_CD"='FLOAT',
		"CONTRACTS_TERMS_KEY"=2
where
		"CURRATE_TYPE_KEY"=8;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	8,
	'RUB',
	'float',
	125,
	'FLOAT',
	2
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 7
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=9,
		"CURRENCY_LETTER_CD"='USD',
		"FIXFLOAT"='fix',
		"CURRENCY_KEY"=149,
		"FIXFLOAT_CD"='FIXED',
		"CONTRACTS_TERMS_KEY"=2
where
		"CURRATE_TYPE_KEY"=9;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	9,
	'USD',
	'fix',
	149,
	'FIXED',
	2
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 8
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=10,
		"CURRENCY_LETTER_CD"='USD',
		"FIXFLOAT"='float',
		"CURRENCY_KEY"=149,
		"FIXFLOAT_CD"='FLOAT',
		"CONTRACTS_TERMS_KEY"=2
where
		"CURRATE_TYPE_KEY"=10;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	10,
	'USD',
	'float',
	149,
	'FLOAT',
	2
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 9
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=11,
		"CURRENCY_LETTER_CD"='EUR',
		"FIXFLOAT"='fix',
		"CURRENCY_KEY"=71,
		"FIXFLOAT_CD"='FIXED',
		"CONTRACTS_TERMS_KEY"=2
where
		"CURRATE_TYPE_KEY"=11;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	11,
	'EUR',
	'fix',
	71,
	'FIXED',
	2
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 10
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=12,
		"CURRENCY_LETTER_CD"='EUR',
		"FIXFLOAT"='float',
		"CURRENCY_KEY"=71,
		"FIXFLOAT_CD"='FLOAT',
		"CONTRACTS_TERMS_KEY"=2
where
		"CURRATE_TYPE_KEY"=12;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	12,
	'EUR',
	'float',
	71,
	'FLOAT',
	2
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 11
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=13,
		"CURRENCY_LETTER_CD"='RUB',
		"FIXFLOAT"='fix',
		"CURRENCY_KEY"=125,
		"FIXFLOAT_CD"='FIXED',
		"CONTRACTS_TERMS_KEY"=3
where
		"CURRATE_TYPE_KEY"=13;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	13,
	'RUB',
	'fix',
	125,
	'FIXED',
	3
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 12
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=14,
		"CURRENCY_LETTER_CD"='RUB',
		"FIXFLOAT"='float',
		"CURRENCY_KEY"=125,
		"FIXFLOAT_CD"='FLOAT',
		"CONTRACTS_TERMS_KEY"=3
where
		"CURRATE_TYPE_KEY"=14;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	14,
	'RUB',
	'float',
	125,
	'FLOAT',
	3
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 13
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=15,
		"CURRENCY_LETTER_CD"='USD',
		"FIXFLOAT"='fix',
		"CURRENCY_KEY"=149,
		"FIXFLOAT_CD"='FIXED',
		"CONTRACTS_TERMS_KEY"=3
where
		"CURRATE_TYPE_KEY"=15;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	15,
	'USD',
	'fix',
	149,
	'FIXED',
	3
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 14
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=16,
		"CURRENCY_LETTER_CD"='USD',
		"FIXFLOAT"='float',
		"CURRENCY_KEY"=149,
		"FIXFLOAT_CD"='FLOAT',
		"CONTRACTS_TERMS_KEY"=3
where
		"CURRATE_TYPE_KEY"=16;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	16,
	'USD',
	'float',
	149,
	'FLOAT',
	3
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 15
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=17,
		"CURRENCY_LETTER_CD"='EUR',
		"FIXFLOAT"='fix',
		"CURRENCY_KEY"=71,
		"FIXFLOAT_CD"='FIXED',
		"CONTRACTS_TERMS_KEY"=3
where
		"CURRATE_TYPE_KEY"=17;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	17,
	'EUR',
	'fix',
	71,
	'FIXED',
	3
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 16
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=18,
		"CURRENCY_LETTER_CD"='EUR',
		"FIXFLOAT"='float',
		"CURRENCY_KEY"=71,
		"FIXFLOAT_CD"='FLOAT',
		"CONTRACTS_TERMS_KEY"=3
where
		"CURRATE_TYPE_KEY"=18;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	18,
	'EUR',
	'float',
	71,
	'FLOAT',
	3
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 17
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=19,
		"CURRENCY_LETTER_CD"='RUB',
		"FIXFLOAT"='fix',
		"CURRENCY_KEY"=125,
		"FIXFLOAT_CD"='FIXED',
		"CONTRACTS_TERMS_KEY"=4
where
		"CURRATE_TYPE_KEY"=19;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	19,
	'RUB',
	'fix',
	125,
	'FIXED',
	4
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 18
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=20,
		"CURRENCY_LETTER_CD"='RUB',
		"FIXFLOAT"='float',
		"CURRENCY_KEY"=125,
		"FIXFLOAT_CD"='FLOAT',
		"CONTRACTS_TERMS_KEY"=4
where
		"CURRATE_TYPE_KEY"=20;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	20,
	'RUB',
	'float',
	125,
	'FLOAT',
	4
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 19
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=21,
		"CURRENCY_LETTER_CD"='USD',
		"FIXFLOAT"='fix',
		"CURRENCY_KEY"=149,
		"FIXFLOAT_CD"='FIXED',
		"CONTRACTS_TERMS_KEY"=4
where
		"CURRATE_TYPE_KEY"=21;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	21,
	'USD',
	'fix',
	149,
	'FIXED',
	4
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 20
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=22,
		"CURRENCY_LETTER_CD"='USD',
		"FIXFLOAT"='float',
		"CURRENCY_KEY"=149,
		"FIXFLOAT_CD"='FLOAT',
		"CONTRACTS_TERMS_KEY"=4
where
		"CURRATE_TYPE_KEY"=22;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	22,
	'USD',
	'float',
	149,
	'FLOAT',
	4
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 21
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=23,
		"CURRENCY_LETTER_CD"='EUR',
		"FIXFLOAT"='fix',
		"CURRENCY_KEY"=71,
		"FIXFLOAT_CD"='FIXED',
		"CONTRACTS_TERMS_KEY"=4
where
		"CURRATE_TYPE_KEY"=23;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	23,
	'EUR',
	'fix',
	71,
	'FIXED',
	4
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 22
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=24,
		"CURRENCY_LETTER_CD"='EUR',
		"FIXFLOAT"='float',
		"CURRENCY_KEY"=71,
		"FIXFLOAT_CD"='FLOAT',
		"CONTRACTS_TERMS_KEY"=4
where
		"CURRATE_TYPE_KEY"=24;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	24,
	'EUR',
	'float',
	71,
	'FLOAT',
	4
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 23
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=25,
		"CURRENCY_LETTER_CD"='RUB',
		"FIXFLOAT"='fix',
		"CURRENCY_KEY"=125,
		"FIXFLOAT_CD"='FIXED',
		"CONTRACTS_TERMS_KEY"=5
where
		"CURRATE_TYPE_KEY"=25;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	25,
	'RUB',
	'fix',
	125,
	'FIXED',
	5
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 24
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=26,
		"CURRENCY_LETTER_CD"='RUB',
		"FIXFLOAT"='float',
		"CURRENCY_KEY"=125,
		"FIXFLOAT_CD"='FLOAT',
		"CONTRACTS_TERMS_KEY"=5
where
		"CURRATE_TYPE_KEY"=26;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	26,
	'RUB',
	'float',
	125,
	'FLOAT',
	5
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 25
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=27,
		"CURRENCY_LETTER_CD"='USD',
		"FIXFLOAT"='fix',
		"CURRENCY_KEY"=149,
		"FIXFLOAT_CD"='FIXED',
		"CONTRACTS_TERMS_KEY"=5
where
		"CURRATE_TYPE_KEY"=27;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	27,
	'USD',
	'fix',
	149,
	'FIXED',
	5
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 26
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=28,
		"CURRENCY_LETTER_CD"='USD',
		"FIXFLOAT"='float',
		"CURRENCY_KEY"=149,
		"FIXFLOAT_CD"='FLOAT',
		"CONTRACTS_TERMS_KEY"=5
where
		"CURRATE_TYPE_KEY"=28;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	28,
	'USD',
	'float',
	149,
	'FLOAT',
	5
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 27
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=29,
		"CURRENCY_LETTER_CD"='EUR',
		"FIXFLOAT"='fix',
		"CURRENCY_KEY"=71,
		"FIXFLOAT_CD"='FIXED',
		"CONTRACTS_TERMS_KEY"=5
where
		"CURRATE_TYPE_KEY"=29;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	29,
	'EUR',
	'fix',
	71,
	'FIXED',
	5
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 28
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=30,
		"CURRENCY_LETTER_CD"='EUR',
		"FIXFLOAT"='float',
		"CURRENCY_KEY"=71,
		"FIXFLOAT_CD"='FLOAT',
		"CONTRACTS_TERMS_KEY"=5
where
		"CURRATE_TYPE_KEY"=30;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	30,
	'EUR',
	'float',
	71,
	'FLOAT',
	5
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 29
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=31,
		"CURRENCY_LETTER_CD"='RUB',
		"FIXFLOAT"='fix',
		"CURRENCY_KEY"=125,
		"FIXFLOAT_CD"='FIXED',
		"CONTRACTS_TERMS_KEY"=6
where
		"CURRATE_TYPE_KEY"=31;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	31,
	'RUB',
	'fix',
	125,
	'FIXED',
	6
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 30
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=32,
		"CURRENCY_LETTER_CD"='RUB',
		"FIXFLOAT"='float',
		"CURRENCY_KEY"=125,
		"FIXFLOAT_CD"='FLOAT',
		"CONTRACTS_TERMS_KEY"=6
where
		"CURRATE_TYPE_KEY"=32;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	32,
	'RUB',
	'float',
	125,
	'FLOAT',
	6
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 31
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=33,
		"CURRENCY_LETTER_CD"='USD',
		"FIXFLOAT"='fix',
		"CURRENCY_KEY"=149,
		"FIXFLOAT_CD"='FIXED',
		"CONTRACTS_TERMS_KEY"=6
where
		"CURRATE_TYPE_KEY"=33;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	33,
	'USD',
	'fix',
	149,
	'FIXED',
	6
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 32
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=34,
		"CURRENCY_LETTER_CD"='USD',
		"FIXFLOAT"='float',
		"CURRENCY_KEY"=149,
		"FIXFLOAT_CD"='FLOAT',
		"CONTRACTS_TERMS_KEY"=6
where
		"CURRATE_TYPE_KEY"=34;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	34,
	'USD',
	'float',
	149,
	'FLOAT',
	6
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 33
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=35,
		"CURRENCY_LETTER_CD"='EUR',
		"FIXFLOAT"='fix',
		"CURRENCY_KEY"=71,
		"FIXFLOAT_CD"='FIXED',
		"CONTRACTS_TERMS_KEY"=6
where
		"CURRATE_TYPE_KEY"=35;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	35,
	'EUR',
	'fix',
	71,
	'FIXED',
	6
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 34
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=36,
		"CURRENCY_LETTER_CD"='EUR',
		"FIXFLOAT"='float',
		"CURRENCY_KEY"=71,
		"FIXFLOAT_CD"='FLOAT',
		"CONTRACTS_TERMS_KEY"=6
where
		"CURRATE_TYPE_KEY"=36;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	36,
	'EUR',
	'float',
	71,
	'FLOAT',
	6
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 35
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=37,
		"CURRENCY_LETTER_CD"='RUB',
		"FIXFLOAT"='fix',
		"CURRENCY_KEY"=125,
		"FIXFLOAT_CD"='FIXED',
		"CONTRACTS_TERMS_KEY"=7
where
		"CURRATE_TYPE_KEY"=37;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	37,
	'RUB',
	'fix',
	125,
	'FIXED',
	7
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 36
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=38,
		"CURRENCY_LETTER_CD"='RUB',
		"FIXFLOAT"='float',
		"CURRENCY_KEY"=125,
		"FIXFLOAT_CD"='FLOAT',
		"CONTRACTS_TERMS_KEY"=7
where
		"CURRATE_TYPE_KEY"=38;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	38,
	'RUB',
	'float',
	125,
	'FLOAT',
	7
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 37
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=39,
		"CURRENCY_LETTER_CD"='USD',
		"FIXFLOAT"='fix',
		"CURRENCY_KEY"=149,
		"FIXFLOAT_CD"='FIXED',
		"CONTRACTS_TERMS_KEY"=7
where
		"CURRATE_TYPE_KEY"=39;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	39,
	'USD',
	'fix',
	149,
	'FIXED',
	7
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 38
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=40,
		"CURRENCY_LETTER_CD"='USD',
		"FIXFLOAT"='float',
		"CURRENCY_KEY"=149,
		"FIXFLOAT_CD"='FLOAT',
		"CONTRACTS_TERMS_KEY"=7
where
		"CURRATE_TYPE_KEY"=40;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	40,
	'USD',
	'float',
	149,
	'FLOAT',
	7
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 39
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=41,
		"CURRENCY_LETTER_CD"='EUR',
		"FIXFLOAT"='fix',
		"CURRENCY_KEY"=71,
		"FIXFLOAT_CD"='FIXED',
		"CONTRACTS_TERMS_KEY"=7
where
		"CURRATE_TYPE_KEY"=41;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	41,
	'EUR',
	'fix',
	71,
	'FIXED',
	7
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 40
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=42,
		"CURRENCY_LETTER_CD"='EUR',
		"FIXFLOAT"='float',
		"CURRENCY_KEY"=71,
		"FIXFLOAT_CD"='FLOAT',
		"CONTRACTS_TERMS_KEY"=7
where
		"CURRATE_TYPE_KEY"=42;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	42,
	'EUR',
	'float',
	71,
	'FLOAT',
	7
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 41
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=43,
		"CURRENCY_LETTER_CD"='RUB',
		"FIXFLOAT"='fix',
		"CURRENCY_KEY"=125,
		"FIXFLOAT_CD"='FIXED',
		"CONTRACTS_TERMS_KEY"=8
where
		"CURRATE_TYPE_KEY"=43;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	43,
	'RUB',
	'fix',
	125,
	'FIXED',
	8
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 42
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=44,
		"CURRENCY_LETTER_CD"='RUB',
		"FIXFLOAT"='float',
		"CURRENCY_KEY"=125,
		"FIXFLOAT_CD"='FLOAT',
		"CONTRACTS_TERMS_KEY"=8
where
		"CURRATE_TYPE_KEY"=44;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	44,
	'RUB',
	'float',
	125,
	'FLOAT',
	8
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 43
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=45,
		"CURRENCY_LETTER_CD"='USD',
		"FIXFLOAT"='fix',
		"CURRENCY_KEY"=149,
		"FIXFLOAT_CD"='FIXED',
		"CONTRACTS_TERMS_KEY"=8
where
		"CURRATE_TYPE_KEY"=45;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	45,
	'USD',
	'fix',
	149,
	'FIXED',
	8
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 44
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=46,
		"CURRENCY_LETTER_CD"='USD',
		"FIXFLOAT"='float',
		"CURRENCY_KEY"=149,
		"FIXFLOAT_CD"='FLOAT',
		"CONTRACTS_TERMS_KEY"=8
where
		"CURRATE_TYPE_KEY"=46;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	46,
	'USD',
	'float',
	149,
	'FLOAT',
	8
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 45
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=47,
		"CURRENCY_LETTER_CD"='EUR',
		"FIXFLOAT"='fix',
		"CURRENCY_KEY"=71,
		"FIXFLOAT_CD"='FIXED',
		"CONTRACTS_TERMS_KEY"=8
where
		"CURRATE_TYPE_KEY"=47;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	47,
	'EUR',
	'fix',
	71,
	'FIXED',
	8
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 46
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=48,
		"CURRENCY_LETTER_CD"='EUR',
		"FIXFLOAT"='float',
		"CURRENCY_KEY"=71,
		"FIXFLOAT_CD"='FLOAT',
		"CONTRACTS_TERMS_KEY"=8
where
		"CURRATE_TYPE_KEY"=48;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	48,
	'EUR',
	'float',
	71,
	'FLOAT',
	8
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 47
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=50,
		"CURRENCY_LETTER_CD"='RUB',
		"FIXFLOAT"='float',
		"CURRENCY_KEY"=125,
		"FIXFLOAT_CD"='FLOAT',
		"CONTRACTS_TERMS_KEY"=9
where
		"CURRATE_TYPE_KEY"=50;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	50,
	'RUB',
	'float',
	125,
	'FLOAT',
	9
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 48
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=52,
		"CURRENCY_LETTER_CD"='USD',
		"FIXFLOAT"='float',
		"CURRENCY_KEY"=149,
		"FIXFLOAT_CD"='FLOAT',
		"CONTRACTS_TERMS_KEY"=9
where
		"CURRATE_TYPE_KEY"=52;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	52,
	'USD',
	'float',
	149,
	'FLOAT',
	9
);
end if;
end;
/
-- load row: DWH.CURRATE_TYPES, Excel row# 49
begin
update DWH.CURRATE_TYPES
	set
		"CURRATE_TYPE_KEY"=54,
		"CURRENCY_LETTER_CD"='EUR',
		"FIXFLOAT"='float',
		"CURRENCY_KEY"=71,
		"FIXFLOAT_CD"='FLOAT',
		"CONTRACTS_TERMS_KEY"=9
where
		"CURRATE_TYPE_KEY"=54;
if sql%rowcount = 0 then
insert into DWH.CURRATE_TYPES ("CURRATE_TYPE_KEY","CURRENCY_LETTER_CD","FIXFLOAT","CURRENCY_KEY","FIXFLOAT_CD","CONTRACTS_TERMS_KEY" ) 
values (
	54,
	'EUR',
	'float',
	71,
	'FLOAT',
	9
);
end if;
end;
/
commit;
