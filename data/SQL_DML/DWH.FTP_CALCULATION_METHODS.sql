set define off
-- load row: DWH.FTP_CALCULATION_METHODS, Excel row# 4
begin
update DWH.FTP_CALCULATION_METHODS
	set
		"FTP_CALCULATION_METHOD_KEY"=1,
		"FTP_CALCULATION_METHOD_NAME"='По сроку'
where
		"FTP_CALCULATION_METHOD_KEY"=1;
if sql%rowcount = 0 then
insert into DWH.FTP_CALCULATION_METHODS ("FTP_CALCULATION_METHOD_KEY","FTP_CALCULATION_METHOD_NAME" ) 
values (
	1,
	'По сроку'
);
end if;
end;
/
-- load row: DWH.FTP_CALCULATION_METHODS, Excel row# 5
begin
update DWH.FTP_CALCULATION_METHODS
	set
		"FTP_CALCULATION_METHOD_KEY"=2,
		"FTP_CALCULATION_METHOD_NAME"='WAL'
where
		"FTP_CALCULATION_METHOD_KEY"=2;
if sql%rowcount = 0 then
insert into DWH.FTP_CALCULATION_METHODS ("FTP_CALCULATION_METHOD_KEY","FTP_CALCULATION_METHOD_NAME" ) 
values (
	2,
	'WAL'
);
end if;
end;
/
commit;
