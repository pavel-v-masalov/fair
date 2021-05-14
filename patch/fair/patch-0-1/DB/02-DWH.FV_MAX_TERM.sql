set define off
-- load row: DWH.FV_MAX_TERM, Excel row# 4
begin
update DWH.FV_MAX_TERM
	set
		"RATE_TYPE"='Трансфертная ставка',
		"RATE_TYPE_CD"='FTP',
		"MAX_TERM"=5474,
		"VALUE"=0.0754
where
		"RATE_TYPE_CD"='FTP';
if sql%rowcount = 0 then
insert into DWH.FV_MAX_TERM ("RATE_TYPE","RATE_TYPE_CD","MAX_TERM","VALUE" ) 
values (
	'Трансфертная ставка',
	'FTP',
	5474,
	0.0754
);
end if;
end;
/
-- load row: DWH.FV_MAX_TERM, Excel row# 5
begin
update DWH.FV_MAX_TERM
	set
		"RATE_TYPE"='Трансфертная ставка (fix)',
		"RATE_TYPE_CD"='FTP_FIX',
		"MAX_TERM"=5474,
		"VALUE"=0.0754
where
		"RATE_TYPE_CD"='FTP_FIX';
if sql%rowcount = 0 then
insert into DWH.FV_MAX_TERM ("RATE_TYPE","RATE_TYPE_CD","MAX_TERM","VALUE" ) 
values (
	'Трансфертная ставка (fix)',
	'FTP_FIX',
	5474,
	0.0754
);
end if;
end;
/
-- load row: DWH.FV_MAX_TERM, Excel row# 6
begin
update DWH.FV_MAX_TERM
	set
		"RATE_TYPE"='Спред за досрочное погашение',
		"RATE_TYPE_CD"='EARLY_SPREAD',
		"MAX_TERM"=5474,
		"VALUE"=0.0012
where
		"RATE_TYPE_CD"='EARLY_SPREAD';
if sql%rowcount = 0 then
insert into DWH.FV_MAX_TERM ("RATE_TYPE","RATE_TYPE_CD","MAX_TERM","VALUE" ) 
values (
	'Спред за досрочное погашение',
	'EARLY_SPREAD',
	5474,
	0.0012
);
end if;
end;
/
-- load row: DWH.FV_MAX_TERM, Excel row# 7
begin
update DWH.FV_MAX_TERM
	set
		"RATE_TYPE"='Спред за отмену индикаторов',
		"RATE_TYPE_CD"='CNCL_SREAD',
		"MAX_TERM"=5474,
		"VALUE"=0.0013
where
		"RATE_TYPE_CD"='CNCL_SREAD';
if sql%rowcount = 0 then
insert into DWH.FV_MAX_TERM ("RATE_TYPE","RATE_TYPE_CD","MAX_TERM","VALUE" ) 
values (
	'Спред за отмену индикаторов',
	'CNCL_SREAD',
	5474,
	0.0013
);
end if;
end;
/
-- load row: DWH.FV_MAX_TERM, Excel row# 8
begin
update DWH.FV_MAX_TERM
	set
		"RATE_TYPE"='Спред за фиксацию',
		"RATE_TYPE_CD"='FIX_SPREAD',
		"MAX_TERM"=5474,
		"VALUE"=0.0014
where
		"RATE_TYPE_CD"='FIX_SPREAD';
if sql%rowcount = 0 then
insert into DWH.FV_MAX_TERM ("RATE_TYPE","RATE_TYPE_CD","MAX_TERM","VALUE" ) 
values (
	'Спред за фиксацию',
	'FIX_SPREAD',
	5474,
	0.0014
);
end if;
end;
/
commit;
