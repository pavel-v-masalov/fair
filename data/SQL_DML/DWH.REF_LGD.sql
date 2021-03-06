set define off
-- load row: DWH.REF_LGD, Excel row# 4
begin
update DWH.REF_LGD
	set
		"LGD_TYPE_CD"='RES',
		"LEASING_SUBJECT_TYPE_CD"='Автомобильный транспорт',
		"LGD"=3.65923340490975E-02,
		"BEGIN_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"LGD_TYPE_CD"='RES' AND 
		"LEASING_SUBJECT_TYPE_CD"='Автомобильный транспорт';
if sql%rowcount = 0 then
insert into DWH.REF_LGD ("LGD_TYPE_CD","LEASING_SUBJECT_TYPE_CD","LGD","BEGIN_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	'RES',
	'Автомобильный транспорт',
	3.65923340490975E-02,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.REF_LGD, Excel row# 5
begin
update DWH.REF_LGD
	set
		"LGD_TYPE_CD"='RES',
		"LEASING_SUBJECT_TYPE_CD"='Без обеспечения',
		"LGD"=1,
		"BEGIN_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"LGD_TYPE_CD"='RES' AND 
		"LEASING_SUBJECT_TYPE_CD"='Без обеспечения';
if sql%rowcount = 0 then
insert into DWH.REF_LGD ("LGD_TYPE_CD","LEASING_SUBJECT_TYPE_CD","LGD","BEGIN_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	'RES',
	'Без обеспечения',
	1,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.REF_LGD, Excel row# 6
begin
update DWH.REF_LGD
	set
		"LGD_TYPE_CD"='RES',
		"LEASING_SUBJECT_TYPE_CD"='Воздушные суда',
		"LGD"=0.240172833999155,
		"BEGIN_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"LGD_TYPE_CD"='RES' AND 
		"LEASING_SUBJECT_TYPE_CD"='Воздушные суда';
if sql%rowcount = 0 then
insert into DWH.REF_LGD ("LGD_TYPE_CD","LEASING_SUBJECT_TYPE_CD","LGD","BEGIN_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	'RES',
	'Воздушные суда',
	0.240172833999155,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.REF_LGD, Excel row# 7
begin
update DWH.REF_LGD
	set
		"LGD_TYPE_CD"='RES',
		"LEASING_SUBJECT_TYPE_CD"='Морские суда',
		"LGD"=0.192655097207661,
		"BEGIN_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"LGD_TYPE_CD"='RES' AND 
		"LEASING_SUBJECT_TYPE_CD"='Морские суда';
if sql%rowcount = 0 then
insert into DWH.REF_LGD ("LGD_TYPE_CD","LEASING_SUBJECT_TYPE_CD","LGD","BEGIN_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	'RES',
	'Морские суда',
	0.192655097207661,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.REF_LGD, Excel row# 8
begin
update DWH.REF_LGD
	set
		"LGD_TYPE_CD"='RES',
		"LEASING_SUBJECT_TYPE_CD"='Недвижимость',
		"LGD"=0.0892,
		"BEGIN_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"LGD_TYPE_CD"='RES' AND 
		"LEASING_SUBJECT_TYPE_CD"='Недвижимость';
if sql%rowcount = 0 then
insert into DWH.REF_LGD ("LGD_TYPE_CD","LEASING_SUBJECT_TYPE_CD","LGD","BEGIN_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	'RES',
	'Недвижимость',
	0.0892,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.REF_LGD, Excel row# 9
begin
update DWH.REF_LGD
	set
		"LGD_TYPE_CD"='RES',
		"LEASING_SUBJECT_TYPE_CD"='Оборудование',
		"LGD"=0.41706778295746,
		"BEGIN_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"LGD_TYPE_CD"='RES' AND 
		"LEASING_SUBJECT_TYPE_CD"='Оборудование';
if sql%rowcount = 0 then
insert into DWH.REF_LGD ("LGD_TYPE_CD","LEASING_SUBJECT_TYPE_CD","LGD","BEGIN_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	'RES',
	'Оборудование',
	0.41706778295746,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.REF_LGD, Excel row# 10
begin
update DWH.REF_LGD
	set
		"LGD_TYPE_CD"='RES',
		"LEASING_SUBJECT_TYPE_CD"='Подвижной состав',
		"LGD"=7.72225708040181E-02,
		"BEGIN_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"LGD_TYPE_CD"='RES' AND 
		"LEASING_SUBJECT_TYPE_CD"='Подвижной состав';
if sql%rowcount = 0 then
insert into DWH.REF_LGD ("LGD_TYPE_CD","LEASING_SUBJECT_TYPE_CD","LGD","BEGIN_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	'RES',
	'Подвижной состав',
	7.72225708040181E-02,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.REF_LGD, Excel row# 11
begin
update DWH.REF_LGD
	set
		"LGD_TYPE_CD"='RES',
		"LEASING_SUBJECT_TYPE_CD"='Строительная техника',
		"LGD"=7.48299039381656E-02,
		"BEGIN_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"LGD_TYPE_CD"='RES' AND 
		"LEASING_SUBJECT_TYPE_CD"='Строительная техника';
if sql%rowcount = 0 then
insert into DWH.REF_LGD ("LGD_TYPE_CD","LEASING_SUBJECT_TYPE_CD","LGD","BEGIN_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	'RES',
	'Строительная техника',
	7.48299039381656E-02,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.REF_LGD, Excel row# 12
begin
update DWH.REF_LGD
	set
		"LGD_TYPE_CD"='EC',
		"LEASING_SUBJECT_TYPE_CD"='Автомобильный транспорт',
		"LGD"=3.65923340490975E-02,
		"BEGIN_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"LGD_TYPE_CD"='EC' AND 
		"LEASING_SUBJECT_TYPE_CD"='Автомобильный транспорт';
if sql%rowcount = 0 then
insert into DWH.REF_LGD ("LGD_TYPE_CD","LEASING_SUBJECT_TYPE_CD","LGD","BEGIN_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	'EC',
	'Автомобильный транспорт',
	3.65923340490975E-02,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.REF_LGD, Excel row# 13
begin
update DWH.REF_LGD
	set
		"LGD_TYPE_CD"='EC',
		"LEASING_SUBJECT_TYPE_CD"='Без обеспечения',
		"LGD"=1,
		"BEGIN_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"LGD_TYPE_CD"='EC' AND 
		"LEASING_SUBJECT_TYPE_CD"='Без обеспечения';
if sql%rowcount = 0 then
insert into DWH.REF_LGD ("LGD_TYPE_CD","LEASING_SUBJECT_TYPE_CD","LGD","BEGIN_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	'EC',
	'Без обеспечения',
	1,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.REF_LGD, Excel row# 14
begin
update DWH.REF_LGD
	set
		"LGD_TYPE_CD"='EC',
		"LEASING_SUBJECT_TYPE_CD"='Воздушные суда',
		"LGD"=0.240172833999155,
		"BEGIN_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"LGD_TYPE_CD"='EC' AND 
		"LEASING_SUBJECT_TYPE_CD"='Воздушные суда';
if sql%rowcount = 0 then
insert into DWH.REF_LGD ("LGD_TYPE_CD","LEASING_SUBJECT_TYPE_CD","LGD","BEGIN_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	'EC',
	'Воздушные суда',
	0.240172833999155,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.REF_LGD, Excel row# 15
begin
update DWH.REF_LGD
	set
		"LGD_TYPE_CD"='EC',
		"LEASING_SUBJECT_TYPE_CD"='Морские суда',
		"LGD"=0.192655097207661,
		"BEGIN_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"LGD_TYPE_CD"='EC' AND 
		"LEASING_SUBJECT_TYPE_CD"='Морские суда';
if sql%rowcount = 0 then
insert into DWH.REF_LGD ("LGD_TYPE_CD","LEASING_SUBJECT_TYPE_CD","LGD","BEGIN_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	'EC',
	'Морские суда',
	0.192655097207661,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.REF_LGD, Excel row# 16
begin
update DWH.REF_LGD
	set
		"LGD_TYPE_CD"='EC',
		"LEASING_SUBJECT_TYPE_CD"='Недвижимость',
		"LGD"=0.0892,
		"BEGIN_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"LGD_TYPE_CD"='EC' AND 
		"LEASING_SUBJECT_TYPE_CD"='Недвижимость';
if sql%rowcount = 0 then
insert into DWH.REF_LGD ("LGD_TYPE_CD","LEASING_SUBJECT_TYPE_CD","LGD","BEGIN_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	'EC',
	'Недвижимость',
	0.0892,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.REF_LGD, Excel row# 17
begin
update DWH.REF_LGD
	set
		"LGD_TYPE_CD"='EC',
		"LEASING_SUBJECT_TYPE_CD"='Оборудование',
		"LGD"=0.41706778295746,
		"BEGIN_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"LGD_TYPE_CD"='EC' AND 
		"LEASING_SUBJECT_TYPE_CD"='Оборудование';
if sql%rowcount = 0 then
insert into DWH.REF_LGD ("LGD_TYPE_CD","LEASING_SUBJECT_TYPE_CD","LGD","BEGIN_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	'EC',
	'Оборудование',
	0.41706778295746,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.REF_LGD, Excel row# 18
begin
update DWH.REF_LGD
	set
		"LGD_TYPE_CD"='EC',
		"LEASING_SUBJECT_TYPE_CD"='Подвижной состав',
		"LGD"=7.72225708040181E-02,
		"BEGIN_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"LGD_TYPE_CD"='EC' AND 
		"LEASING_SUBJECT_TYPE_CD"='Подвижной состав';
if sql%rowcount = 0 then
insert into DWH.REF_LGD ("LGD_TYPE_CD","LEASING_SUBJECT_TYPE_CD","LGD","BEGIN_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	'EC',
	'Подвижной состав',
	7.72225708040181E-02,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
-- load row: DWH.REF_LGD, Excel row# 19
begin
update DWH.REF_LGD
	set
		"LGD_TYPE_CD"='EC',
		"LEASING_SUBJECT_TYPE_CD"='Строительная техника',
		"LGD"=7.48299039381656E-02,
		"BEGIN_DT"=to_date('2020-01-01','YYYY-MM-DD'),
		"END_DT"=to_date('2400-01-01','YYYY-MM-DD'),
		"VALID_FROM_DTTM"=to_date('2020-01-01','YYYY-MM-DD'),
		"VALID_TO_DTTM"=to_date('2400-01-01','YYYY-MM-DD')
where
		"LGD_TYPE_CD"='EC' AND 
		"LEASING_SUBJECT_TYPE_CD"='Строительная техника';
if sql%rowcount = 0 then
insert into DWH.REF_LGD ("LGD_TYPE_CD","LEASING_SUBJECT_TYPE_CD","LGD","BEGIN_DT","END_DT","VALID_FROM_DTTM","VALID_TO_DTTM" ) 
values (
	'EC',
	'Строительная техника',
	7.48299039381656E-02,
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD'),
	to_date('2020-01-01','YYYY-MM-DD'),
	to_date('2400-01-01','YYYY-MM-DD')
);
end if;
end;
/
commit;
