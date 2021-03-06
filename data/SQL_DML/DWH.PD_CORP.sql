set define off
-- load row: DWH.PD_CORP, Excel row# 4
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=3,
		"RANK_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='A1',
		"PD1_MACRO"=0.0018686274,
		"PD2_MACRO"=0.017242,
		"PD3_MACRO"=0.038112,
		"PD4_MACRO"=0.061115,
		"PD5_MACRO"=0.084698,
		"PD6_MACRO"=0.108183,
		"PD7_MACRO"=0.131283,
		"PD8_MACRO"=0.153879,
		"PD9_MACRO"=0.175929,
		"PD10_MACRO"=0.197423,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='A1' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'A1',
	0.0018686274,
	0.017242,
	0.038112,
	0.061115,
	0.084698,
	0.108183,
	0.131283,
	0.153879,
	0.175929,
	0.197423,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 5
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=3,
		"RANK_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='A2',
		"PD1_MACRO"=0.0027728323,
		"PD2_MACRO"=0.018482,
		"PD3_MACRO"=0.039459,
		"PD4_MACRO"=0.06248,
		"PD5_MACRO"=0.086046,
		"PD6_MACRO"=0.109503,
		"PD7_MACRO"=0.13257,
		"PD8_MACRO"=0.155133,
		"PD9_MACRO"=0.17715,
		"PD10_MACRO"=0.198612,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='A2' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'A2',
	0.0027728323,
	0.018482,
	0.039459,
	0.06248,
	0.086046,
	0.109503,
	0.13257,
	0.155133,
	0.17715,
	0.198612,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 6
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=3,
		"RANK_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='A3',
		"PD1_MACRO"=0.0034004126,
		"PD2_MACRO"=0.019447,
		"PD3_MACRO"=0.040509,
		"PD4_MACRO"=0.063543,
		"PD5_MACRO"=0.087096,
		"PD6_MACRO"=0.110531,
		"PD7_MACRO"=0.133573,
		"PD8_MACRO"=0.15611,
		"PD9_MACRO"=0.178102,
		"PD10_MACRO"=0.199538,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='A3' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'A3',
	0.0034004126,
	0.019447,
	0.040509,
	0.063543,
	0.087096,
	0.110531,
	0.133573,
	0.15611,
	0.178102,
	0.199538,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 7
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=3,
		"RANK_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='B1',
		"PD1_MACRO"=0.005099678,
		"PD2_MACRO"=0.021932,
		"PD3_MACRO"=0.043215,
		"PD4_MACRO"=0.066285,
		"PD5_MACRO"=0.089806,
		"PD6_MACRO"=0.113183,
		"PD7_MACRO"=0.136159,
		"PD8_MACRO"=0.15863,
		"PD9_MACRO"=0.180556,
		"PD10_MACRO"=0.201929,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='B1' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'B1',
	0.005099678,
	0.021932,
	0.043215,
	0.066285,
	0.089806,
	0.113183,
	0.136159,
	0.15863,
	0.180556,
	0.201929,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 8
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=3,
		"RANK_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='B2',
		"PD1_MACRO"=0.0077567796,
		"PD2_MACRO"=0.025808,
		"PD3_MACRO"=0.047443,
		"PD4_MACRO"=0.070576,
		"PD5_MACRO"=0.094048,
		"PD6_MACRO"=0.117336,
		"PD7_MACRO"=0.140211,
		"PD8_MACRO"=0.162577,
		"PD9_MACRO"=0.184401,
		"PD10_MACRO"=0.205673,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='B2' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'B2',
	0.0077567796,
	0.025808,
	0.047443,
	0.070576,
	0.094048,
	0.117336,
	0.140211,
	0.162577,
	0.184401,
	0.205673,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 9
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=3,
		"RANK_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='B3',
		"PD1_MACRO"=0.0114714528,
		"PD2_MACRO"=0.031374,
		"PD3_MACRO"=0.053536,
		"PD4_MACRO"=0.076773,
		"PD5_MACRO"=0.100181,
		"PD6_MACRO"=0.123343,
		"PD7_MACRO"=0.146072,
		"PD8_MACRO"=0.168289,
		"PD9_MACRO"=0.189963,
		"PD10_MACRO"=0.21109,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='B3' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'B3',
	0.0114714528,
	0.031374,
	0.053536,
	0.076773,
	0.100181,
	0.123343,
	0.146072,
	0.168289,
	0.189963,
	0.21109,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 10
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=3,
		"RANK_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='C1',
		"PD1_MACRO"=0.0158889783,
		"PD2_MACRO"=0.037976,
		"PD3_MACRO"=0.060812,
		"PD4_MACRO"=0.0842,
		"PD5_MACRO"=0.107547,
		"PD6_MACRO"=0.130566,
		"PD7_MACRO"=0.153123,
		"PD8_MACRO"=0.175159,
		"PD9_MACRO"=0.196655,
		"PD10_MACRO"=0.217606,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='C1' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'C1',
	0.0158889783,
	0.037976,
	0.060812,
	0.0842,
	0.107547,
	0.130566,
	0.153123,
	0.175159,
	0.196655,
	0.217606,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 11
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=3,
		"RANK_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='C2',
		"PD1_MACRO"=0.0210244105,
		"PD2_MACRO"=0.045715,
		"PD3_MACRO"=0.069461,
		"PD4_MACRO"=0.093107,
		"PD5_MACRO"=0.116423,
		"PD6_MACRO"=0.139289,
		"PD7_MACRO"=0.161646,
		"PD8_MACRO"=0.183468,
		"PD9_MACRO"=0.204747,
		"PD10_MACRO"=0.225485,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='C2' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'C2',
	0.0210244105,
	0.045715,
	0.069461,
	0.093107,
	0.116423,
	0.139289,
	0.161646,
	0.183468,
	0.204747,
	0.225485,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 12
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=3,
		"RANK_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='C3',
		"PD1_MACRO"=0.0292074178,
		"PD2_MACRO"=0.058894,
		"PD3_MACRO"=0.084843,
		"PD4_MACRO"=0.109468,
		"PD5_MACRO"=0.133105,
		"PD6_MACRO"=0.155941,
		"PD7_MACRO"=0.178083,
		"PD8_MACRO"=0.199595,
		"PD9_MACRO"=0.220518,
		"PD10_MACRO"=0.24088,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='C3' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'C3',
	0.0292074178,
	0.058894,
	0.084843,
	0.109468,
	0.133105,
	0.155941,
	0.178083,
	0.199595,
	0.220518,
	0.24088,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 13
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=3,
		"RANK_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='D1',
		"PD1_MACRO"=0.0408312964,
		"PD2_MACRO"=0.076117,
		"PD3_MACRO"=0.103735,
		"PD4_MACRO"=0.12872,
		"PD5_MACRO"=0.152185,
		"PD6_MACRO"=0.174643,
		"PD7_MACRO"=0.196336,
		"PD8_MACRO"=0.21738,
		"PD9_MACRO"=0.237837,
		"PD10_MACRO"=0.257744,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='D1' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'D1',
	0.0408312964,
	0.076117,
	0.103735,
	0.12872,
	0.152185,
	0.174643,
	0.196336,
	0.21738,
	0.237837,
	0.257744,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 14
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=3,
		"RANK_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='D2',
		"PD1_MACRO"=0.0563580282,
		"PD2_MACRO"=0.098121,
		"PD3_MACRO"=0.127314,
		"PD4_MACRO"=0.152447,
		"PD5_MACRO"=0.175554,
		"PD6_MACRO"=0.197485,
		"PD7_MACRO"=0.218604,
		"PD8_MACRO"=0.239071,
		"PD9_MACRO"=0.258961,
		"PD10_MACRO"=0.278315,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='D2' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'D2',
	0.0563580282,
	0.098121,
	0.127314,
	0.152447,
	0.175554,
	0.197485,
	0.218604,
	0.239071,
	0.258961,
	0.278315,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 15
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=3,
		"RANK_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='D3',
		"PD1_MACRO"=0.0852935259,
		"PD2_MACRO"=0.137763,
		"PD3_MACRO"=0.169054,
		"PD4_MACRO"=0.194105,
		"PD5_MACRO"=0.216434,
		"PD6_MACRO"=0.237385,
		"PD7_MACRO"=0.257483,
		"PD8_MACRO"=0.276937,
		"PD9_MACRO"=0.295838,
		"PD10_MACRO"=0.314228,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='D3' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'D3',
	0.0852935259,
	0.137763,
	0.169054,
	0.194105,
	0.216434,
	0.237385,
	0.257483,
	0.276937,
	0.295838,
	0.314228,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 16
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=3,
		"RANK_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='E',
		"PD1_MACRO"=0.1675244223,
		"PD2_MACRO"=0.244019,
		"PD3_MACRO"=0.278378,
		"PD4_MACRO"=0.302197,
		"PD5_MACRO"=0.322129,
		"PD6_MACRO"=0.340418,
		"PD7_MACRO"=0.35784,
		"PD8_MACRO"=0.374673,
		"PD9_MACRO"=0.391019,
		"PD10_MACRO"=0.406922,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='E' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'E',
	0.1675244223,
	0.244019,
	0.278378,
	0.302197,
	0.322129,
	0.340418,
	0.35784,
	0.374673,
	0.391019,
	0.406922,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 17
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=4,
		"RANK_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='A1',
		"PD1_MACRO"=0.0027728323,
		"PD2_MACRO"=0.018482,
		"PD3_MACRO"=0.039459,
		"PD4_MACRO"=0.06248,
		"PD5_MACRO"=0.086046,
		"PD6_MACRO"=0.109503,
		"PD7_MACRO"=0.13257,
		"PD8_MACRO"=0.155133,
		"PD9_MACRO"=0.17715,
		"PD10_MACRO"=0.198612,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='A1' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'A1',
	0.0027728323,
	0.018482,
	0.039459,
	0.06248,
	0.086046,
	0.109503,
	0.13257,
	0.155133,
	0.17715,
	0.198612,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 18
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=4,
		"RANK_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='A2',
		"PD1_MACRO"=0.0034004126,
		"PD2_MACRO"=0.019447,
		"PD3_MACRO"=0.040509,
		"PD4_MACRO"=0.063543,
		"PD5_MACRO"=0.087096,
		"PD6_MACRO"=0.110531,
		"PD7_MACRO"=0.133573,
		"PD8_MACRO"=0.15611,
		"PD9_MACRO"=0.178102,
		"PD10_MACRO"=0.199538,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='A2' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'A2',
	0.0034004126,
	0.019447,
	0.040509,
	0.063543,
	0.087096,
	0.110531,
	0.133573,
	0.15611,
	0.178102,
	0.199538,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 19
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=4,
		"RANK_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='A3',
		"PD1_MACRO"=0.005099678,
		"PD2_MACRO"=0.021932,
		"PD3_MACRO"=0.043215,
		"PD4_MACRO"=0.066285,
		"PD5_MACRO"=0.089806,
		"PD6_MACRO"=0.113183,
		"PD7_MACRO"=0.136159,
		"PD8_MACRO"=0.15863,
		"PD9_MACRO"=0.180556,
		"PD10_MACRO"=0.201929,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='A3' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'A3',
	0.005099678,
	0.021932,
	0.043215,
	0.066285,
	0.089806,
	0.113183,
	0.136159,
	0.15863,
	0.180556,
	0.201929,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 20
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=4,
		"RANK_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='B1',
		"PD1_MACRO"=0.0077567796,
		"PD2_MACRO"=0.025808,
		"PD3_MACRO"=0.047443,
		"PD4_MACRO"=0.070576,
		"PD5_MACRO"=0.094048,
		"PD6_MACRO"=0.117336,
		"PD7_MACRO"=0.140211,
		"PD8_MACRO"=0.162577,
		"PD9_MACRO"=0.184401,
		"PD10_MACRO"=0.205673,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='B1' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'B1',
	0.0077567796,
	0.025808,
	0.047443,
	0.070576,
	0.094048,
	0.117336,
	0.140211,
	0.162577,
	0.184401,
	0.205673,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 21
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=4,
		"RANK_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='B2',
		"PD1_MACRO"=0.0114714528,
		"PD2_MACRO"=0.031374,
		"PD3_MACRO"=0.053536,
		"PD4_MACRO"=0.076773,
		"PD5_MACRO"=0.100181,
		"PD6_MACRO"=0.123343,
		"PD7_MACRO"=0.146072,
		"PD8_MACRO"=0.168289,
		"PD9_MACRO"=0.189963,
		"PD10_MACRO"=0.21109,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='B2' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'B2',
	0.0114714528,
	0.031374,
	0.053536,
	0.076773,
	0.100181,
	0.123343,
	0.146072,
	0.168289,
	0.189963,
	0.21109,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 22
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=4,
		"RANK_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='B3',
		"PD1_MACRO"=0.0158889783,
		"PD2_MACRO"=0.037976,
		"PD3_MACRO"=0.060812,
		"PD4_MACRO"=0.0842,
		"PD5_MACRO"=0.107547,
		"PD6_MACRO"=0.130566,
		"PD7_MACRO"=0.153123,
		"PD8_MACRO"=0.175159,
		"PD9_MACRO"=0.196655,
		"PD10_MACRO"=0.217606,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='B3' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'B3',
	0.0158889783,
	0.037976,
	0.060812,
	0.0842,
	0.107547,
	0.130566,
	0.153123,
	0.175159,
	0.196655,
	0.217606,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 23
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=4,
		"RANK_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='C1',
		"PD1_MACRO"=0.0210244105,
		"PD2_MACRO"=0.045715,
		"PD3_MACRO"=0.069461,
		"PD4_MACRO"=0.093107,
		"PD5_MACRO"=0.116423,
		"PD6_MACRO"=0.139289,
		"PD7_MACRO"=0.161646,
		"PD8_MACRO"=0.183468,
		"PD9_MACRO"=0.204747,
		"PD10_MACRO"=0.225485,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='C1' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'C1',
	0.0210244105,
	0.045715,
	0.069461,
	0.093107,
	0.116423,
	0.139289,
	0.161646,
	0.183468,
	0.204747,
	0.225485,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 24
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=4,
		"RANK_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='C2',
		"PD1_MACRO"=0.0292074178,
		"PD2_MACRO"=0.058894,
		"PD3_MACRO"=0.084843,
		"PD4_MACRO"=0.109468,
		"PD5_MACRO"=0.133105,
		"PD6_MACRO"=0.155941,
		"PD7_MACRO"=0.178083,
		"PD8_MACRO"=0.199595,
		"PD9_MACRO"=0.220518,
		"PD10_MACRO"=0.24088,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='C2' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'C2',
	0.0292074178,
	0.058894,
	0.084843,
	0.109468,
	0.133105,
	0.155941,
	0.178083,
	0.199595,
	0.220518,
	0.24088,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 25
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=4,
		"RANK_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='C3',
		"PD1_MACRO"=0.0408312964,
		"PD2_MACRO"=0.076117,
		"PD3_MACRO"=0.103735,
		"PD4_MACRO"=0.12872,
		"PD5_MACRO"=0.152185,
		"PD6_MACRO"=0.174643,
		"PD7_MACRO"=0.196336,
		"PD8_MACRO"=0.21738,
		"PD9_MACRO"=0.237837,
		"PD10_MACRO"=0.257744,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='C3' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'C3',
	0.0408312964,
	0.076117,
	0.103735,
	0.12872,
	0.152185,
	0.174643,
	0.196336,
	0.21738,
	0.237837,
	0.257744,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 26
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=4,
		"RANK_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='D1',
		"PD1_MACRO"=0.0563580282,
		"PD2_MACRO"=0.098121,
		"PD3_MACRO"=0.127314,
		"PD4_MACRO"=0.152447,
		"PD5_MACRO"=0.175554,
		"PD6_MACRO"=0.197485,
		"PD7_MACRO"=0.218604,
		"PD8_MACRO"=0.239071,
		"PD9_MACRO"=0.258961,
		"PD10_MACRO"=0.278315,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='D1' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'D1',
	0.0563580282,
	0.098121,
	0.127314,
	0.152447,
	0.175554,
	0.197485,
	0.218604,
	0.239071,
	0.258961,
	0.278315,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 27
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=4,
		"RANK_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='D2',
		"PD1_MACRO"=0.0852935259,
		"PD2_MACRO"=0.137763,
		"PD3_MACRO"=0.169054,
		"PD4_MACRO"=0.194105,
		"PD5_MACRO"=0.216434,
		"PD6_MACRO"=0.237385,
		"PD7_MACRO"=0.257483,
		"PD8_MACRO"=0.276937,
		"PD9_MACRO"=0.295838,
		"PD10_MACRO"=0.314228,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='D2' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'D2',
	0.0852935259,
	0.137763,
	0.169054,
	0.194105,
	0.216434,
	0.237385,
	0.257483,
	0.276937,
	0.295838,
	0.314228,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 28
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=4,
		"RANK_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='D3',
		"PD1_MACRO"=0.1675244223,
		"PD2_MACRO"=0.244019,
		"PD3_MACRO"=0.278378,
		"PD4_MACRO"=0.302197,
		"PD5_MACRO"=0.322129,
		"PD6_MACRO"=0.340418,
		"PD7_MACRO"=0.35784,
		"PD8_MACRO"=0.374673,
		"PD9_MACRO"=0.391019,
		"PD10_MACRO"=0.406922,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='D3' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'D3',
	0.1675244223,
	0.244019,
	0.278378,
	0.302197,
	0.322129,
	0.340418,
	0.35784,
	0.374673,
	0.391019,
	0.406922,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 29
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=4,
		"RANK_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='E',
		"PD1_MACRO"=0.1675244223,
		"PD2_MACRO"=0.244019,
		"PD3_MACRO"=0.278378,
		"PD4_MACRO"=0.302197,
		"PD5_MACRO"=0.322129,
		"PD6_MACRO"=0.340418,
		"PD7_MACRO"=0.35784,
		"PD8_MACRO"=0.374673,
		"PD9_MACRO"=0.391019,
		"PD10_MACRO"=0.406922,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='E' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'E',
	0.1675244223,
	0.244019,
	0.278378,
	0.302197,
	0.322129,
	0.340418,
	0.35784,
	0.374673,
	0.391019,
	0.406922,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 30
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='AAA',
		"PD1_MACRO"=8.67802705398517E-05,
		"PD2_MACRO"=5.15060168113757E-04,
		"PD3_MACRO"=9.62750074672392E-04,
		"PD4_MACRO"=1.43737037387448E-03,
		"PD5_MACRO"=1.9410015343635E-03,
		"PD6_MACRO"=2.47576031513186E-03,
		"PD7_MACRO"=3.04382250711388E-03,
		"PD8_MACRO"=3.64744287381757E-03,
		"PD9_MACRO"=4.28897260617411E-03,
		"PD10_MACRO"=4.97087478198033E-03,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='AAA' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'AAA',
	8.67802705398517E-05,
	5.15060168113757E-04,
	9.62750074672392E-04,
	1.43737037387448E-03,
	1.9410015343635E-03,
	2.47576031513186E-03,
	3.04382250711388E-03,
	3.64744287381757E-03,
	4.28897260617411E-03,
	4.97087478198033E-03,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 31
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='AA+',
		"PD1_MACRO"=1.30561483310375E-04,
		"PD2_MACRO"=7.00400197410467E-04,
		"PD3_MACRO"=1.28184066105741E-03,
		"PD4_MACRO"=1.88433909867103E-03,
		"PD5_MACRO"=2.50906540509888E-03,
		"PD6_MACRO"=3.15713155446362E-03,
		"PD7_MACRO"=3.82961421749339E-03,
		"PD8_MACRO"=4.52757265230663E-03,
		"PD9_MACRO"=5.25206258189703E-03,
		"PD10_MACRO"=6.00414687583228E-03,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='AA+' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'AA+',
	1.30561483310375E-04,
	7.00400197410467E-04,
	1.28184066105741E-03,
	1.88433909867103E-03,
	2.50906540509888E-03,
	3.15713155446362E-03,
	3.82961421749339E-03,
	4.52757265230663E-03,
	5.25206258189703E-03,
	6.00414687583228E-03,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 32
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='AA',
		"PD1_MACRO"=1.96425992033226E-04,
		"PD2_MACRO"=9.54728068510713E-04,
		"PD3_MACRO"=1.70979560563866E-03,
		"PD4_MACRO"=2.47451676948651E-03,
		"PD5_MACRO"=3.24932073551687E-03,
		"PD6_MACRO"=4.03454745615173E-03,
		"PD7_MACRO"=4.83047252554147E-03,
		"PD8_MACRO"=5.63732589653387E-03,
		"PD9_MACRO"=6.45530563850982E-03,
		"PD10_MACRO"=7.28458789772823E-03,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='AA' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'AA',
	1.96425992033226E-04,
	9.54728068510713E-04,
	1.70979560563866E-03,
	2.47451676948651E-03,
	3.24932073551687E-03,
	4.03454745615173E-03,
	4.83047252554147E-03,
	5.63732589653387E-03,
	6.45530563850982E-03,
	7.28458789772823E-03,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 33
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='AA-',
		"PD1_MACRO"=2.95506811878466E-04,
		"PD2_MACRO"=1.30475844593547E-03,
		"PD3_MACRO"=2.28515574675159E-03,
		"PD4_MACRO"=3.25559191312175E-03,
		"PD5_MACRO"=4.21630733646405E-03,
		"PD6_MACRO"=5.16747906666415E-03,
		"PD7_MACRO"=6.10924161623017E-03,
		"PD8_MACRO"=7.04170179336705E-03,
		"PD9_MACRO"=7.96494897474642E-03,
		"PD10_MACRO"=8.87906205766054E-03,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='AA-' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'AA-',
	2.95506811878466E-04,
	1.30475844593547E-03,
	2.28515574675159E-03,
	3.25559191312175E-03,
	4.21630733646405E-03,
	5.16747906666415E-03,
	6.10924161623017E-03,
	7.04170179336705E-03,
	7.96494897474642E-03,
	8.87906205766054E-03,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 34
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='A+',
		"PD1_MACRO"=4.4454216981516E-04,
		"PD2_MACRO"=1.78799191082668E-03,
		"PD3_MACRO"=3.06070664095737E-03,
		"PD4_MACRO"=4.29188017087923E-03,
		"PD5_MACRO"=5.48275613310589E-03,
		"PD6_MACRO"=6.63455374568711E-03,
		"PD7_MACRO"=7.74846910042315E-03,
		"PD8_MACRO"=8.82567520749822E-03,
		"PD9_MACRO"=9.86732132973633E-03,
		"PD10_MACRO"=1.08745320081239E-02,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='A+' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'A+',
	4.4454216981516E-04,
	1.78799191082668E-03,
	3.06070664095737E-03,
	4.29188017087923E-03,
	5.48275613310589E-03,
	6.63455374568711E-03,
	7.74846910042315E-03,
	8.82567520749822E-03,
	9.86732132973633E-03,
	1.08745320081239E-02,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 35
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='A',
		"PD1_MACRO"=6.68688308768996E-04,
		"PD2_MACRO"=2.45723852259661E-03,
		"PD3_MACRO"=4.10897537727095E-03,
		"PD4_MACRO"=5.67040222759685E-03,
		"PD5_MACRO"=7.14598666222044E-03,
		"PD6_MACRO"=8.54010756774093E-03,
		"PD7_MACRO"=9.85701720507159E-03,
		"PD8_MACRO"=0.011100816370902,
		"PD9_MACRO"=1.22754393532087E-02,
		"PD10_MACRO"=1.33846460184425E-02,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='A' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'A',
	6.68688308768996E-04,
	2.45723852259661E-03,
	4.10897537727095E-03,
	5.67040222759685E-03,
	7.14598666222044E-03,
	8.54010756774093E-03,
	9.85701720507159E-03,
	0.011100816370902,
	1.22754393532087E-02,
	1.33846460184425E-02,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 36
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='A-',
		"PD1_MACRO"=1.0057320900221E-03,
		"PD2_MACRO"=3.38708742268901E-03,
		"PD3_MACRO"=5.52991608929077E-03,
		"PD4_MACRO"=7.50926243586458E-03,
		"PD5_MACRO"=9.33664394912914E-03,
		"PD6_MACRO"=1.10230789642868E-02,
		"PD7_MACRO"=1.25790018528558E-02,
		"PD8_MACRO"=1.40142215077612E-02,
		"PD9_MACRO"=1.53379096926496E-02,
		"PD10_MACRO"=1.65586091377781E-02,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='A-' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'A-',
	1.0057320900221E-03,
	3.38708742268901E-03,
	5.52991608929077E-03,
	7.50926243586458E-03,
	9.33664394912914E-03,
	1.10230789642868E-02,
	1.25790018528558E-02,
	1.40142215077612E-02,
	1.53379096926496E-02,
	1.65586091377781E-02,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 37
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='BBB+',
		"PD1_MACRO"=1.5123852139138E-03,
		"PD2_MACRO"=4.68315734888847E-03,
		"PD3_MACRO"=7.46165288533174E-03,
		"PD4_MACRO"=9.96919418703834E-03,
		"PD5_MACRO"=1.22306241587553E-02,
		"PD6_MACRO"=1.42690738644536E-02,
		"PD7_MACRO"=1.61058732618269E-02,
		"PD8_MACRO"=1.77605553755644E-02,
		"PD9_MACRO"=1.92509189180308E-02,
		"PD10_MACRO"=2.05931246101996E-02,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='BBB+' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'BBB+',
	1.5123852139138E-03,
	4.68315734888847E-03,
	7.46165288533174E-03,
	9.96919418703834E-03,
	1.22306241587553E-02,
	1.42690738644536E-02,
	1.61058732618269E-02,
	1.77605553755644E-02,
	1.92509189180308E-02,
	2.05931246101996E-02,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 38
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='BBB',
		"PD1_MACRO"=2.27365527363635E-03,
		"PD2_MACRO"=6.49529640579727E-03,
		"PD3_MACRO"=1.00954614254233E-02,
		"PD4_MACRO"=1.32694256494037E-02,
		"PD5_MACRO"=1.60653043116707E-02,
		"PD6_MACRO"=1.85266821183403E-02,
		"PD7_MACRO"=2.06926898651919E-02,
		"PD8_MACRO"=2.25982374545073E-02,
		"PD9_MACRO"=0.024274329531463,
		"PD10_MACRO"=2.57484151608228E-02,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='BBB' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'BBB',
	2.27365527363635E-03,
	6.49529640579727E-03,
	1.00954614254233E-02,
	1.32694256494037E-02,
	1.60653043116707E-02,
	1.85266821183403E-02,
	2.06926898651919E-02,
	2.25982374545073E-02,
	0.024274329531463,
	2.57484151608228E-02,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 39
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='BBB-',
		"PD1_MACRO"=3.41672240172264E-03,
		"PD2_MACRO"=9.03632921006658E-03,
		"PD3_MACRO"=1.36965482433694E-02,
		"PD4_MACRO"=1.77093481824989E-02,
		"PD5_MACRO"=2.11614814574409E-02,
		"PD6_MACRO"=2.41293877675384E-02,
		"PD7_MACRO"=2.66798820739538E-02,
		"PD8_MACRO"=2.88710369107004E-02,
		"PD9_MACRO"=0.03075312689879,
		"PD10_MACRO"=3.23695564391162E-02,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='BBB-' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'BBB-',
	3.41672240172264E-03,
	9.03632921006658E-03,
	1.36965482433694E-02,
	1.77093481824989E-02,
	2.11614814574409E-02,
	2.41293877675384E-02,
	2.66798820739538E-02,
	2.88710369107004E-02,
	0.03075312689879,
	3.23695564391162E-02,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 40
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='BB+',
		"PD1_MACRO"=5.13131833198793E-03,
		"PD2_MACRO"=1.26084537265433E-02,
		"PD3_MACRO"=0.018632580405272,
		"PD4_MACRO"=2.36977714820619E-02,
		"PD5_MACRO"=2.79526618702916E-02,
		"PD6_MACRO"=3.15246063755436E-02,
		"PD7_MACRO"=3.45219649810081E-02,
		"PD8_MACRO"=3.70364871703759E-02,
		"PD9_MACRO"=3.91455979615751E-02,
		"PD10_MACRO"=0.040914485612855,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='BB+' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'BB+',
	5.13131833198793E-03,
	1.26084537265433E-02,
	0.018632580405272,
	2.36977714820619E-02,
	2.79526618702916E-02,
	3.15246063755436E-02,
	3.45219649810081E-02,
	3.70364871703759E-02,
	3.91455979615751E-02,
	0.040914485612855,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 41
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='BB',
		"PD1_MACRO"=7.69927453745326E-03,
		"PD2_MACRO"=1.76398638720685E-02,
		"PD3_MACRO"=2.54121740847824E-02,
		"PD4_MACRO"=3.17916416722737E-02,
		"PD5_MACRO"=3.70233218729105E-02,
		"PD6_MACRO"=4.13112933512536E-02,
		"PD7_MACRO"=4.48245276846299E-02,
		"PD8_MACRO"=4.77023754803805E-02,
		"PD9_MACRO"=5.00594540983732E-02,
		"PD10_MACRO"=5.19898729882567E-02,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='BB' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'BB',
	7.69927453745326E-03,
	1.76398638720685E-02,
	2.54121740847824E-02,
	3.17916416722737E-02,
	3.70233218729105E-02,
	4.13112933512536E-02,
	4.48245276846299E-02,
	4.77023754803805E-02,
	5.00594540983732E-02,
	5.19898729882567E-02,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 42
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='BB-',
		"PD1_MACRO"=1.15365148475835E-02,
		"PD2_MACRO"=2.47343186377738E-02,
		"PD3_MACRO"=3.47352916612621E-02,
		"PD4_MACRO"=4.27455597712528E-02,
		"PD5_MACRO"=4.91570453642632E-02,
		"PD6_MACRO"=5.42867447766704E-02,
		"PD7_MACRO"=5.83899448433806E-02,
		"PD8_MACRO"=6.16716490830319E-02,
		"PD9_MACRO"=6.42961811236726E-02,
		"PD10_MACRO"=6.63951082680869E-02,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='BB-' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'BB-',
	1.15365148475835E-02,
	2.47343186377738E-02,
	3.47352916612621E-02,
	4.27455597712528E-02,
	4.91570453642632E-02,
	5.42867447766704E-02,
	5.83899448433806E-02,
	6.16716490830319E-02,
	6.42961811236726E-02,
	6.63951082680869E-02,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 43
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='B+',
		"PD1_MACRO"=1.72508440225062E-02,
		"PD2_MACRO"=3.47354838266694E-02,
		"PD3_MACRO"=4.75558966273404E-02,
		"PD4_MACRO"=5.75713861708678E-02,
		"PD5_MACRO"=6.53931249449219E-02,
		"PD6_MACRO"=7.15007471340759E-02,
		"PD7_MACRO"=7.62697154478051E-02,
		"PD8_MACRO"=0.079993503663594,
		"PD9_MACRO"=8.29013093683337E-02,
		"PD10_MACRO"=8.51720594024183E-02,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='B+' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'B+',
	1.72508440225062E-02,
	3.47354838266694E-02,
	4.75558966273404E-02,
	5.75713861708678E-02,
	6.53931249449219E-02,
	7.15007471340759E-02,
	7.62697154478051E-02,
	0.079993503663594,
	8.29013093683337E-02,
	8.51720594024183E-02,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 44
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='B',
		"PD1_MACRO"=2.57173016050651E-02,
		"PD2_MACRO"=4.88044363646155E-02,
		"PD3_MACRO"=0.065152634924424,
		"PD4_MACRO"=0.077601969549868,
		"PD5_MACRO"=8.70846108440644E-02,
		"PD6_MACRO"=9.43094569893481E-02,
		"PD7_MACRO"=9.98154853178147E-02,
		"PD8_MACRO"=0.10401254829828,
		"PD9_MACRO"=0.107212425277552,
		"PD10_MACRO"=0.10965239909108,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='B' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'B',
	2.57173016050651E-02,
	4.88044363646155E-02,
	0.065152634924424,
	0.077601969549868,
	8.70846108440644E-02,
	9.43094569893481E-02,
	9.98154853178147E-02,
	0.10401254829828,
	0.107212425277552,
	0.10965239909108,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 45
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='B-',
		"PD1_MACRO"=0.038167267888062,
		"PD2_MACRO"=6.84999243057122E-02,
		"PD3_MACRO"=8.91928692147446E-02,
		"PD4_MACRO"=0.104541765910045,
		"PD5_MACRO"=0.115939155885008,
		"PD6_MACRO"=0.124409633698912,
		"PD7_MACRO"=0.130709041376793,
		"PD8_MACRO"=0.13539620565824,
		"PD9_MACRO"=0.138885054113516,
		"PD10_MACRO"=0.141482642394616,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='B-' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'B-',
	0.038167267888062,
	6.84999243057122E-02,
	8.91928692147446E-02,
	0.104541765910045,
	0.115939155885008,
	0.124409633698912,
	0.130709041376793,
	0.13539620565824,
	0.138885054113516,
	0.141482642394616,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 46
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='CCC+',
		"PD1_MACRO"=0.14856811,
		"PD2_MACRO"=0.190165515668443,
		"PD3_MACRO"=0.213383557195259,
		"PD4_MACRO"=0.230142485282783,
		"PD5_MACRO"=0.242266987569538,
		"PD6_MACRO"=0.251053487341993,
		"PD7_MACRO"=0.257428782753918,
		"PD8_MACRO"=0.262058605777845,
		"PD9_MACRO"=0.26542290175609,
		"PD10_MACRO"=0.267868617182814,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='CCC+' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'CCC+',
	0.14856811,
	0.190165515668443,
	0.213383557195259,
	0.230142485282783,
	0.242266987569538,
	0.251053487341993,
	0.257428782753918,
	0.262058605777845,
	0.26542290175609,
	0.267868617182814,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 47
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='CCC',
		"PD1_MACRO"=0.14856811,
		"PD2_MACRO"=0.190165515668443,
		"PD3_MACRO"=0.213383557195259,
		"PD4_MACRO"=0.230142485282783,
		"PD5_MACRO"=0.242266987569538,
		"PD6_MACRO"=0.251053487341993,
		"PD7_MACRO"=0.257428782753918,
		"PD8_MACRO"=0.262058605777845,
		"PD9_MACRO"=0.26542290175609,
		"PD10_MACRO"=0.267868617182814,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='CCC' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'CCC',
	0.14856811,
	0.190165515668443,
	0.213383557195259,
	0.230142485282783,
	0.242266987569538,
	0.251053487341993,
	0.257428782753918,
	0.262058605777845,
	0.26542290175609,
	0.267868617182814,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 48
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='CCC-',
		"PD1_MACRO"=0.14856811,
		"PD2_MACRO"=0.190165515668443,
		"PD3_MACRO"=0.213383557195259,
		"PD4_MACRO"=0.230142485282783,
		"PD5_MACRO"=0.242266987569538,
		"PD6_MACRO"=0.251053487341993,
		"PD7_MACRO"=0.257428782753918,
		"PD8_MACRO"=0.262058605777845,
		"PD9_MACRO"=0.26542290175609,
		"PD10_MACRO"=0.267868617182814,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='CCC-' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'CCC-',
	0.14856811,
	0.190165515668443,
	0.213383557195259,
	0.230142485282783,
	0.242266987569538,
	0.251053487341993,
	0.257428782753918,
	0.262058605777845,
	0.26542290175609,
	0.267868617182814,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 49
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='CC',
		"PD1_MACRO"=0.14856811,
		"PD2_MACRO"=0.190165515668443,
		"PD3_MACRO"=0.213383557195259,
		"PD4_MACRO"=0.230142485282783,
		"PD5_MACRO"=0.242266987569538,
		"PD6_MACRO"=0.251053487341993,
		"PD7_MACRO"=0.257428782753918,
		"PD8_MACRO"=0.262058605777845,
		"PD9_MACRO"=0.26542290175609,
		"PD10_MACRO"=0.267868617182814,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='CC' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'CC',
	0.14856811,
	0.190165515668443,
	0.213383557195259,
	0.230142485282783,
	0.242266987569538,
	0.251053487341993,
	0.257428782753918,
	0.262058605777845,
	0.26542290175609,
	0.267868617182814,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 50
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='C',
		"PD1_MACRO"=0.14856811,
		"PD2_MACRO"=0.190165515668443,
		"PD3_MACRO"=0.213383557195259,
		"PD4_MACRO"=0.230142485282783,
		"PD5_MACRO"=0.242266987569538,
		"PD6_MACRO"=0.251053487341993,
		"PD7_MACRO"=0.257428782753918,
		"PD8_MACRO"=0.262058605777845,
		"PD9_MACRO"=0.26542290175609,
		"PD10_MACRO"=0.267868617182814,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='C' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'C',
	0.14856811,
	0.190165515668443,
	0.213383557195259,
	0.230142485282783,
	0.242266987569538,
	0.251053487341993,
	0.257428782753918,
	0.262058605777845,
	0.26542290175609,
	0.267868617182814,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 51
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='D',
		"PD1_MACRO"=1,
		"PD2_MACRO"=1,
		"PD3_MACRO"=1,
		"PD4_MACRO"=1,
		"PD5_MACRO"=1,
		"PD6_MACRO"=1,
		"PD7_MACRO"=1,
		"PD8_MACRO"=1,
		"PD9_MACRO"=1,
		"PD10_MACRO"=1,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='D' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'D',
	1,
	1,
	1,
	1,
	1,
	1,
	1,
	1,
	1,
	1,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 52
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=5,
		"RANK_MODEL"='Нет рейтинга',
		"RAT_ON_DATE"=NULL,
		"PD1_MACRO"=0.1675244223,
		"PD2_MACRO"=0.244019,
		"PD3_MACRO"=0.278378,
		"PD4_MACRO"=0.302197,
		"PD5_MACRO"=0.322129,
		"PD6_MACRO"=0.340418,
		"PD7_MACRO"=0.35784,
		"PD8_MACRO"=0.374673,
		"PD9_MACRO"=0.391019,
		"PD10_MACRO"=0.406922,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Нет рейтинга' AND 
		"RAT_ON_DATE" is NULL AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	5,
	'Нет рейтинга',
	NULL,
	0.1675244223,
	0.244019,
	0.278378,
	0.302197,
	0.322129,
	0.340418,
	0.35784,
	0.374673,
	0.391019,
	0.406922,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 53
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=5,
		"RANK_MODEL"='Нет рейтинга',
		"RAT_ON_DATE"='No rating',
		"PD1_MACRO"=0.1675244223,
		"PD2_MACRO"=0.244019,
		"PD3_MACRO"=0.278378,
		"PD4_MACRO"=0.302197,
		"PD5_MACRO"=0.322129,
		"PD6_MACRO"=0.340418,
		"PD7_MACRO"=0.35784,
		"PD8_MACRO"=0.374673,
		"PD9_MACRO"=0.391019,
		"PD10_MACRO"=0.406922,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Нет рейтинга' AND 
		"RAT_ON_DATE"='No rating' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	5,
	'Нет рейтинга',
	'No rating',
	0.1675244223,
	0.244019,
	0.278378,
	0.302197,
	0.322129,
	0.340418,
	0.35784,
	0.374673,
	0.391019,
	0.406922,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 54
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=6,
		"RANK_MODEL"='Лизинговые',
		"RAT_ON_DATE"='A1',
		"PD1_MACRO"=0.0018686274,
		"PD2_MACRO"=0.017242,
		"PD3_MACRO"=0.038112,
		"PD4_MACRO"=0.061115,
		"PD5_MACRO"=0.084698,
		"PD6_MACRO"=0.108183,
		"PD7_MACRO"=0.131283,
		"PD8_MACRO"=0.153879,
		"PD9_MACRO"=0.175929,
		"PD10_MACRO"=0.197423,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='A1' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'A1',
	0.0018686274,
	0.017242,
	0.038112,
	0.061115,
	0.084698,
	0.108183,
	0.131283,
	0.153879,
	0.175929,
	0.197423,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 55
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=6,
		"RANK_MODEL"='Лизинговые',
		"RAT_ON_DATE"='A2',
		"PD1_MACRO"=0.0027728323,
		"PD2_MACRO"=0.018482,
		"PD3_MACRO"=0.039459,
		"PD4_MACRO"=0.06248,
		"PD5_MACRO"=0.086046,
		"PD6_MACRO"=0.109503,
		"PD7_MACRO"=0.13257,
		"PD8_MACRO"=0.155133,
		"PD9_MACRO"=0.17715,
		"PD10_MACRO"=0.198612,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='A2' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'A2',
	0.0027728323,
	0.018482,
	0.039459,
	0.06248,
	0.086046,
	0.109503,
	0.13257,
	0.155133,
	0.17715,
	0.198612,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 56
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=6,
		"RANK_MODEL"='Лизинговые',
		"RAT_ON_DATE"='A3',
		"PD1_MACRO"=0.0034004126,
		"PD2_MACRO"=0.019447,
		"PD3_MACRO"=0.040509,
		"PD4_MACRO"=0.063543,
		"PD5_MACRO"=0.087096,
		"PD6_MACRO"=0.110531,
		"PD7_MACRO"=0.133573,
		"PD8_MACRO"=0.15611,
		"PD9_MACRO"=0.178102,
		"PD10_MACRO"=0.199538,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='A3' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'A3',
	0.0034004126,
	0.019447,
	0.040509,
	0.063543,
	0.087096,
	0.110531,
	0.133573,
	0.15611,
	0.178102,
	0.199538,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 57
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=6,
		"RANK_MODEL"='Лизинговые',
		"RAT_ON_DATE"='B1',
		"PD1_MACRO"=0.005099678,
		"PD2_MACRO"=0.021932,
		"PD3_MACRO"=0.043215,
		"PD4_MACRO"=0.066285,
		"PD5_MACRO"=0.089806,
		"PD6_MACRO"=0.113183,
		"PD7_MACRO"=0.136159,
		"PD8_MACRO"=0.15863,
		"PD9_MACRO"=0.180556,
		"PD10_MACRO"=0.201929,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='B1' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'B1',
	0.005099678,
	0.021932,
	0.043215,
	0.066285,
	0.089806,
	0.113183,
	0.136159,
	0.15863,
	0.180556,
	0.201929,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 58
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=6,
		"RANK_MODEL"='Лизинговые',
		"RAT_ON_DATE"='B2',
		"PD1_MACRO"=0.0077567796,
		"PD2_MACRO"=0.025808,
		"PD3_MACRO"=0.047443,
		"PD4_MACRO"=0.070576,
		"PD5_MACRO"=0.094048,
		"PD6_MACRO"=0.117336,
		"PD7_MACRO"=0.140211,
		"PD8_MACRO"=0.162577,
		"PD9_MACRO"=0.184401,
		"PD10_MACRO"=0.205673,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='B2' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'B2',
	0.0077567796,
	0.025808,
	0.047443,
	0.070576,
	0.094048,
	0.117336,
	0.140211,
	0.162577,
	0.184401,
	0.205673,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 59
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=6,
		"RANK_MODEL"='Лизинговые',
		"RAT_ON_DATE"='B3',
		"PD1_MACRO"=0.0114714528,
		"PD2_MACRO"=0.031374,
		"PD3_MACRO"=0.053536,
		"PD4_MACRO"=0.076773,
		"PD5_MACRO"=0.100181,
		"PD6_MACRO"=0.123343,
		"PD7_MACRO"=0.146072,
		"PD8_MACRO"=0.168289,
		"PD9_MACRO"=0.189963,
		"PD10_MACRO"=0.21109,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='B3' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'B3',
	0.0114714528,
	0.031374,
	0.053536,
	0.076773,
	0.100181,
	0.123343,
	0.146072,
	0.168289,
	0.189963,
	0.21109,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 60
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=6,
		"RANK_MODEL"='Лизинговые',
		"RAT_ON_DATE"='C1',
		"PD1_MACRO"=0.0158889783,
		"PD2_MACRO"=0.037976,
		"PD3_MACRO"=0.060812,
		"PD4_MACRO"=0.0842,
		"PD5_MACRO"=0.107547,
		"PD6_MACRO"=0.130566,
		"PD7_MACRO"=0.153123,
		"PD8_MACRO"=0.175159,
		"PD9_MACRO"=0.196655,
		"PD10_MACRO"=0.217606,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='C1' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'C1',
	0.0158889783,
	0.037976,
	0.060812,
	0.0842,
	0.107547,
	0.130566,
	0.153123,
	0.175159,
	0.196655,
	0.217606,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 61
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=6,
		"RANK_MODEL"='Лизинговые',
		"RAT_ON_DATE"='C2',
		"PD1_MACRO"=0.0210244105,
		"PD2_MACRO"=0.045715,
		"PD3_MACRO"=0.069461,
		"PD4_MACRO"=0.093107,
		"PD5_MACRO"=0.116423,
		"PD6_MACRO"=0.139289,
		"PD7_MACRO"=0.161646,
		"PD8_MACRO"=0.183468,
		"PD9_MACRO"=0.204747,
		"PD10_MACRO"=0.225485,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='C2' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'C2',
	0.0210244105,
	0.045715,
	0.069461,
	0.093107,
	0.116423,
	0.139289,
	0.161646,
	0.183468,
	0.204747,
	0.225485,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 62
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=6,
		"RANK_MODEL"='Лизинговые',
		"RAT_ON_DATE"='C3',
		"PD1_MACRO"=0.0292074178,
		"PD2_MACRO"=0.058894,
		"PD3_MACRO"=0.084843,
		"PD4_MACRO"=0.109468,
		"PD5_MACRO"=0.133105,
		"PD6_MACRO"=0.155941,
		"PD7_MACRO"=0.178083,
		"PD8_MACRO"=0.199595,
		"PD9_MACRO"=0.220518,
		"PD10_MACRO"=0.24088,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='C3' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'C3',
	0.0292074178,
	0.058894,
	0.084843,
	0.109468,
	0.133105,
	0.155941,
	0.178083,
	0.199595,
	0.220518,
	0.24088,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 63
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=6,
		"RANK_MODEL"='Лизинговые',
		"RAT_ON_DATE"='D1',
		"PD1_MACRO"=0.0408312964,
		"PD2_MACRO"=0.076117,
		"PD3_MACRO"=0.103735,
		"PD4_MACRO"=0.12872,
		"PD5_MACRO"=0.152185,
		"PD6_MACRO"=0.174643,
		"PD7_MACRO"=0.196336,
		"PD8_MACRO"=0.21738,
		"PD9_MACRO"=0.237837,
		"PD10_MACRO"=0.257744,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='D1' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'D1',
	0.0408312964,
	0.076117,
	0.103735,
	0.12872,
	0.152185,
	0.174643,
	0.196336,
	0.21738,
	0.237837,
	0.257744,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 64
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=6,
		"RANK_MODEL"='Лизинговые',
		"RAT_ON_DATE"='D2',
		"PD1_MACRO"=0.0563580282,
		"PD2_MACRO"=0.098121,
		"PD3_MACRO"=0.127314,
		"PD4_MACRO"=0.152447,
		"PD5_MACRO"=0.175554,
		"PD6_MACRO"=0.197485,
		"PD7_MACRO"=0.218604,
		"PD8_MACRO"=0.239071,
		"PD9_MACRO"=0.258961,
		"PD10_MACRO"=0.278315,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='D2' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'D2',
	0.0563580282,
	0.098121,
	0.127314,
	0.152447,
	0.175554,
	0.197485,
	0.218604,
	0.239071,
	0.258961,
	0.278315,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 65
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=6,
		"RANK_MODEL"='Лизинговые',
		"RAT_ON_DATE"='D3',
		"PD1_MACRO"=0.0852935259,
		"PD2_MACRO"=0.137763,
		"PD3_MACRO"=0.169054,
		"PD4_MACRO"=0.194105,
		"PD5_MACRO"=0.216434,
		"PD6_MACRO"=0.237385,
		"PD7_MACRO"=0.257483,
		"PD8_MACRO"=0.276937,
		"PD9_MACRO"=0.295838,
		"PD10_MACRO"=0.314228,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='D3' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'D3',
	0.0852935259,
	0.137763,
	0.169054,
	0.194105,
	0.216434,
	0.237385,
	0.257483,
	0.276937,
	0.295838,
	0.314228,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 66
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=6,
		"RANK_MODEL"='Лизинговые',
		"RAT_ON_DATE"='E',
		"PD1_MACRO"=0.1675244223,
		"PD2_MACRO"=0.244019,
		"PD3_MACRO"=0.278378,
		"PD4_MACRO"=0.302197,
		"PD5_MACRO"=0.322129,
		"PD6_MACRO"=0.340418,
		"PD7_MACRO"=0.35784,
		"PD8_MACRO"=0.374673,
		"PD9_MACRO"=0.391019,
		"PD10_MACRO"=0.406922,
		"ST_DATE"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='E' AND 
		"END_DATE"=to_date('2020-09-30','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'E',
	0.1675244223,
	0.244019,
	0.278378,
	0.302197,
	0.322129,
	0.340418,
	0.35784,
	0.374673,
	0.391019,
	0.406922,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2020-09-30','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 67
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=3,
		"RANK_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='A1',
		"PD1_MACRO"=2.41218330802713E-03,
		"PD2_MACRO"=0.018811,
		"PD3_MACRO"=0.040584,
		"PD4_MACRO"=0.064471,
		"PD5_MACRO"=0.0889,
		"PD6_MACRO"=0.113187,
		"PD7_MACRO"=0.137043,
		"PD8_MACRO"=0.160352,
		"PD9_MACRO"=0.183073,
		"PD10_MACRO"=0.205197,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='A1' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'A1',
	2.41218330802713E-03,
	0.018811,
	0.040584,
	0.064471,
	0.0889,
	0.113187,
	0.137043,
	0.160352,
	0.183073,
	0.205197,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 68
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=3,
		"RANK_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='A2',
		"PD1_MACRO"=3.41883831146096E-03,
		"PD2_MACRO"=0.020325,
		"PD3_MACRO"=0.042228,
		"PD4_MACRO"=0.066134,
		"PD5_MACRO"=0.09054,
		"PD6_MACRO"=0.11479,
		"PD7_MACRO"=0.138605,
		"PD8_MACRO"=0.161873,
		"PD9_MACRO"=0.184553,
		"PD10_MACRO"=0.206637,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='A2' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'A2',
	3.41883831146096E-03,
	0.020325,
	0.042228,
	0.066134,
	0.09054,
	0.11479,
	0.138605,
	0.161873,
	0.184553,
	0.206637,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 69
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=3,
		"RANK_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='A3',
		"PD1_MACRO"=4.05895413017003E-03,
		"PD2_MACRO"=0.021289,
		"PD3_MACRO"=0.043275,
		"PD4_MACRO"=0.067194,
		"PD5_MACRO"=0.091586,
		"PD6_MACRO"=0.115813,
		"PD7_MACRO"=0.139602,
		"PD8_MACRO"=0.162843,
		"PD9_MACRO"=0.185496,
		"PD10_MACRO"=0.207554,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='A3' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'A3',
	4.05895413017003E-03,
	0.021289,
	0.043275,
	0.067194,
	0.091586,
	0.115813,
	0.139602,
	0.162843,
	0.185496,
	0.207554,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 70
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=3,
		"RANK_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='B1',
		"PD1_MACRO"=5.95866216581157E-03,
		"PD2_MACRO"=0.024185,
		"PD3_MACRO"=0.046425,
		"PD4_MACRO"=0.070384,
		"PD5_MACRO"=0.094734,
		"PD6_MACRO"=0.118891,
		"PD7_MACRO"=0.142602,
		"PD8_MACRO"=0.165762,
		"PD9_MACRO"=0.188337,
		"PD10_MACRO"=0.210318,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='B1' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'B1',
	5.95866216581157E-03,
	0.024185,
	0.046425,
	0.070384,
	0.094734,
	0.118891,
	0.142602,
	0.165762,
	0.188337,
	0.210318,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 71
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=3,
		"RANK_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='B2',
		"PD1_MACRO"=8.93885130215019E-03,
		"PD2_MACRO"=0.028613,
		"PD3_MACRO"=0.051252,
		"PD4_MACRO"=0.075278,
		"PD5_MACRO"=0.099569,
		"PD6_MACRO"=0.12362,
		"PD7_MACRO"=0.14721,
		"PD8_MACRO"=0.170247,
		"PD9_MACRO"=0.1927,
		"PD10_MACRO"=0.214563,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='B2' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'B2',
	8.93885130215019E-03,
	0.028613,
	0.051252,
	0.075278,
	0.099569,
	0.12362,
	0.14721,
	0.170247,
	0.1927,
	0.214563,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 72
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=3,
		"RANK_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='B3',
		"PD1_MACRO"=1.28067571971378E-02,
		"PD2_MACRO"=0.034598,
		"PD3_MACRO"=0.057804,
		"PD4_MACRO"=0.081938,
		"PD5_MACRO"=0.106155,
		"PD6_MACRO"=0.130066,
		"PD7_MACRO"=0.153493,
		"PD8_MACRO"=0.176364,
		"PD9_MACRO"=0.198651,
		"PD10_MACRO"=0.220352,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='B3' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'B3',
	1.28067571971378E-02,
	0.034598,
	0.057804,
	0.081938,
	0.106155,
	0.130066,
	0.153493,
	0.176364,
	0.198651,
	0.220352,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 73
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=3,
		"RANK_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='C1',
		"PD1_MACRO"=1.75470861519781E-02,
		"PD2_MACRO"=0.04192,
		"PD3_MACRO"=0.065884,
		"PD4_MACRO"=0.09019,
		"PD5_MACRO"=0.114338,
		"PD6_MACRO"=0.138083,
		"PD7_MACRO"=0.161312,
		"PD8_MACRO"=0.183976,
		"PD9_MACRO"=0.206057,
		"PD10_MACRO"=0.227557,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='C1' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'C1',
	1.75470861519781E-02,
	0.04192,
	0.065884,
	0.09019,
	0.114338,
	0.138083,
	0.161312,
	0.183976,
	0.206057,
	0.227557,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 74
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=3,
		"RANK_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='C2',
		"PD1_MACRO"=2.25092411206509E-02,
		"PD2_MACRO"=0.049728,
		"PD3_MACRO"=0.07466,
		"PD4_MACRO"=0.099259,
		"PD5_MACRO"=0.12339,
		"PD6_MACRO"=0.146983,
		"PD7_MACRO"=0.170005,
		"PD8_MACRO"=0.192442,
		"PD9_MACRO"=0.214295,
		"PD10_MACRO"=0.235569,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='C2' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'C2',
	2.25092411206509E-02,
	0.049728,
	0.07466,
	0.099259,
	0.12339,
	0.146983,
	0.170005,
	0.192442,
	0.214295,
	0.235569,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 75
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=3,
		"RANK_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='C3',
		"PD1_MACRO"=3.02791324830112E-02,
		"PD2_MACRO"=0.062688,
		"PD3_MACRO"=0.089736,
		"PD4_MACRO"=0.115256,
		"PD5_MACRO"=0.139673,
		"PD6_MACRO"=0.163216,
		"PD7_MACRO"=0.186011,
		"PD8_MACRO"=0.208131,
		"PD9_MACRO"=0.229623,
		"PD10_MACRO"=0.250516,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='C3' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'C3',
	3.02791324830112E-02,
	0.062688,
	0.089736,
	0.115256,
	0.139673,
	0.163216,
	0.186011,
	0.208131,
	0.229623,
	0.250516,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 76
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=3,
		"RANK_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='D1',
		"PD1_MACRO"=4.22563014030519E-02,
		"PD2_MACRO"=0.080879,
		"PD3_MACRO"=0.109587,
		"PD4_MACRO"=0.135416,
		"PD5_MACRO"=0.159608,
		"PD6_MACRO"=0.182724,
		"PD7_MACRO"=0.205026,
		"PD8_MACRO"=0.226638,
		"PD9_MACRO"=0.247628,
		"PD10_MACRO"=0.268031,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='D1' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'D1',
	4.22563014030519E-02,
	0.080879,
	0.109587,
	0.135416,
	0.159608,
	0.182724,
	0.205026,
	0.226638,
	0.247628,
	0.268031,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 77
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=3,
		"RANK_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='D2',
		"PD1_MACRO"=5.54173275352711E-02,
		"PD2_MACRO"=0.10002,
		"PD3_MACRO"=0.130051,
		"PD4_MACRO"=0.155976,
		"PD5_MACRO"=0.17983,
		"PD6_MACRO"=0.202467,
		"PD7_MACRO"=0.224252,
		"PD8_MACRO"=0.245347,
		"PD9_MACRO"=0.265829,
		"PD10_MACRO"=0.285737,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='D2' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'D2',
	5.54173275352711E-02,
	0.10002,
	0.130051,
	0.155976,
	0.17983,
	0.202467,
	0.224252,
	0.245347,
	0.265829,
	0.285737,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 78
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=3,
		"RANK_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='D3',
		"PD1_MACRO"=8.03457967153691E-02,
		"PD2_MACRO"=0.135318,
		"PD3_MACRO"=0.167212,
		"PD4_MACRO"=0.193039,
		"PD5_MACRO"=0.21617,
		"PD6_MACRO"=0.237903,
		"PD7_MACRO"=0.258746,
		"PD8_MACRO"=0.278908,
		"PD9_MACRO"=0.298479,
		"PD10_MACRO"=0.317501,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='D3' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'D3',
	8.03457967153691E-02,
	0.135318,
	0.167212,
	0.193039,
	0.21617,
	0.237903,
	0.258746,
	0.278908,
	0.298479,
	0.317501,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 79
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=3,
		"RANK_MODEL"='Крупные (корпоративные)',
		"RAT_ON_DATE"='E',
		"PD1_MACRO"=0.151180979318036,
		"PD2_MACRO"=0.230649,
		"PD3_MACRO"=0.265435,
		"PD4_MACRO"=0.290143,
		"PD5_MACRO"=0.311054,
		"PD6_MACRO"=0.330311,
		"PD7_MACRO"=0.348666,
		"PD8_MACRO"=0.366389,
		"PD9_MACRO"=0.383585,
		"PD10_MACRO"=0.400299,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Крупные (корпоративные)' AND 
		"RAT_ON_DATE"='E' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	3,
	'Крупные (корпоративные)',
	'E',
	0.151180979318036,
	0.230649,
	0.265435,
	0.290143,
	0.311054,
	0.330311,
	0.348666,
	0.366389,
	0.383585,
	0.400299,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 80
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=4,
		"RANK_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='A1',
		"PD1_MACRO"=3.41883831146096E-03,
		"PD2_MACRO"=0.020325,
		"PD3_MACRO"=0.042228,
		"PD4_MACRO"=0.066134,
		"PD5_MACRO"=0.09054,
		"PD6_MACRO"=0.11479,
		"PD7_MACRO"=0.138605,
		"PD8_MACRO"=0.161873,
		"PD9_MACRO"=0.184553,
		"PD10_MACRO"=0.206637,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='A1' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'A1',
	3.41883831146096E-03,
	0.020325,
	0.042228,
	0.066134,
	0.09054,
	0.11479,
	0.138605,
	0.161873,
	0.184553,
	0.206637,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 81
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=4,
		"RANK_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='A2',
		"PD1_MACRO"=4.05895413017003E-03,
		"PD2_MACRO"=0.021289,
		"PD3_MACRO"=0.043275,
		"PD4_MACRO"=0.067194,
		"PD5_MACRO"=0.091586,
		"PD6_MACRO"=0.115813,
		"PD7_MACRO"=0.139602,
		"PD8_MACRO"=0.162843,
		"PD9_MACRO"=0.185496,
		"PD10_MACRO"=0.207554,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='A2' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'A2',
	4.05895413017003E-03,
	0.021289,
	0.043275,
	0.067194,
	0.091586,
	0.115813,
	0.139602,
	0.162843,
	0.185496,
	0.207554,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 82
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=4,
		"RANK_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='A3',
		"PD1_MACRO"=5.95866216581157E-03,
		"PD2_MACRO"=0.024185,
		"PD3_MACRO"=0.046425,
		"PD4_MACRO"=0.070384,
		"PD5_MACRO"=0.094734,
		"PD6_MACRO"=0.118891,
		"PD7_MACRO"=0.142602,
		"PD8_MACRO"=0.165762,
		"PD9_MACRO"=0.188337,
		"PD10_MACRO"=0.210318,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='A3' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'A3',
	5.95866216581157E-03,
	0.024185,
	0.046425,
	0.070384,
	0.094734,
	0.118891,
	0.142602,
	0.165762,
	0.188337,
	0.210318,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 83
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=4,
		"RANK_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='B1',
		"PD1_MACRO"=8.93885130215019E-03,
		"PD2_MACRO"=0.028613,
		"PD3_MACRO"=0.051252,
		"PD4_MACRO"=0.075278,
		"PD5_MACRO"=0.099569,
		"PD6_MACRO"=0.12362,
		"PD7_MACRO"=0.14721,
		"PD8_MACRO"=0.170247,
		"PD9_MACRO"=0.1927,
		"PD10_MACRO"=0.214563,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='B1' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'B1',
	8.93885130215019E-03,
	0.028613,
	0.051252,
	0.075278,
	0.099569,
	0.12362,
	0.14721,
	0.170247,
	0.1927,
	0.214563,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 84
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=4,
		"RANK_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='B2',
		"PD1_MACRO"=1.28067571971378E-02,
		"PD2_MACRO"=0.034598,
		"PD3_MACRO"=0.057804,
		"PD4_MACRO"=0.081938,
		"PD5_MACRO"=0.106155,
		"PD6_MACRO"=0.130066,
		"PD7_MACRO"=0.153493,
		"PD8_MACRO"=0.176364,
		"PD9_MACRO"=0.198651,
		"PD10_MACRO"=0.220352,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='B2' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'B2',
	1.28067571971378E-02,
	0.034598,
	0.057804,
	0.081938,
	0.106155,
	0.130066,
	0.153493,
	0.176364,
	0.198651,
	0.220352,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 85
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=4,
		"RANK_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='B3',
		"PD1_MACRO"=1.75470861519781E-02,
		"PD2_MACRO"=0.04192,
		"PD3_MACRO"=0.065884,
		"PD4_MACRO"=0.09019,
		"PD5_MACRO"=0.114338,
		"PD6_MACRO"=0.138083,
		"PD7_MACRO"=0.161312,
		"PD8_MACRO"=0.183976,
		"PD9_MACRO"=0.206057,
		"PD10_MACRO"=0.227557,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='B3' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'B3',
	1.75470861519781E-02,
	0.04192,
	0.065884,
	0.09019,
	0.114338,
	0.138083,
	0.161312,
	0.183976,
	0.206057,
	0.227557,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 86
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=4,
		"RANK_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='C1',
		"PD1_MACRO"=2.25092411206509E-02,
		"PD2_MACRO"=0.049728,
		"PD3_MACRO"=0.07466,
		"PD4_MACRO"=0.099259,
		"PD5_MACRO"=0.12339,
		"PD6_MACRO"=0.146983,
		"PD7_MACRO"=0.170005,
		"PD8_MACRO"=0.192442,
		"PD9_MACRO"=0.214295,
		"PD10_MACRO"=0.235569,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='C1' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'C1',
	2.25092411206509E-02,
	0.049728,
	0.07466,
	0.099259,
	0.12339,
	0.146983,
	0.170005,
	0.192442,
	0.214295,
	0.235569,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 87
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=4,
		"RANK_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='C2',
		"PD1_MACRO"=3.02791324830112E-02,
		"PD2_MACRO"=0.062688,
		"PD3_MACRO"=0.089736,
		"PD4_MACRO"=0.115256,
		"PD5_MACRO"=0.139673,
		"PD6_MACRO"=0.163216,
		"PD7_MACRO"=0.186011,
		"PD8_MACRO"=0.208131,
		"PD9_MACRO"=0.229623,
		"PD10_MACRO"=0.250516,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='C2' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'C2',
	3.02791324830112E-02,
	0.062688,
	0.089736,
	0.115256,
	0.139673,
	0.163216,
	0.186011,
	0.208131,
	0.229623,
	0.250516,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 88
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=4,
		"RANK_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='C3',
		"PD1_MACRO"=4.22563014030519E-02,
		"PD2_MACRO"=0.080879,
		"PD3_MACRO"=0.109587,
		"PD4_MACRO"=0.135416,
		"PD5_MACRO"=0.159608,
		"PD6_MACRO"=0.182724,
		"PD7_MACRO"=0.205026,
		"PD8_MACRO"=0.226638,
		"PD9_MACRO"=0.247628,
		"PD10_MACRO"=0.268031,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='C3' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'C3',
	4.22563014030519E-02,
	0.080879,
	0.109587,
	0.135416,
	0.159608,
	0.182724,
	0.205026,
	0.226638,
	0.247628,
	0.268031,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 89
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=4,
		"RANK_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='D1',
		"PD1_MACRO"=5.54173275352711E-02,
		"PD2_MACRO"=0.10002,
		"PD3_MACRO"=0.130051,
		"PD4_MACRO"=0.155976,
		"PD5_MACRO"=0.17983,
		"PD6_MACRO"=0.202467,
		"PD7_MACRO"=0.224252,
		"PD8_MACRO"=0.245347,
		"PD9_MACRO"=0.265829,
		"PD10_MACRO"=0.285737,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='D1' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'D1',
	5.54173275352711E-02,
	0.10002,
	0.130051,
	0.155976,
	0.17983,
	0.202467,
	0.224252,
	0.245347,
	0.265829,
	0.285737,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 90
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=4,
		"RANK_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='D2',
		"PD1_MACRO"=8.03457967153691E-02,
		"PD2_MACRO"=0.135318,
		"PD3_MACRO"=0.167212,
		"PD4_MACRO"=0.193039,
		"PD5_MACRO"=0.21617,
		"PD6_MACRO"=0.237903,
		"PD7_MACRO"=0.258746,
		"PD8_MACRO"=0.278908,
		"PD9_MACRO"=0.298479,
		"PD10_MACRO"=0.317501,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='D2' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'D2',
	8.03457967153691E-02,
	0.135318,
	0.167212,
	0.193039,
	0.21617,
	0.237903,
	0.258746,
	0.278908,
	0.298479,
	0.317501,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 91
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=4,
		"RANK_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='D3',
		"PD1_MACRO"=0.151180979318036,
		"PD2_MACRO"=0.230649,
		"PD3_MACRO"=0.265435,
		"PD4_MACRO"=0.290143,
		"PD5_MACRO"=0.311054,
		"PD6_MACRO"=0.330311,
		"PD7_MACRO"=0.348666,
		"PD8_MACRO"=0.366389,
		"PD9_MACRO"=0.383585,
		"PD10_MACRO"=0.400299,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='D3' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'D3',
	0.151180979318036,
	0.230649,
	0.265435,
	0.290143,
	0.311054,
	0.330311,
	0.348666,
	0.366389,
	0.383585,
	0.400299,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 92
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=4,
		"RANK_MODEL"='Средние  (корпоративные)',
		"RAT_ON_DATE"='E',
		"PD1_MACRO"=0.151180979318036,
		"PD2_MACRO"=0.230649,
		"PD3_MACRO"=0.265435,
		"PD4_MACRO"=0.290143,
		"PD5_MACRO"=0.311054,
		"PD6_MACRO"=0.330311,
		"PD7_MACRO"=0.348666,
		"PD8_MACRO"=0.366389,
		"PD9_MACRO"=0.383585,
		"PD10_MACRO"=0.400299,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Средние  (корпоративные)' AND 
		"RAT_ON_DATE"='E' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	4,
	'Средние  (корпоративные)',
	'E',
	0.151180979318036,
	0.230649,
	0.265435,
	0.290143,
	0.311054,
	0.330311,
	0.348666,
	0.366389,
	0.383585,
	0.400299,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 93
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=9,
		"RANK_MODEL"='Администрации',
		"RAT_ON_DATE"='A1',
		"PD1_MACRO"=0.001968,
		"PD2_MACRO"=5.64498847719008E-03,
		"PD3_MACRO"=0.011972555385694,
		"PD4_MACRO"=1.91922728072793E-02,
		"PD5_MACRO"=2.68424967475991E-02,
		"PD6_MACRO"=3.46833956382185E-02,
		"PD7_MACRO"=4.25907730661738E-02,
		"PD8_MACRO"=5.05005159311402E-02,
		"PD9_MACRO"=5.83796754337654E-02,
		"PD10_MACRO"=6.62114517009342E-02,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Администрации' AND 
		"RAT_ON_DATE"='A1' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	9,
	'Администрации',
	'A1',
	0.001968,
	5.64498847719008E-03,
	0.011972555385694,
	1.91922728072793E-02,
	2.68424967475991E-02,
	3.46833956382185E-02,
	4.25907730661738E-02,
	5.05005159311402E-02,
	5.83796754337654E-02,
	6.62114517009342E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 94
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=9,
		"RANK_MODEL"='Администрации',
		"RAT_ON_DATE"='A2',
		"PD1_MACRO"=0.001968,
		"PD2_MACRO"=6.33830514019684E-03,
		"PD3_MACRO"=1.27591829932099E-02,
		"PD4_MACRO"=0.02001557448836,
		"PD5_MACRO"=2.76770401265338E-02,
		"PD6_MACRO"=3.55181066311308E-02,
		"PD7_MACRO"=4.34210360951627E-02,
		"PD8_MACRO"=5.13245409735508E-02,
		"PD9_MACRO"=5.91968625317092E-02,
		"PD10_MACRO"=6.70216739755258E-02,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Администрации' AND 
		"RAT_ON_DATE"='A2' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	9,
	'Администрации',
	'A2',
	0.001968,
	6.33830514019684E-03,
	1.27591829932099E-02,
	0.02001557448836,
	2.76770401265338E-02,
	3.55181066311308E-02,
	4.34210360951627E-02,
	5.13245409735508E-02,
	5.91968625317092E-02,
	6.70216739755258E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 95
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=9,
		"RANK_MODEL"='Администрации',
		"RAT_ON_DATE"='A3',
		"PD1_MACRO"=0.001968,
		"PD2_MACRO"=7.05231550235652E-03,
		"PD3_MACRO"=0.013570704454157,
		"PD4_MACRO"=2.08658580311004E-02,
		"PD5_MACRO"=2.85394657775367E-02,
		"PD6_MACRO"=3.63809743004196E-02,
		"PD7_MACRO"=4.42794212170067E-02,
		"PD8_MACRO"=5.21765128016622E-02,
		"PD9_MACRO"=6.00417645066632E-02,
		"PD10_MACRO"=6.78593618765326E-02,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Администрации' AND 
		"RAT_ON_DATE"='A3' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	9,
	'Администрации',
	'A3',
	0.001968,
	7.05231550235652E-03,
	0.013570704454157,
	2.08658580311004E-02,
	2.85394657775367E-02,
	3.63809743004196E-02,
	4.42794212170067E-02,
	5.21765128016622E-02,
	6.00417645066632E-02,
	6.78593618765326E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 96
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=9,
		"RANK_MODEL"='Администрации',
		"RAT_ON_DATE"='B1',
		"PD1_MACRO"=2.2933716988467E-03,
		"PD2_MACRO"=7.72296276748852E-03,
		"PD3_MACRO"=1.43343710063609E-02,
		"PD4_MACRO"=2.16669445670317E-02,
		"PD5_MACRO"=0.029352537489735,
		"PD6_MACRO"=3.71947407808569E-02,
		"PD7_MACRO"=4.50890807189288E-02,
		"PD8_MACRO"=5.29801609485376E-02,
		"PD9_MACRO"=6.08387438011175E-02,
		"PD10_MACRO"=6.86495222926262E-02,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Администрации' AND 
		"RAT_ON_DATE"='B1' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	9,
	'Администрации',
	'B1',
	2.2933716988467E-03,
	7.72296276748852E-03,
	1.43343710063609E-02,
	2.16669445670317E-02,
	0.029352537489735,
	3.71947407808569E-02,
	4.50890807189288E-02,
	5.29801609485376E-02,
	6.08387438011175E-02,
	6.86495222926262E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 97
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=9,
		"RANK_MODEL"='Администрации',
		"RAT_ON_DATE"='B2',
		"PD1_MACRO"=2.80594531957232E-03,
		"PD2_MACRO"=8.54821336859879E-03,
		"PD3_MACRO"=1.52761909973145E-02,
		"PD4_MACRO"=2.26563153623739E-02,
		"PD5_MACRO"=3.03575281096842E-02,
		"PD6_MACRO"=3.82010110366493E-02,
		"PD7_MACRO"=4.60904567303607E-02,
		"PD8_MACRO"=0.053974160760926,
		"PD9_MACRO"=6.18244951803062E-02,
		"PD10_MACRO"=6.96268175993915E-02,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Администрации' AND 
		"RAT_ON_DATE"='B2' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	9,
	'Администрации',
	'B2',
	2.80594531957232E-03,
	8.54821336859879E-03,
	1.52761909973145E-02,
	2.26563153623739E-02,
	3.03575281096842E-02,
	3.82010110366493E-02,
	4.60904567303607E-02,
	0.053974160760926,
	6.18244951803062E-02,
	6.96268175993915E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 98
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=9,
		"RANK_MODEL"='Администрации',
		"RAT_ON_DATE"='B3',
		"PD1_MACRO"=3.69522653302951E-03,
		"PD2_MACRO"=9.9898518628414E-03,
		"PD3_MACRO"=1.69279591464027E-02,
		"PD4_MACRO"=2.43958552278031E-02,
		"PD5_MACRO"=3.21271230370362E-02,
		"PD6_MACRO"=3.99742139357611E-02,
		"PD7_MACRO"=0.04785563789223,
		"PD8_MACRO"=5.57265341305132E-02,
		"PD9_MACRO"=6.35623269629639E-02,
		"PD10_MACRO"=7.13496659326135E-02,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Администрации' AND 
		"RAT_ON_DATE"='B3' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	9,
	'Администрации',
	'B3',
	3.69522653302951E-03,
	9.9898518628414E-03,
	1.69279591464027E-02,
	2.43958552278031E-02,
	3.21271230370362E-02,
	3.99742139357611E-02,
	0.04785563789223,
	5.57265341305132E-02,
	6.35623269629639E-02,
	7.13496659326135E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 99
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=9,
		"RANK_MODEL"='Администрации',
		"RAT_ON_DATE"='C1',
		"PD1_MACRO"=4.91380522006627E-03,
		"PD2_MACRO"=1.19852276208522E-02,
		"PD3_MACRO"=1.92319034096814E-02,
		"PD4_MACRO"=0.026834470867535,
		"PD5_MACRO"=3.46153176878612E-02,
		"PD6_MACRO"=4.24714833342497E-02,
		"PD7_MACRO"=5.03434416918053E-02,
		"PD8_MACRO"=0.058196895934299,
		"PD9_MACRO"=6.60121891508912E-02,
		"PD10_MACRO"=7.37781540824135E-02,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Администрации' AND 
		"RAT_ON_DATE"='C1' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	9,
	'Администрации',
	'C1',
	4.91380522006627E-03,
	1.19852276208522E-02,
	1.92319034096814E-02,
	0.026834470867535,
	3.46153176878612E-02,
	4.24714833342497E-02,
	5.03434416918053E-02,
	0.058196895934299,
	6.60121891508912E-02,
	7.37781540824135E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 100
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=9,
		"RANK_MODEL"='Администрации',
		"RAT_ON_DATE"='C2',
		"PD1_MACRO"=6.31242124714658E-03,
		"PD2_MACRO"=1.43252512141038E-02,
		"PD3_MACRO"=2.19763145217625E-02,
		"PD4_MACRO"=2.97701439407136E-02,
		"PD5_MACRO"=0.037630439266994,
		"PD6_MACRO"=4.55088194086483E-02,
		"PD7_MACRO"=5.33746961539548E-02,
		"PD8_MACRO"=6.12088099943421E-02,
		"PD9_MACRO"=6.89991096730911E-02,
		"PD10_MACRO"=7.67381281435687E-02,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Администрации' AND 
		"RAT_ON_DATE"='C2' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	9,
	'Администрации',
	'C2',
	6.31242124714658E-03,
	1.43252512141038E-02,
	2.19763145217625E-02,
	2.97701439407136E-02,
	0.037630439266994,
	4.55088194086483E-02,
	5.33746961539548E-02,
	6.12088099943421E-02,
	6.89991096730911E-02,
	7.67381281435687E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 101
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=9,
		"RANK_MODEL"='Администрации',
		"RAT_ON_DATE"='C3',
		"PD1_MACRO"=8.25775700082096E-03,
		"PD2_MACRO"=1.78432049346357E-02,
		"PD3_MACRO"=2.63815917971483E-02,
		"PD4_MACRO"=3.47402086041181E-02,
		"PD5_MACRO"=4.29543559731377E-02,
		"PD6_MACRO"=5.10485075926677E-02,
		"PD7_MACRO"=5.90396873629384E-02,
		"PD8_MACRO"=6.69397901011374E-02,
		"PD9_MACRO"=7.47571776394335E-02,
		"PD10_MACRO"=8.24977772154605E-02,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Администрации' AND 
		"RAT_ON_DATE"='C3' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	9,
	'Администрации',
	'C3',
	8.25775700082096E-03,
	1.78432049346357E-02,
	2.63815917971483E-02,
	3.47402086041181E-02,
	4.29543559731377E-02,
	5.10485075926677E-02,
	5.90396873629384E-02,
	6.69397901011374E-02,
	7.47571776394335E-02,
	8.24977772154605E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 102
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=9,
		"RANK_MODEL"='Администрации',
		"RAT_ON_DATE"='D1',
		"PD1_MACRO"=1.08551146252056E-02,
		"PD2_MACRO"=2.21900100872751E-02,
		"PD3_MACRO"=0.031483880682632,
		"PD4_MACRO"=4.02035646248802E-02,
		"PD5_MACRO"=4.85703126265148E-02,
		"PD6_MACRO"=5.67090692807081E-02,
		"PD7_MACRO"=6.46905820329627E-02,
		"PD8_MACRO"=7.25550397146172E-02,
		"PD9_MACRO"=8.03253814332682E-02,
		"PD10_MACRO"=8.80148023168184E-02,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Администрации' AND 
		"RAT_ON_DATE"='D1' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	9,
	'Администрации',
	'D1',
	1.08551146252056E-02,
	2.21900100872751E-02,
	0.031483880682632,
	4.02035646248802E-02,
	4.85703126265148E-02,
	5.67090692807081E-02,
	6.46905820329627E-02,
	7.25550397146172E-02,
	8.03253814332682E-02,
	8.80148023168184E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 103
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=9,
		"RANK_MODEL"='Администрации',
		"RAT_ON_DATE"='D2',
		"PD1_MACRO"=1.32925485042138E-02,
		"PD2_MACRO"=2.61074180192233E-02,
		"PD3_MACRO"=3.59534452700658E-02,
		"PD4_MACRO"=0.044899931395837,
		"PD5_MACRO"=5.33420366176533E-02,
		"PD6_MACRO"=6.14874965435205E-02,
		"PD7_MACRO"=6.94458493997343E-02,
		"PD8_MACRO"=7.72750335895437E-02,
		"PD9_MACRO"=0.085005830141755,
		"PD10_MACRO"=9.26547141230637E-02,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Администрации' AND 
		"RAT_ON_DATE"='D2' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	9,
	'Администрации',
	'D2',
	1.32925485042138E-02,
	2.61074180192233E-02,
	3.59534452700658E-02,
	0.044899931395837,
	5.33420366176533E-02,
	6.14874965435205E-02,
	6.94458493997343E-02,
	7.72750335895437E-02,
	0.085005830141755,
	9.26547141230637E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 104
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=9,
		"RANK_MODEL"='Администрации',
		"RAT_ON_DATE"='D3',
		"PD1_MACRO"=1.75387315722337E-02,
		"PD2_MACRO"=3.27687168068862E-02,
		"PD3_MACRO"=4.34347822403765E-02,
		"PD4_MACRO"=5.26865218419096E-02,
		"PD5_MACRO"=6.12119448517415E-02,
		"PD6_MACRO"=6.93476693784684E-02,
		"PD7_MACRO"=7.72590253717139E-02,
		"PD8_MACRO"=8.50274739230124E-02,
		"PD9_MACRO"=0.09269331879278,
		"PD10_MACRO"=0.10027664306809,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Администрации' AND 
		"RAT_ON_DATE"='D3' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	9,
	'Администрации',
	'D3',
	1.75387315722337E-02,
	3.27687168068862E-02,
	4.34347822403765E-02,
	5.26865218419096E-02,
	6.12119448517415E-02,
	6.93476693784684E-02,
	7.72590253717139E-02,
	8.50274739230124E-02,
	0.09269331879278,
	0.10027664306809,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 105
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=9,
		"RANK_MODEL"='Администрации',
		"RAT_ON_DATE"='E',
		"PD1_MACRO"=2.91124326524629E-02,
		"PD2_MACRO"=5.03744338442107E-02,
		"PD3_MACRO"=6.28476704952579E-02,
		"PD4_MACRO"=7.26861361703689E-02,
		"PD5_MACRO"=8.13202879132506E-02,
		"PD6_MACRO"=8.93828510924346E-02,
		"PD7_MACRO"=9.71554014654771E-02,
		"PD8_MACRO"=0.104763718120936,
		"PD9_MACRO"=0.112264208313901,
		"PD10_MACRO"=0.119682338847027,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Администрации' AND 
		"RAT_ON_DATE"='E' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	9,
	'Администрации',
	'E',
	2.91124326524629E-02,
	5.03744338442107E-02,
	6.28476704952579E-02,
	7.26861361703689E-02,
	8.13202879132506E-02,
	8.93828510924346E-02,
	9.71554014654771E-02,
	0.104763718120936,
	0.112264208313901,
	0.119682338847027,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 106
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='AAA',
		"PD1_MACRO"=8.30200803121684E-05,
		"PD2_MACRO"=5.14367706173968E-04,
		"PD3_MACRO"=9.62361308121218E-04,
		"PD4_MACRO"=1.43732556879161E-03,
		"PD5_MACRO"=1.9413368351453E-03,
		"PD6_MACRO"=2.47650917241582E-03,
		"PD7_MACRO"=3.04501684588498E-03,
		"PD8_MACRO"=3.64911401999957E-03,
		"PD9_MACRO"=4.29115201095998E-03,
		"PD10_MACRO"=4.97359458649949E-03,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='AAA' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'AAA',
	8.30200803121684E-05,
	5.14367706173968E-04,
	9.62361308121218E-04,
	1.43732556879161E-03,
	1.9413368351453E-03,
	2.47650917241582E-03,
	3.04501684588498E-03,
	3.64911401999957E-03,
	4.29115201095998E-03,
	4.97359458649949E-03,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 107
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='AA+',
		"PD1_MACRO"=1.25693782808127E-04,
		"PD2_MACRO"=6.9987970793417E-04,
		"PD3_MACRO"=1.28139150399997E-03,
		"PD4_MACRO"=1.8839837396627E-03,
		"PD5_MACRO"=2.50882036042654E-03,
		"PD6_MACRO"=3.15700906230765E-03,
		"PD7_MACRO"=0.003829623532842,
		"PD8_MACRO"=4.52772101443988E-03,
		"PD9_MACRO"=5.25235591938977E-03,
		"PD10_MACRO"=6.00459031103351E-03,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='AA+' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'AA+',
	1.25693782808127E-04,
	6.9987970793417E-04,
	1.28139150399997E-03,
	1.8839837396627E-03,
	2.50882036042654E-03,
	3.15700906230765E-03,
	0.003829623532842,
	4.52772101443988E-03,
	5.25235591938977E-03,
	6.00459031103351E-03,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 108
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='AA',
		"PD1_MACRO"=1.90297888399927E-04,
		"PD2_MACRO"=9.54851534941126E-04,
		"PD3_MACRO"=1.70959213208755E-03,
		"PD4_MACRO"=2.47399733766496E-03,
		"PD5_MACRO"=3.24849042881814E-03,
		"PD6_MACRO"=4.03340725797374E-03,
		"PD7_MACRO"=4.82902065536472E-03,
		"PD8_MACRO"=5.63555876639277E-03,
		"PD9_MACRO"=6.45321851879999E-03,
		"PD10_MACRO"=7.2821753699317E-03,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='AA' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'AA',
	1.90297888399927E-04,
	9.54851534941126E-04,
	1.70959213208755E-03,
	2.47399733766496E-03,
	3.24849042881814E-03,
	4.03340725797374E-03,
	4.82902065536472E-03,
	5.63555876639277E-03,
	6.45321851879999E-03,
	7.2821753699317E-03,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 109
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='AA-',
		"PD1_MACRO"=2.88096700278732E-04,
		"PD2_MACRO"=1.30646195284101E-03,
		"PD3_MACRO"=2.28588958684472E-03,
		"PD4_MACRO"=3.2553726304887E-03,
		"PD5_MACRO"=4.21514754935937E-03,
		"PD6_MACRO"=5.16538890578755E-03,
		"PD7_MACRO"=6.10622973140074E-03,
		"PD8_MACRO"=7.03777602603917E-03,
		"PD9_MACRO"=7.96011678842234E-03,
		"PD10_MACRO"=8.87333080066222E-03,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='AA-' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'AA-',
	2.88096700278732E-04,
	1.30646195284101E-03,
	2.28588958684472E-03,
	3.2553726304887E-03,
	4.21514754935937E-03,
	5.16538890578755E-03,
	6.10622973140074E-03,
	7.03777602603917E-03,
	7.96011678842234E-03,
	8.87333080066222E-03,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 110
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='A+',
		"PD1_MACRO"=4.36132644098426E-04,
		"PD2_MACRO"=1.79303090878535E-03,
		"PD3_MACRO"=3.06377775500877E-03,
		"PD4_MACRO"=4.29304061510327E-03,
		"PD5_MACRO"=5.4820621949313E-03,
		"PD6_MACRO"=6.63206090372315E-03,
		"PD7_MACRO"=7.74423203830155E-03,
		"PD8_MACRO"=8.81974776355121E-03,
		"PD9_MACRO"=9.85975641522419E-03,
		"PD10_MACRO"=1.08653815166383E-02,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='A+' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'A+',
	4.36132644098426E-04,
	1.79303090878535E-03,
	3.06377775500877E-03,
	4.29304061510327E-03,
	5.4820621949313E-03,
	6.63206090372315E-03,
	7.74423203830155E-03,
	8.81974776355121E-03,
	9.85975641522419E-03,
	1.08653815166383E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 111
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='A',
		"PD1_MACRO"=6.60180317255365E-04,
		"PD2_MACRO"=2.4687837370837E-03,
		"PD3_MACRO"=4.11704249145128E-03,
		"PD4_MACRO"=5.6751535618319E-03,
		"PD5_MACRO"=7.14758488500089E-03,
		"PD6_MACRO"=8.53871306125498E-03,
		"PD7_MACRO"=9.8527862604727E-03,
		"PD8_MACRO"=1.10939000114039E-02,
		"PD9_MACRO"=1.22659826160273E-02,
		"PD10_MACRO"=1.33727875640837E-02,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='A' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'A',
	6.60180317255365E-04,
	2.4687837370837E-03,
	4.11704249145128E-03,
	5.6751535618319E-03,
	7.14758488500089E-03,
	8.53871306125498E-03,
	9.8527862604727E-03,
	1.10939000114039E-02,
	1.22659826160273E-02,
	1.33727875640837E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 112
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='A-',
		"PD1_MACRO"=9.99198025494977E-04,
		"PD2_MACRO"=3.4107117655906E-03,
		"PD3_MACRO"=5.54781952415495E-03,
		"PD4_MACRO"=7.52182335429719E-03,
		"PD5_MACRO"=9.34423447788868E-03,
		"PD6_MACRO"=1.10260579396888E-02,
		"PD7_MACRO"=1.25777106192352E-02,
		"PD8_MACRO"=1.40089817061323E-02,
		"PD9_MACRO"=1.53290223909285E-02,
		"PD10_MACRO"=1.65463548316724E-02,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='A-' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'A-',
	9.99198025494977E-04,
	3.4107117655906E-03,
	5.54781952415495E-03,
	7.52182335429719E-03,
	9.34423447788868E-03,
	1.10260579396888E-02,
	1.25777106192352E-02,
	1.40089817061323E-02,
	1.53290223909285E-02,
	1.65463548316724E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 113
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='BBB+',
		"PD1_MACRO"=1.51201945319242E-03,
		"PD2_MACRO"=4.72845122728771E-03,
		"PD3_MACRO"=7.49793841341939E-03,
		"PD4_MACRO"=9.9972495814209E-03,
		"PD5_MACRO"=1.22511946849196E-02,
		"PD6_MACRO"=1.42828594025604E-02,
		"PD7_MACRO"=1.61135223106299E-02,
		"PD8_MACRO"=1.77626632976071E-02,
		"PD9_MACRO"=1.92480288181722E-02,
		"PD10_MACRO"=2.05857297444595E-02,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='BBB+' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'BBB+',
	1.51201945319242E-03,
	4.72845122728771E-03,
	7.49793841341939E-03,
	9.9972495814209E-03,
	1.22511946849196E-02,
	1.42828594025604E-02,
	1.61135223106299E-02,
	1.77626632976071E-02,
	1.92480288181722E-02,
	2.05857297444595E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 114
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='BBB',
		"PD1_MACRO"=2.28737511162072E-03,
		"PD2_MACRO"=6.57848058282395E-03,
		"PD3_MACRO"=1.01648600220734E-02,
		"PD4_MACRO"=1.33265136565581E-02,
		"PD5_MACRO"=0.016111454412171,
		"PD6_MACRO"=1.85631484069424E-02,
		"PD7_MACRO"=2.07206037185385E-02,
		"PD8_MACRO"=2.26186107632182E-02,
		"PD9_MACRO"=2.42880619963515E-02,
		"PD10_MACRO"=0.02575630352518,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='BBB' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'BBB',
	2.28737511162072E-03,
	6.57848058282395E-03,
	1.01648600220734E-02,
	1.33265136565581E-02,
	0.016111454412171,
	1.85631484069424E-02,
	2.07206037185385E-02,
	2.26186107632182E-02,
	2.42880619963515E-02,
	0.02575630352518,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 115
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='BBB-',
		"PD1_MACRO"=3.45881451355917E-03,
		"PD2_MACRO"=9.18442737440306E-03,
		"PD3_MACRO"=1.38239494533005E-02,
		"PD4_MACRO"=1.78186975471633E-02,
		"PD5_MACRO"=2.12551692541977E-02,
		"PD6_MACRO"=2.42095376117499E-02,
		"PD7_MACRO"=2.67483589356563E-02,
		"PD8_MACRO"=2.89294657714561E-02,
		"PD9_MACRO"=3.08029161176182E-02,
		"PD10_MACRO"=3.24119222776711E-02,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='BBB-' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'BBB-',
	3.45881451355917E-03,
	9.18442737440306E-03,
	1.38239494533005E-02,
	1.78186975471633E-02,
	2.12551692541977E-02,
	2.42095376117499E-02,
	2.67483589356563E-02,
	2.89294657714561E-02,
	3.08029161176182E-02,
	3.24119222776711E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 116
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='BB+',
		"PD1_MACRO"=5.22672984813358E-03,
		"PD2_MACRO"=1.28658547067596E-02,
		"PD3_MACRO"=1.88592858228163E-02,
		"PD4_MACRO"=0.023898347655071,
		"PD5_MACRO"=2.81311131219776E-02,
		"PD6_MACRO"=3.16843910569065E-02,
		"PD7_MACRO"=3.46660391094686E-02,
		"PD8_MACRO"=3.71673597962047E-02,
		"PD9_MACRO"=3.92653888341351E-02,
		"PD10_MACRO"=0.041024980076466,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='BB+' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'BB+',
	5.22672984813358E-03,
	1.28658547067596E-02,
	1.88592858228163E-02,
	0.023898347655071,
	2.81311131219776E-02,
	3.16843910569065E-02,
	3.46660391094686E-02,
	3.71673597962047E-02,
	3.92653888341351E-02,
	0.041024980076466,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 117
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='BB',
		"PD1_MACRO"=7.89041610282393E-03,
		"PD2_MACRO"=1.80784395071008E-02,
		"PD3_MACRO"=2.58055177826251E-02,
		"PD4_MACRO"=3.21474376068996E-02,
		"PD5_MACRO"=3.73481044282229E-02,
		"PD6_MACRO"=4.16105460570214E-02,
		"PD7_MACRO"=4.51028112042171E-02,
		"PD8_MACRO"=4.79634603483085E-02,
		"PD9_MACRO"=5.03064454026486E-02,
		"PD10_MACRO"=5.22253213446642E-02,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='BB' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'BB',
	7.89041610282393E-03,
	1.80784395071008E-02,
	2.58055177826251E-02,
	3.21474376068996E-02,
	3.73481044282229E-02,
	4.16105460570214E-02,
	4.51028112042171E-02,
	4.79634603483085E-02,
	5.03064454026486E-02,
	5.22253213446642E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 118
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='BB-',
		"PD1_MACRO"=1.18937358410033E-02,
		"PD2_MACRO"=2.54685978157001E-02,
		"PD3_MACRO"=3.54029828168265E-02,
		"PD4_MACRO"=4.33593947041669E-02,
		"PD5_MACRO"=4.97275134301225E-02,
		"PD6_MACRO"=5.48223940698773E-02,
		"PD7_MACRO"=0.058897690791394,
		"PD8_MACRO"=6.21570595577183E-02,
		"PD9_MACRO"=6.47637252788519E-02,
		"PD10_MACRO"=6.68483664749001E-02,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='BB-' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'BB-',
	1.18937358410033E-02,
	2.54685978157001E-02,
	3.54029828168265E-02,
	4.33593947041669E-02,
	4.97275134301225E-02,
	5.48223940698773E-02,
	0.058897690791394,
	6.21570595577183E-02,
	6.47637252788519E-02,
	6.68483664749001E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 119
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='B+',
		"PD1_MACRO"=1.78879014578939E-02,
		"PD2_MACRO"=3.59444853671373E-02,
		"PD3_MACRO"=4.86664247695437E-02,
		"PD4_MACRO"=0.05860439104377,
		"PD5_MACRO"=6.63653111188911E-02,
		"PD6_MACRO"=7.24253253700443E-02,
		"PD7_MACRO"=7.71570774648727E-02,
		"PD8_MACRO"=8.08517958072837E-02,
		"PD9_MACRO"=8.37369043853233E-02,
		"PD10_MACRO"=8.59899364457488E-02,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='B+' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'B+',
	1.78879014578939E-02,
	3.59444853671373E-02,
	4.86664247695437E-02,
	0.05860439104377,
	6.63653111188911E-02,
	7.24253253700443E-02,
	7.71570774648727E-02,
	8.08517958072837E-02,
	8.37369043853233E-02,
	8.59899364457488E-02,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 120
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='B',
		"PD1_MACRO"=2.68127477445902E-02,
		"PD2_MACRO"=5.07610495990485E-02,
		"PD3_MACRO"=6.69621746586593E-02,
		"PD4_MACRO"=7.92989285922566E-02,
		"PD5_MACRO"=8.86955763027391E-02,
		"PD6_MACRO"=9.58548193539404E-02,
		"PD7_MACRO"=0.101310833712923,
		"PD8_MACRO"=0.105469779112197,
		"PD9_MACRO"=0.108640607822769,
		"PD10_MACRO"=0.111058444170476,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='B' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'B',
	2.68127477445902E-02,
	5.07610495990485E-02,
	6.69621746586593E-02,
	7.92989285922566E-02,
	8.86955763027391E-02,
	9.58548193539404E-02,
	0.101310833712923,
	0.105469779112197,
	0.108640607822769,
	0.111058444170476,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 121
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='B-',
		"PD1_MACRO"=3.99907633887817E-02,
		"PD2_MACRO"=7.16059549306727E-02,
		"PD3_MACRO"=9.20760943775657E-02,
		"PD4_MACRO"=0.107259335016176,
		"PD5_MACRO"=0.118533605793143,
		"PD6_MACRO"=0.126912579698095,
		"PD7_MACRO"=0.133143967435053,
		"PD8_MACRO"=0.137780554532211,
		"PD9_MACRO"=0.141231784261601,
		"PD10_MACRO"=0.143801384202501,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='B-' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'B-',
	3.99907633887817E-02,
	7.16059549306727E-02,
	9.20760943775657E-02,
	0.107259335016176,
	0.118533605793143,
	0.126912579698095,
	0.133143967435053,
	0.137780554532211,
	0.141231784261601,
	0.143801384202501,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 122
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='CCC+',
		"PD1_MACRO"=0.14215485,
		"PD2_MACRO"=0.188379922293993,
		"PD3_MACRO"=0.211464298169027,
		"PD4_MACRO"=0.22812686809629,
		"PD5_MACRO"=0.240181823697335,
		"PD6_MACRO"=0.24891806449346,
		"PD7_MACRO"=0.255256995618394,
		"PD8_MACRO"=0.259860479335921,
		"PD9_MACRO"=0.263205679779572,
		"PD10_MACRO"=0.265637540839746,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='CCC+' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'CCC+',
	0.14215485,
	0.188379922293993,
	0.211464298169027,
	0.22812686809629,
	0.240181823697335,
	0.24891806449346,
	0.255256995618394,
	0.259860479335921,
	0.263205679779572,
	0.265637540839746,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 123
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='CCC',
		"PD1_MACRO"=0.14215485,
		"PD2_MACRO"=0.188379922293993,
		"PD3_MACRO"=0.211464298169027,
		"PD4_MACRO"=0.22812686809629,
		"PD5_MACRO"=0.240181823697335,
		"PD6_MACRO"=0.24891806449346,
		"PD7_MACRO"=0.255256995618394,
		"PD8_MACRO"=0.259860479335921,
		"PD9_MACRO"=0.263205679779572,
		"PD10_MACRO"=0.265637540839746,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='CCC' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'CCC',
	0.14215485,
	0.188379922293993,
	0.211464298169027,
	0.22812686809629,
	0.240181823697335,
	0.24891806449346,
	0.255256995618394,
	0.259860479335921,
	0.263205679779572,
	0.265637540839746,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 124
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='CCC-',
		"PD1_MACRO"=0.14215485,
		"PD2_MACRO"=0.188379922293993,
		"PD3_MACRO"=0.211464298169027,
		"PD4_MACRO"=0.22812686809629,
		"PD5_MACRO"=0.240181823697335,
		"PD6_MACRO"=0.24891806449346,
		"PD7_MACRO"=0.255256995618394,
		"PD8_MACRO"=0.259860479335921,
		"PD9_MACRO"=0.263205679779572,
		"PD10_MACRO"=0.265637540839746,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='CCC-' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'CCC-',
	0.14215485,
	0.188379922293993,
	0.211464298169027,
	0.22812686809629,
	0.240181823697335,
	0.24891806449346,
	0.255256995618394,
	0.259860479335921,
	0.263205679779572,
	0.265637540839746,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 125
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='CC',
		"PD1_MACRO"=0.14215485,
		"PD2_MACRO"=0.188379922293993,
		"PD3_MACRO"=0.211464298169027,
		"PD4_MACRO"=0.22812686809629,
		"PD5_MACRO"=0.240181823697335,
		"PD6_MACRO"=0.24891806449346,
		"PD7_MACRO"=0.255256995618394,
		"PD8_MACRO"=0.259860479335921,
		"PD9_MACRO"=0.263205679779572,
		"PD10_MACRO"=0.265637540839746,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='CC' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'CC',
	0.14215485,
	0.188379922293993,
	0.211464298169027,
	0.22812686809629,
	0.240181823697335,
	0.24891806449346,
	0.255256995618394,
	0.259860479335921,
	0.263205679779572,
	0.265637540839746,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 126
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='C',
		"PD1_MACRO"=0.14215485,
		"PD2_MACRO"=0.188379922293993,
		"PD3_MACRO"=0.211464298169027,
		"PD4_MACRO"=0.22812686809629,
		"PD5_MACRO"=0.240181823697335,
		"PD6_MACRO"=0.24891806449346,
		"PD7_MACRO"=0.255256995618394,
		"PD8_MACRO"=0.259860479335921,
		"PD9_MACRO"=0.263205679779572,
		"PD10_MACRO"=0.265637540839746,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='C' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'C',
	0.14215485,
	0.188379922293993,
	0.211464298169027,
	0.22812686809629,
	0.240181823697335,
	0.24891806449346,
	0.255256995618394,
	0.259860479335921,
	0.263205679779572,
	0.265637540839746,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 127
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=10,
		"RANK_MODEL"='S&P',
		"RAT_ON_DATE"='D',
		"PD1_MACRO"=1,
		"PD2_MACRO"=1,
		"PD3_MACRO"=1,
		"PD4_MACRO"=1,
		"PD5_MACRO"=1,
		"PD6_MACRO"=1,
		"PD7_MACRO"=1,
		"PD8_MACRO"=1,
		"PD9_MACRO"=1,
		"PD10_MACRO"=1,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='S&P' AND 
		"RAT_ON_DATE"='D' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	10,
	'S&P',
	'D',
	1,
	1,
	1,
	1,
	1,
	1,
	1,
	1,
	1,
	1,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 128
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=5,
		"RANK_MODEL"='Нет рейтинга',
		"RAT_ON_DATE"=NULL,
		"PD1_MACRO"=0.151180979318036,
		"PD2_MACRO"=0.230649,
		"PD3_MACRO"=0.265435,
		"PD4_MACRO"=0.290143,
		"PD5_MACRO"=0.311054,
		"PD6_MACRO"=0.330311,
		"PD7_MACRO"=0.348666,
		"PD8_MACRO"=0.366389,
		"PD9_MACRO"=0.383585,
		"PD10_MACRO"=0.400299,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Нет рейтинга' AND 
		"RAT_ON_DATE" is NULL AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	5,
	'Нет рейтинга',
	NULL,
	0.151180979318036,
	0.230649,
	0.265435,
	0.290143,
	0.311054,
	0.330311,
	0.348666,
	0.366389,
	0.383585,
	0.400299,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 129
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=5,
		"RANK_MODEL"='Нет рейтинга',
		"RAT_ON_DATE"='No rating',
		"PD1_MACRO"=0.151180979318036,
		"PD2_MACRO"=0.230649,
		"PD3_MACRO"=0.265435,
		"PD4_MACRO"=0.290143,
		"PD5_MACRO"=0.311054,
		"PD6_MACRO"=0.330311,
		"PD7_MACRO"=0.348666,
		"PD8_MACRO"=0.366389,
		"PD9_MACRO"=0.383585,
		"PD10_MACRO"=0.400299,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Нет рейтинга' AND 
		"RAT_ON_DATE"='No rating' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	5,
	'Нет рейтинга',
	'No rating',
	0.151180979318036,
	0.230649,
	0.265435,
	0.290143,
	0.311054,
	0.330311,
	0.348666,
	0.366389,
	0.383585,
	0.400299,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 130
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=6,
		"RANK_MODEL"='Лизинговые',
		"RAT_ON_DATE"='A1',
		"PD1_MACRO"=2.41218330802713E-03,
		"PD2_MACRO"=0.018811,
		"PD3_MACRO"=0.040584,
		"PD4_MACRO"=0.064471,
		"PD5_MACRO"=0.0889,
		"PD6_MACRO"=0.113187,
		"PD7_MACRO"=0.137043,
		"PD8_MACRO"=0.160352,
		"PD9_MACRO"=0.183073,
		"PD10_MACRO"=0.205197,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='A1' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'A1',
	2.41218330802713E-03,
	0.018811,
	0.040584,
	0.064471,
	0.0889,
	0.113187,
	0.137043,
	0.160352,
	0.183073,
	0.205197,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 131
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=6,
		"RANK_MODEL"='Лизинговые',
		"RAT_ON_DATE"='A2',
		"PD1_MACRO"=3.41883831146096E-03,
		"PD2_MACRO"=0.020325,
		"PD3_MACRO"=0.042228,
		"PD4_MACRO"=0.066134,
		"PD5_MACRO"=0.09054,
		"PD6_MACRO"=0.11479,
		"PD7_MACRO"=0.138605,
		"PD8_MACRO"=0.161873,
		"PD9_MACRO"=0.184553,
		"PD10_MACRO"=0.206637,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='A2' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'A2',
	3.41883831146096E-03,
	0.020325,
	0.042228,
	0.066134,
	0.09054,
	0.11479,
	0.138605,
	0.161873,
	0.184553,
	0.206637,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 132
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=6,
		"RANK_MODEL"='Лизинговые',
		"RAT_ON_DATE"='A3',
		"PD1_MACRO"=4.05895413017003E-03,
		"PD2_MACRO"=0.021289,
		"PD3_MACRO"=0.043275,
		"PD4_MACRO"=0.067194,
		"PD5_MACRO"=0.091586,
		"PD6_MACRO"=0.115813,
		"PD7_MACRO"=0.139602,
		"PD8_MACRO"=0.162843,
		"PD9_MACRO"=0.185496,
		"PD10_MACRO"=0.207554,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='A3' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'A3',
	4.05895413017003E-03,
	0.021289,
	0.043275,
	0.067194,
	0.091586,
	0.115813,
	0.139602,
	0.162843,
	0.185496,
	0.207554,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 133
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=6,
		"RANK_MODEL"='Лизинговые',
		"RAT_ON_DATE"='B1',
		"PD1_MACRO"=5.95866216581157E-03,
		"PD2_MACRO"=0.024185,
		"PD3_MACRO"=0.046425,
		"PD4_MACRO"=0.070384,
		"PD5_MACRO"=0.094734,
		"PD6_MACRO"=0.118891,
		"PD7_MACRO"=0.142602,
		"PD8_MACRO"=0.165762,
		"PD9_MACRO"=0.188337,
		"PD10_MACRO"=0.210318,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='B1' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'B1',
	5.95866216581157E-03,
	0.024185,
	0.046425,
	0.070384,
	0.094734,
	0.118891,
	0.142602,
	0.165762,
	0.188337,
	0.210318,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 134
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=6,
		"RANK_MODEL"='Лизинговые',
		"RAT_ON_DATE"='B2',
		"PD1_MACRO"=8.93885130215019E-03,
		"PD2_MACRO"=0.028613,
		"PD3_MACRO"=0.051252,
		"PD4_MACRO"=0.075278,
		"PD5_MACRO"=0.099569,
		"PD6_MACRO"=0.12362,
		"PD7_MACRO"=0.14721,
		"PD8_MACRO"=0.170247,
		"PD9_MACRO"=0.1927,
		"PD10_MACRO"=0.214563,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='B2' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'B2',
	8.93885130215019E-03,
	0.028613,
	0.051252,
	0.075278,
	0.099569,
	0.12362,
	0.14721,
	0.170247,
	0.1927,
	0.214563,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 135
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=6,
		"RANK_MODEL"='Лизинговые',
		"RAT_ON_DATE"='B3',
		"PD1_MACRO"=1.28067571971378E-02,
		"PD2_MACRO"=0.034598,
		"PD3_MACRO"=0.057804,
		"PD4_MACRO"=0.081938,
		"PD5_MACRO"=0.106155,
		"PD6_MACRO"=0.130066,
		"PD7_MACRO"=0.153493,
		"PD8_MACRO"=0.176364,
		"PD9_MACRO"=0.198651,
		"PD10_MACRO"=0.220352,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='B3' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'B3',
	1.28067571971378E-02,
	0.034598,
	0.057804,
	0.081938,
	0.106155,
	0.130066,
	0.153493,
	0.176364,
	0.198651,
	0.220352,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 136
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=6,
		"RANK_MODEL"='Лизинговые',
		"RAT_ON_DATE"='C1',
		"PD1_MACRO"=1.75470861519781E-02,
		"PD2_MACRO"=0.04192,
		"PD3_MACRO"=0.065884,
		"PD4_MACRO"=0.09019,
		"PD5_MACRO"=0.114338,
		"PD6_MACRO"=0.138083,
		"PD7_MACRO"=0.161312,
		"PD8_MACRO"=0.183976,
		"PD9_MACRO"=0.206057,
		"PD10_MACRO"=0.227557,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='C1' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'C1',
	1.75470861519781E-02,
	0.04192,
	0.065884,
	0.09019,
	0.114338,
	0.138083,
	0.161312,
	0.183976,
	0.206057,
	0.227557,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 137
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=6,
		"RANK_MODEL"='Лизинговые',
		"RAT_ON_DATE"='C2',
		"PD1_MACRO"=2.25092411206509E-02,
		"PD2_MACRO"=0.049728,
		"PD3_MACRO"=0.07466,
		"PD4_MACRO"=0.099259,
		"PD5_MACRO"=0.12339,
		"PD6_MACRO"=0.146983,
		"PD7_MACRO"=0.170005,
		"PD8_MACRO"=0.192442,
		"PD9_MACRO"=0.214295,
		"PD10_MACRO"=0.235569,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='C2' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'C2',
	2.25092411206509E-02,
	0.049728,
	0.07466,
	0.099259,
	0.12339,
	0.146983,
	0.170005,
	0.192442,
	0.214295,
	0.235569,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 138
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=6,
		"RANK_MODEL"='Лизинговые',
		"RAT_ON_DATE"='C3',
		"PD1_MACRO"=3.02791324830112E-02,
		"PD2_MACRO"=0.062688,
		"PD3_MACRO"=0.089736,
		"PD4_MACRO"=0.115256,
		"PD5_MACRO"=0.139673,
		"PD6_MACRO"=0.163216,
		"PD7_MACRO"=0.186011,
		"PD8_MACRO"=0.208131,
		"PD9_MACRO"=0.229623,
		"PD10_MACRO"=0.250516,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='C3' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'C3',
	3.02791324830112E-02,
	0.062688,
	0.089736,
	0.115256,
	0.139673,
	0.163216,
	0.186011,
	0.208131,
	0.229623,
	0.250516,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 139
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=6,
		"RANK_MODEL"='Лизинговые',
		"RAT_ON_DATE"='D1',
		"PD1_MACRO"=4.22563014030519E-02,
		"PD2_MACRO"=0.080879,
		"PD3_MACRO"=0.109587,
		"PD4_MACRO"=0.135416,
		"PD5_MACRO"=0.159608,
		"PD6_MACRO"=0.182724,
		"PD7_MACRO"=0.205026,
		"PD8_MACRO"=0.226638,
		"PD9_MACRO"=0.247628,
		"PD10_MACRO"=0.268031,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='D1' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'D1',
	4.22563014030519E-02,
	0.080879,
	0.109587,
	0.135416,
	0.159608,
	0.182724,
	0.205026,
	0.226638,
	0.247628,
	0.268031,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 140
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=6,
		"RANK_MODEL"='Лизинговые',
		"RAT_ON_DATE"='D2',
		"PD1_MACRO"=5.54173275352711E-02,
		"PD2_MACRO"=0.10002,
		"PD3_MACRO"=0.130051,
		"PD4_MACRO"=0.155976,
		"PD5_MACRO"=0.17983,
		"PD6_MACRO"=0.202467,
		"PD7_MACRO"=0.224252,
		"PD8_MACRO"=0.245347,
		"PD9_MACRO"=0.265829,
		"PD10_MACRO"=0.285737,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='D2' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'D2',
	5.54173275352711E-02,
	0.10002,
	0.130051,
	0.155976,
	0.17983,
	0.202467,
	0.224252,
	0.245347,
	0.265829,
	0.285737,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 141
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=6,
		"RANK_MODEL"='Лизинговые',
		"RAT_ON_DATE"='D3',
		"PD1_MACRO"=8.03457967153691E-02,
		"PD2_MACRO"=0.135318,
		"PD3_MACRO"=0.167212,
		"PD4_MACRO"=0.193039,
		"PD5_MACRO"=0.21617,
		"PD6_MACRO"=0.237903,
		"PD7_MACRO"=0.258746,
		"PD8_MACRO"=0.278908,
		"PD9_MACRO"=0.298479,
		"PD10_MACRO"=0.317501,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='D3' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'D3',
	8.03457967153691E-02,
	0.135318,
	0.167212,
	0.193039,
	0.21617,
	0.237903,
	0.258746,
	0.278908,
	0.298479,
	0.317501,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.PD_CORP, Excel row# 142
begin
update DWH.PD_CORP
	set
		"RANK_MODEL_KEY"=6,
		"RANK_MODEL"='Лизинговые',
		"RAT_ON_DATE"='E',
		"PD1_MACRO"=0.151180979318036,
		"PD2_MACRO"=0.230649,
		"PD3_MACRO"=0.265435,
		"PD4_MACRO"=0.290143,
		"PD5_MACRO"=0.311054,
		"PD6_MACRO"=0.330311,
		"PD7_MACRO"=0.348666,
		"PD8_MACRO"=0.366389,
		"PD9_MACRO"=0.383585,
		"PD10_MACRO"=0.400299,
		"ST_DATE"=to_date('2020-10-01','YYYY-MM-DD'),
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"RANK_MODEL"='Лизинговые' AND 
		"RAT_ON_DATE"='E' AND 
		"END_DATE"=to_date('2400-01-01','YYYY-MM-DD') AND 
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD');
if sql%rowcount = 0 then
insert into DWH.PD_CORP ("RANK_MODEL_KEY","RANK_MODEL","RAT_ON_DATE","PD1_MACRO","PD2_MACRO","PD3_MACRO","PD4_MACRO","PD5_MACRO","PD6_MACRO","PD7_MACRO","PD8_MACRO","PD9_MACRO","PD10_MACRO","ST_DATE","END_DATE","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	6,
	'Лизинговые',
	'E',
	0.151180979318036,
	0.230649,
	0.265435,
	0.290143,
	0.311054,
	0.330311,
	0.348666,
	0.366389,
	0.383585,
	0.400299,
	to_date('2020-10-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
commit;
