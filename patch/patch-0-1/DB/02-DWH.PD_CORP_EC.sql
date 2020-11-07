set define off
-- load row: DWH.PD_CORP_EC, Excel row# 4
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=3,
		"RATING_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='A1',
		"PD"=0.0018686274,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='A1' AND 
		"PD"=0.0018686274 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'A1',
	0.0018686274,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 5
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=3,
		"RATING_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='A2',
		"PD"=0.0027728323,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='A2' AND 
		"PD"=0.0027728323 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'A2',
	0.0027728323,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 6
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=3,
		"RATING_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='A3',
		"PD"=0.0034004126,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='A3' AND 
		"PD"=0.0034004126 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'A3',
	0.0034004126,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 7
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=3,
		"RATING_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='B1',
		"PD"=0.005099678,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='B1' AND 
		"PD"=0.005099678 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'B1',
	0.005099678,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 8
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=3,
		"RATING_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='B2',
		"PD"=0.0077567796,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='B2' AND 
		"PD"=0.0077567796 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'B2',
	0.0077567796,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 9
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=3,
		"RATING_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='B3',
		"PD"=0.0114714528,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='B3' AND 
		"PD"=0.0114714528 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'B3',
	0.0114714528,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 10
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=3,
		"RATING_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='C1',
		"PD"=0.0158889783,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='C1' AND 
		"PD"=0.0158889783 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'C1',
	0.0158889783,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 11
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=3,
		"RATING_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='C2',
		"PD"=0.0210244105,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='C2' AND 
		"PD"=0.0210244105 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'C2',
	0.0210244105,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 12
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=3,
		"RATING_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='C3',
		"PD"=0.0292074178,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='C3' AND 
		"PD"=0.0292074178 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'C3',
	0.0292074178,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 13
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=3,
		"RATING_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='D1',
		"PD"=0.0408312964,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='D1' AND 
		"PD"=0.0408312964 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'D1',
	0.0408312964,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 14
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=3,
		"RATING_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='D2',
		"PD"=0.0563580282,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='D2' AND 
		"PD"=0.0563580282 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'D2',
	0.0563580282,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 15
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=3,
		"RATING_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='D3',
		"PD"=0.0852935259,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='D3' AND 
		"PD"=0.0852935259 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'D3',
	0.0852935259,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 16
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=3,
		"RATING_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='E',
		"PD"=0.1675244223,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='E' AND 
		"PD"=0.1675244223 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'E',
	0.1675244223,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 17
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=4,
		"RATING_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='A1',
		"PD"=0.0027728323,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='A1' AND 
		"PD"=0.0027728323 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'A1',
	0.0027728323,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 18
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=4,
		"RATING_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='A2',
		"PD"=0.0034004126,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='A2' AND 
		"PD"=0.0034004126 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'A2',
	0.0034004126,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 19
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=4,
		"RATING_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='A3',
		"PD"=0.005099678,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='A3' AND 
		"PD"=0.005099678 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'A3',
	0.005099678,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 20
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=4,
		"RATING_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='B1',
		"PD"=0.0077567796,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='B1' AND 
		"PD"=0.0077567796 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'B1',
	0.0077567796,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 21
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=4,
		"RATING_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='B2',
		"PD"=0.0114714528,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='B2' AND 
		"PD"=0.0114714528 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'B2',
	0.0114714528,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 22
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=4,
		"RATING_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='B3',
		"PD"=0.0158889783,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='B3' AND 
		"PD"=0.0158889783 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'B3',
	0.0158889783,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 23
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=4,
		"RATING_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='C1',
		"PD"=0.0210244105,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='C1' AND 
		"PD"=0.0210244105 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'C1',
	0.0210244105,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 24
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=4,
		"RATING_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='C2',
		"PD"=0.0292074178,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='C2' AND 
		"PD"=0.0292074178 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'C2',
	0.0292074178,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 25
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=4,
		"RATING_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='C3',
		"PD"=0.0408312964,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='C3' AND 
		"PD"=0.0408312964 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'C3',
	0.0408312964,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 26
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=4,
		"RATING_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='D1',
		"PD"=0.0563580282,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='D1' AND 
		"PD"=0.0563580282 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'D1',
	0.0563580282,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 27
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=4,
		"RATING_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='D2',
		"PD"=0.0852935259,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='D2' AND 
		"PD"=0.0852935259 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'D2',
	0.0852935259,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 28
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=4,
		"RATING_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='D3',
		"PD"=0.1675244223,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='D3' AND 
		"PD"=0.1675244223 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'D3',
	0.1675244223,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 29
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=4,
		"RATING_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='E',
		"PD"=0.1675244223,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='E' AND 
		"PD"=0.1675244223 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'E',
	0.1675244223,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 30
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='AAA',
		"PD"=8.67802705398517E-05,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='AAA' AND 
		"PD"=8.67802705398517E-05 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'AAA',
	8.67802705398517E-05,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 31
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='AA+',
		"PD"=1.30561483310375E-04,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='AA+' AND 
		"PD"=1.30561483310375E-04 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'AA+',
	1.30561483310375E-04,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 32
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='AA',
		"PD"=1.96425992033226E-04,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='AA' AND 
		"PD"=1.96425992033226E-04 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'AA',
	1.96425992033226E-04,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 33
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='AA-',
		"PD"=2.95506811878466E-04,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='AA-' AND 
		"PD"=2.95506811878466E-04 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'AA-',
	2.95506811878466E-04,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 34
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='A+',
		"PD"=4.4454216981516E-04,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='A+' AND 
		"PD"=4.4454216981516E-04 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'A+',
	4.4454216981516E-04,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 35
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='A',
		"PD"=6.68688308768996E-04,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='A' AND 
		"PD"=6.68688308768996E-04 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'A',
	6.68688308768996E-04,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 36
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='A-',
		"PD"=1.0057320900221E-03,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='A-' AND 
		"PD"=1.0057320900221E-03 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'A-',
	1.0057320900221E-03,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 37
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='BBB+',
		"PD"=1.5123852139138E-03,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='BBB+' AND 
		"PD"=1.5123852139138E-03 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'BBB+',
	1.5123852139138E-03,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 38
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='BBB',
		"PD"=2.27365527363635E-03,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='BBB' AND 
		"PD"=2.27365527363635E-03 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'BBB',
	2.27365527363635E-03,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 39
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='BBB-',
		"PD"=3.41672240172264E-03,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='BBB-' AND 
		"PD"=3.41672240172264E-03 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'BBB-',
	3.41672240172264E-03,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 40
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='BB+',
		"PD"=5.13131833198793E-03,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='BB+' AND 
		"PD"=5.13131833198793E-03 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'BB+',
	5.13131833198793E-03,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 41
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='BB',
		"PD"=7.69927453745326E-03,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='BB' AND 
		"PD"=7.69927453745326E-03 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'BB',
	7.69927453745326E-03,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 42
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='BB-',
		"PD"=1.15365148475835E-02,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='BB-' AND 
		"PD"=1.15365148475835E-02 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'BB-',
	1.15365148475835E-02,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 43
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='B+',
		"PD"=1.72508440225062E-02,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='B+' AND 
		"PD"=1.72508440225062E-02 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'B+',
	1.72508440225062E-02,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 44
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='B',
		"PD"=2.57173016050651E-02,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='B' AND 
		"PD"=2.57173016050651E-02 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'B',
	2.57173016050651E-02,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 45
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='B-',
		"PD"=0.038167267888062,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='B-' AND 
		"PD"=0.038167267888062 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'B-',
	0.038167267888062,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 46
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='CCC+',
		"PD"=0.14856811,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='CCC+' AND 
		"PD"=0.14856811 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'CCC+',
	0.14856811,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 47
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='CCC',
		"PD"=0.14856811,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='CCC' AND 
		"PD"=0.14856811 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'CCC',
	0.14856811,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 48
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='CCC-',
		"PD"=0.14856811,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='CCC-' AND 
		"PD"=0.14856811 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'CCC-',
	0.14856811,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 49
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='CC',
		"PD"=0.14856811,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='CC' AND 
		"PD"=0.14856811 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'CC',
	0.14856811,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 50
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='C',
		"PD"=0.14856811,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='C' AND 
		"PD"=0.14856811 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'C',
	0.14856811,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 51
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='D',
		"PD"=1,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='D' AND 
		"PD"=1 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'D',
	1,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 52
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=5,
		"RATING_MODEL"='Нет рейтинга',
		"RAT_ON_DATE"=NULL,
		"PD"=0.1675244223,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Нет рейтинга' AND 
		"RAT_ON_DATE" is NULL AND 
		"PD"=0.1675244223 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	5,
	'Нет рейтинга',
	NULL,
	0.1675244223,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 53
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=5,
		"RATING_MODEL"='Нет рейтинга',
		"RAT_ON_DATE"='No rating',
		"PD"=0.1675244223,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Нет рейтинга' AND 
		"RAT_ON_DATE"='No rating' AND 
		"PD"=0.1675244223 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	5,
	'Нет рейтинга',
	'No rating',
	0.1675244223,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 54
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=6,
		"RATING_MODEL"='Лизинговые',
		"RAT_ON_DATE"='A1',
		"PD"=0.0018686274,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='A1' AND 
		"PD"=0.0018686274 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'A1',
	0.0018686274,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 55
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=6,
		"RATING_MODEL"='Лизинговые',
		"RAT_ON_DATE"='A2',
		"PD"=0.0027728323,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='A2' AND 
		"PD"=0.0027728323 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'A2',
	0.0027728323,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 56
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=6,
		"RATING_MODEL"='Лизинговые',
		"RAT_ON_DATE"='A3',
		"PD"=0.0034004126,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='A3' AND 
		"PD"=0.0034004126 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'A3',
	0.0034004126,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 57
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=6,
		"RATING_MODEL"='Лизинговые',
		"RAT_ON_DATE"='B1',
		"PD"=0.005099678,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='B1' AND 
		"PD"=0.005099678 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'B1',
	0.005099678,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 58
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=6,
		"RATING_MODEL"='Лизинговые',
		"RAT_ON_DATE"='B2',
		"PD"=0.0077567796,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='B2' AND 
		"PD"=0.0077567796 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'B2',
	0.0077567796,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 59
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=6,
		"RATING_MODEL"='Лизинговые',
		"RAT_ON_DATE"='B3',
		"PD"=0.0114714528,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='B3' AND 
		"PD"=0.0114714528 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'B3',
	0.0114714528,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 60
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=6,
		"RATING_MODEL"='Лизинговые',
		"RAT_ON_DATE"='C1',
		"PD"=0.0158889783,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='C1' AND 
		"PD"=0.0158889783 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'C1',
	0.0158889783,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 61
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=6,
		"RATING_MODEL"='Лизинговые',
		"RAT_ON_DATE"='C2',
		"PD"=0.0210244105,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='C2' AND 
		"PD"=0.0210244105 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'C2',
	0.0210244105,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 62
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=6,
		"RATING_MODEL"='Лизинговые',
		"RAT_ON_DATE"='C3',
		"PD"=0.0292074178,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='C3' AND 
		"PD"=0.0292074178 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'C3',
	0.0292074178,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 63
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=6,
		"RATING_MODEL"='Лизинговые',
		"RAT_ON_DATE"='D1',
		"PD"=0.0408312964,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='D1' AND 
		"PD"=0.0408312964 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'D1',
	0.0408312964,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 64
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=6,
		"RATING_MODEL"='Лизинговые',
		"RAT_ON_DATE"='D2',
		"PD"=0.0563580282,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='D2' AND 
		"PD"=0.0563580282 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'D2',
	0.0563580282,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 65
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=6,
		"RATING_MODEL"='Лизинговые',
		"RAT_ON_DATE"='D3',
		"PD"=0.0852935259,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='D3' AND 
		"PD"=0.0852935259 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'D3',
	0.0852935259,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 66
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=6,
		"RATING_MODEL"='Лизинговые',
		"RAT_ON_DATE"='E',
		"PD"=0.1675244223,
		"START_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='E' AND 
		"PD"=0.1675244223 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'E',
	0.1675244223,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 67
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=3,
		"RATING_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='A1',
		"PD"=2.41218330802713E-03,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='A1' AND 
		"PD"=2.41218330802713E-03 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'A1',
	2.41218330802713E-03,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 68
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=3,
		"RATING_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='A2',
		"PD"=3.41883831146096E-03,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='A2' AND 
		"PD"=3.41883831146096E-03 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'A2',
	3.41883831146096E-03,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 69
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=3,
		"RATING_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='A3',
		"PD"=4.05895413017003E-03,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='A3' AND 
		"PD"=4.05895413017003E-03 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'A3',
	4.05895413017003E-03,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 70
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=3,
		"RATING_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='B1',
		"PD"=5.95866216581157E-03,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='B1' AND 
		"PD"=5.95866216581157E-03 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'B1',
	5.95866216581157E-03,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 71
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=3,
		"RATING_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='B2',
		"PD"=8.93885130215019E-03,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='B2' AND 
		"PD"=8.93885130215019E-03 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'B2',
	8.93885130215019E-03,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 72
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=3,
		"RATING_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='B3',
		"PD"=1.28067571971378E-02,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='B3' AND 
		"PD"=1.28067571971378E-02 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'B3',
	1.28067571971378E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 73
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=3,
		"RATING_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='C1',
		"PD"=1.75470861519781E-02,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='C1' AND 
		"PD"=1.75470861519781E-02 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'C1',
	1.75470861519781E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 74
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=3,
		"RATING_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='C2',
		"PD"=2.25092411206509E-02,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='C2' AND 
		"PD"=2.25092411206509E-02 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'C2',
	2.25092411206509E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 75
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=3,
		"RATING_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='C3',
		"PD"=3.02791324830112E-02,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='C3' AND 
		"PD"=3.02791324830112E-02 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'C3',
	3.02791324830112E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 76
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=3,
		"RATING_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='D1',
		"PD"=4.22563014030519E-02,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='D1' AND 
		"PD"=4.22563014030519E-02 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'D1',
	4.22563014030519E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 77
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=3,
		"RATING_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='D2',
		"PD"=5.54173275352711E-02,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='D2' AND 
		"PD"=5.54173275352711E-02 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'D2',
	5.54173275352711E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 78
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=3,
		"RATING_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='D3',
		"PD"=8.03457967153691E-02,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='D3' AND 
		"PD"=8.03457967153691E-02 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'D3',
	8.03457967153691E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 79
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=3,
		"RATING_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='E',
		"PD"=0.151180979318036,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='E' AND 
		"PD"=0.151180979318036 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'E',
	0.151180979318036,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 80
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=4,
		"RATING_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='A1',
		"PD"=3.41883831146096E-03,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='A1' AND 
		"PD"=3.41883831146096E-03 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'A1',
	3.41883831146096E-03,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 81
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=4,
		"RATING_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='A2',
		"PD"=4.05895413017003E-03,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='A2' AND 
		"PD"=4.05895413017003E-03 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'A2',
	4.05895413017003E-03,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 82
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=4,
		"RATING_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='A3',
		"PD"=5.95866216581157E-03,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='A3' AND 
		"PD"=5.95866216581157E-03 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'A3',
	5.95866216581157E-03,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 83
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=4,
		"RATING_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='B1',
		"PD"=8.93885130215019E-03,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='B1' AND 
		"PD"=8.93885130215019E-03 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'B1',
	8.93885130215019E-03,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 84
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=4,
		"RATING_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='B2',
		"PD"=1.28067571971378E-02,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='B2' AND 
		"PD"=1.28067571971378E-02 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'B2',
	1.28067571971378E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 85
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=4,
		"RATING_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='B3',
		"PD"=1.75470861519781E-02,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='B3' AND 
		"PD"=1.75470861519781E-02 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'B3',
	1.75470861519781E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 86
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=4,
		"RATING_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='C1',
		"PD"=2.25092411206509E-02,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='C1' AND 
		"PD"=2.25092411206509E-02 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'C1',
	2.25092411206509E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 87
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=4,
		"RATING_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='C2',
		"PD"=3.02791324830112E-02,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='C2' AND 
		"PD"=3.02791324830112E-02 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'C2',
	3.02791324830112E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 88
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=4,
		"RATING_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='C3',
		"PD"=4.22563014030519E-02,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='C3' AND 
		"PD"=4.22563014030519E-02 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'C3',
	4.22563014030519E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 89
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=4,
		"RATING_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='D1',
		"PD"=5.54173275352711E-02,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='D1' AND 
		"PD"=5.54173275352711E-02 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'D1',
	5.54173275352711E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 90
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=4,
		"RATING_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='D2',
		"PD"=8.03457967153691E-02,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='D2' AND 
		"PD"=8.03457967153691E-02 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'D2',
	8.03457967153691E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 91
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=4,
		"RATING_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='D3',
		"PD"=0.151180979318036,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='D3' AND 
		"PD"=0.151180979318036 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'D3',
	0.151180979318036,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 92
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=4,
		"RATING_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='E',
		"PD"=0.151180979318036,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='E' AND 
		"PD"=0.151180979318036 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'E',
	0.151180979318036,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 93
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=9,
		"RATING_MODEL"='Администрации',
		"RAT_ON_DATE"='A1',
		"PD"=0.001968,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Администрации' AND 
		"RAT_ON_DATE"='A1' AND 
		"PD"=0.001968 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	9,
	'Администрации',
	'A1',
	0.001968,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 94
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=9,
		"RATING_MODEL"='Администрации',
		"RAT_ON_DATE"='A2',
		"PD"=0.001968,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Администрации' AND 
		"RAT_ON_DATE"='A2' AND 
		"PD"=0.001968 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	9,
	'Администрации',
	'A2',
	0.001968,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 95
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=9,
		"RATING_MODEL"='Администрации',
		"RAT_ON_DATE"='A3',
		"PD"=0.001968,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Администрации' AND 
		"RAT_ON_DATE"='A3' AND 
		"PD"=0.001968 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	9,
	'Администрации',
	'A3',
	0.001968,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 96
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=9,
		"RATING_MODEL"='Администрации',
		"RAT_ON_DATE"='B1',
		"PD"=2.2933716988467E-03,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Администрации' AND 
		"RAT_ON_DATE"='B1' AND 
		"PD"=2.2933716988467E-03 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	9,
	'Администрации',
	'B1',
	2.2933716988467E-03,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 97
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=9,
		"RATING_MODEL"='Администрации',
		"RAT_ON_DATE"='B2',
		"PD"=2.80594531957232E-03,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Администрации' AND 
		"RAT_ON_DATE"='B2' AND 
		"PD"=2.80594531957232E-03 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	9,
	'Администрации',
	'B2',
	2.80594531957232E-03,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 98
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=9,
		"RATING_MODEL"='Администрации',
		"RAT_ON_DATE"='B3',
		"PD"=3.69522653302951E-03,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Администрации' AND 
		"RAT_ON_DATE"='B3' AND 
		"PD"=3.69522653302951E-03 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	9,
	'Администрации',
	'B3',
	3.69522653302951E-03,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 99
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=9,
		"RATING_MODEL"='Администрации',
		"RAT_ON_DATE"='C1',
		"PD"=4.91380522006627E-03,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Администрации' AND 
		"RAT_ON_DATE"='C1' AND 
		"PD"=4.91380522006627E-03 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	9,
	'Администрации',
	'C1',
	4.91380522006627E-03,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 100
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=9,
		"RATING_MODEL"='Администрации',
		"RAT_ON_DATE"='C2',
		"PD"=6.31242124714658E-03,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Администрации' AND 
		"RAT_ON_DATE"='C2' AND 
		"PD"=6.31242124714658E-03 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	9,
	'Администрации',
	'C2',
	6.31242124714658E-03,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 101
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=9,
		"RATING_MODEL"='Администрации',
		"RAT_ON_DATE"='C3',
		"PD"=8.25775700082096E-03,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Администрации' AND 
		"RAT_ON_DATE"='C3' AND 
		"PD"=8.25775700082096E-03 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	9,
	'Администрации',
	'C3',
	8.25775700082096E-03,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 102
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=9,
		"RATING_MODEL"='Администрации',
		"RAT_ON_DATE"='D1',
		"PD"=1.08551146252056E-02,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Администрации' AND 
		"RAT_ON_DATE"='D1' AND 
		"PD"=1.08551146252056E-02 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	9,
	'Администрации',
	'D1',
	1.08551146252056E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 103
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=9,
		"RATING_MODEL"='Администрации',
		"RAT_ON_DATE"='D2',
		"PD"=1.32925485042138E-02,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Администрации' AND 
		"RAT_ON_DATE"='D2' AND 
		"PD"=1.32925485042138E-02 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	9,
	'Администрации',
	'D2',
	1.32925485042138E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 104
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=9,
		"RATING_MODEL"='Администрации',
		"RAT_ON_DATE"='D3',
		"PD"=1.75387315722337E-02,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Администрации' AND 
		"RAT_ON_DATE"='D3' AND 
		"PD"=1.75387315722337E-02 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	9,
	'Администрации',
	'D3',
	1.75387315722337E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 105
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=9,
		"RATING_MODEL"='Администрации',
		"RAT_ON_DATE"='E',
		"PD"=2.91124326524629E-02,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Администрации' AND 
		"RAT_ON_DATE"='E' AND 
		"PD"=2.91124326524629E-02 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	9,
	'Администрации',
	'E',
	2.91124326524629E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 106
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='AAA',
		"PD"=8.30200803121684E-05,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='AAA' AND 
		"PD"=8.30200803121684E-05 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'AAA',
	8.30200803121684E-05,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 107
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='AA+',
		"PD"=1.25693782808127E-04,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='AA+' AND 
		"PD"=1.25693782808127E-04 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'AA+',
	1.25693782808127E-04,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 108
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='AA',
		"PD"=1.90297888399927E-04,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='AA' AND 
		"PD"=1.90297888399927E-04 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'AA',
	1.90297888399927E-04,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 109
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='AA-',
		"PD"=2.88096700278732E-04,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='AA-' AND 
		"PD"=2.88096700278732E-04 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'AA-',
	2.88096700278732E-04,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 110
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='A+',
		"PD"=4.36132644098426E-04,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='A+' AND 
		"PD"=4.36132644098426E-04 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'A+',
	4.36132644098426E-04,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 111
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='A',
		"PD"=6.60180317255365E-04,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='A' AND 
		"PD"=6.60180317255365E-04 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'A',
	6.60180317255365E-04,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 112
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='A-',
		"PD"=9.99198025494977E-04,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='A-' AND 
		"PD"=9.99198025494977E-04 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'A-',
	9.99198025494977E-04,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 113
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='BBB+',
		"PD"=1.51201945319242E-03,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='BBB+' AND 
		"PD"=1.51201945319242E-03 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'BBB+',
	1.51201945319242E-03,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 114
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='BBB',
		"PD"=2.28737511162072E-03,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='BBB' AND 
		"PD"=2.28737511162072E-03 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'BBB',
	2.28737511162072E-03,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 115
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='BBB-',
		"PD"=3.45881451355917E-03,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='BBB-' AND 
		"PD"=3.45881451355917E-03 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'BBB-',
	3.45881451355917E-03,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 116
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='BB+',
		"PD"=5.22672984813358E-03,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='BB+' AND 
		"PD"=5.22672984813358E-03 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'BB+',
	5.22672984813358E-03,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 117
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='BB',
		"PD"=7.89041610282393E-03,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='BB' AND 
		"PD"=7.89041610282393E-03 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'BB',
	7.89041610282393E-03,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 118
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='BB-',
		"PD"=1.18937358410033E-02,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='BB-' AND 
		"PD"=1.18937358410033E-02 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'BB-',
	1.18937358410033E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 119
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='B+',
		"PD"=1.78879014578939E-02,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='B+' AND 
		"PD"=1.78879014578939E-02 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'B+',
	1.78879014578939E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 120
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='B',
		"PD"=2.68127477445902E-02,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='B' AND 
		"PD"=2.68127477445902E-02 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'B',
	2.68127477445902E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 121
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='B-',
		"PD"=3.99907633887817E-02,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='B-' AND 
		"PD"=3.99907633887817E-02 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'B-',
	3.99907633887817E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 122
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='CCC+',
		"PD"=0.14215485,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='CCC+' AND 
		"PD"=0.14215485 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'CCC+',
	0.14215485,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 123
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='CCC',
		"PD"=0.14215485,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='CCC' AND 
		"PD"=0.14215485 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'CCC',
	0.14215485,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 124
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='CCC-',
		"PD"=0.14215485,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='CCC-' AND 
		"PD"=0.14215485 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'CCC-',
	0.14215485,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 125
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='CC',
		"PD"=0.14215485,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='CC' AND 
		"PD"=0.14215485 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'CC',
	0.14215485,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 126
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='C',
		"PD"=0.14215485,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='C' AND 
		"PD"=0.14215485 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'C',
	0.14215485,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 127
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=10,
		"RATING_MODEL"='S&P',
		"RAT_ON_DATE"='D',
		"PD"=1,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='S&P' AND 
		"RAT_ON_DATE"='D' AND 
		"PD"=1 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'D',
	1,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 128
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=5,
		"RATING_MODEL"='Нет рейтинга',
		"RAT_ON_DATE"=NULL,
		"PD"=0.151180979318036,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Нет рейтинга' AND 
		"RAT_ON_DATE" is NULL AND 
		"PD"=0.151180979318036 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	5,
	'Нет рейтинга',
	NULL,
	0.151180979318036,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 129
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=5,
		"RATING_MODEL"='Нет рейтинга',
		"RAT_ON_DATE"='No rating',
		"PD"=0.151180979318036,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Нет рейтинга' AND 
		"RAT_ON_DATE"='No rating' AND 
		"PD"=0.151180979318036 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	5,
	'Нет рейтинга',
	'No rating',
	0.151180979318036,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 130
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=6,
		"RATING_MODEL"='Лизинговые',
		"RAT_ON_DATE"='A1',
		"PD"=2.41218330802713E-03,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='A1' AND 
		"PD"=2.41218330802713E-03 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'A1',
	2.41218330802713E-03,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 131
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=6,
		"RATING_MODEL"='Лизинговые',
		"RAT_ON_DATE"='A2',
		"PD"=3.41883831146096E-03,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='A2' AND 
		"PD"=3.41883831146096E-03 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'A2',
	3.41883831146096E-03,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 132
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=6,
		"RATING_MODEL"='Лизинговые',
		"RAT_ON_DATE"='A3',
		"PD"=4.05895413017003E-03,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='A3' AND 
		"PD"=4.05895413017003E-03 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'A3',
	4.05895413017003E-03,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 133
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=6,
		"RATING_MODEL"='Лизинговые',
		"RAT_ON_DATE"='B1',
		"PD"=5.95866216581157E-03,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='B1' AND 
		"PD"=5.95866216581157E-03 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'B1',
	5.95866216581157E-03,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 134
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=6,
		"RATING_MODEL"='Лизинговые',
		"RAT_ON_DATE"='B2',
		"PD"=8.93885130215019E-03,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='B2' AND 
		"PD"=8.93885130215019E-03 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'B2',
	8.93885130215019E-03,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 135
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=6,
		"RATING_MODEL"='Лизинговые',
		"RAT_ON_DATE"='B3',
		"PD"=1.28067571971378E-02,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='B3' AND 
		"PD"=1.28067571971378E-02 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'B3',
	1.28067571971378E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 136
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=6,
		"RATING_MODEL"='Лизинговые',
		"RAT_ON_DATE"='C1',
		"PD"=1.75470861519781E-02,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='C1' AND 
		"PD"=1.75470861519781E-02 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'C1',
	1.75470861519781E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 137
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=6,
		"RATING_MODEL"='Лизинговые',
		"RAT_ON_DATE"='C2',
		"PD"=2.25092411206509E-02,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='C2' AND 
		"PD"=2.25092411206509E-02 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'C2',
	2.25092411206509E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 138
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=6,
		"RATING_MODEL"='Лизинговые',
		"RAT_ON_DATE"='C3',
		"PD"=3.02791324830112E-02,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='C3' AND 
		"PD"=3.02791324830112E-02 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'C3',
	3.02791324830112E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 139
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=6,
		"RATING_MODEL"='Лизинговые',
		"RAT_ON_DATE"='D1',
		"PD"=4.22563014030519E-02,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='D1' AND 
		"PD"=4.22563014030519E-02 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'D1',
	4.22563014030519E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 140
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=6,
		"RATING_MODEL"='Лизинговые',
		"RAT_ON_DATE"='D2',
		"PD"=5.54173275352711E-02,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='D2' AND 
		"PD"=5.54173275352711E-02 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'D2',
	5.54173275352711E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 141
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=6,
		"RATING_MODEL"='Лизинговые',
		"RAT_ON_DATE"='D3',
		"PD"=8.03457967153691E-02,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='D3' AND 
		"PD"=8.03457967153691E-02 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'D3',
	8.03457967153691E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP_EC, Excel row# 142
begin
update DWH.PD_CORP_EC
	set
		"RATING_MODEL_KEY"=6,
		"RATING_MODEL"='Лизинговые',
		"RAT_ON_DATE"='E',
		"PD"=0.151180979318036,
		"START_DT"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RATING_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='E' AND 
		"PD"=0.151180979318036 AND 
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP_EC ("RATING_MODEL_KEY","RATING_MODEL","RAT_ON_DATE","PD","START_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'E',
	0.151180979318036,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
commit;
