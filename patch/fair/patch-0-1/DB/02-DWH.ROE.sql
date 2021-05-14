set define off
-- load row: DWH.ROE, Excel row# 4
begin
update DWH.ROE
	set
		"ROE"=0.15,
		"VALID_FROM_DTTM"=to_date('1899-12-31','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.ROE ("ROE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	0.15,
	to_date('1899-12-31','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
commit;
