insert into etl.ctl_apex_objects(apex_object_nam, check_function_nam, actual_flg, begin_dt, end_dt,
                                 valid_from_dttm, valid_to_dttm, commentary)
values('DWH_DIRECT_COST_INS', 'F_APEX_NAVIGATION_OBJECTS', '1', date '2020-01-01', date '2400-01-01'-1/24/60/60,
date '2020-01-01', date '2400-01-01', '�������������� �������� �� ������ �������');
insert into etl.ctl_apex_objects(apex_object_nam, check_function_nam, actual_flg, begin_dt, end_dt,
                                 valid_from_dttm, valid_to_dttm, commentary)
values('DWH_MAINTENENCE_COST_INS', 'F_APEX_NAVIGATION_OBJECTS', '1', date '2020-01-01', date '2400-01-01'-1/24/60/60,
date '2020-01-01', date '2400-01-01', '�������������� �������� ���');
insert into etl.ctl_apex_objects(apex_object_nam, check_function_nam, actual_flg, begin_dt, end_dt,
                                 valid_from_dttm, valid_to_dttm, commentary)
values('DWH_ROE_INS', 'F_APEX_NAVIGATION_OBJECTS', '1', date '2020-01-01', date '2400-01-01'-1/24/60/60,
date '2020-01-01', date '2400-01-01', '�������������� ROE');

commit;