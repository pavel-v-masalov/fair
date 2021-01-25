delete from DWH.TREASURY_SPREAD t
where t.treasury_spread_type='BARRIER' and contracts_terms_key in (1,2,3,6);

insert into DWH.TREASURY_SPREAD (TREASURY_SPREAD_TYPE, CURRENCY_LETTER_CD, FIXFLOAT, CONTRACTS_TERMS_KEY, INTERVAL1_DAYS_FROM, INTERVAL1_DAYS_TO, INTERVAL2_DAYS_FROM, INTERVAL2_DAYS_TO, VALUE, START_DT, END_DT, VALID_FROM_DTTM, VALID_TO_DTTM)
values ('BARRIER', 'EUR', 'fix', 6, 1, 5474, null, null, 0.0075, to_date('13-07-2020', 'dd-mm-yyyy'), to_date('01-01-2400', 'dd-mm-yyyy'), to_date('14-10-2020 13:58:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-01-2400', 'dd-mm-yyyy'));

insert into DWH.TREASURY_SPREAD (TREASURY_SPREAD_TYPE, CURRENCY_LETTER_CD, FIXFLOAT, CONTRACTS_TERMS_KEY, INTERVAL1_DAYS_FROM, INTERVAL1_DAYS_TO, INTERVAL2_DAYS_FROM, INTERVAL2_DAYS_TO, VALUE, START_DT, END_DT, VALID_FROM_DTTM, VALID_TO_DTTM)
values ('BARRIER', 'RUB', 'fix', 6, 1, 5474, null, null, 0.015, to_date('13-07-2020', 'dd-mm-yyyy'), to_date('01-01-2400', 'dd-mm-yyyy'), to_date('14-10-2020 13:58:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-01-2400', 'dd-mm-yyyy'));

insert into DWH.TREASURY_SPREAD (TREASURY_SPREAD_TYPE, CURRENCY_LETTER_CD, FIXFLOAT, CONTRACTS_TERMS_KEY, INTERVAL1_DAYS_FROM, INTERVAL1_DAYS_TO, INTERVAL2_DAYS_FROM, INTERVAL2_DAYS_TO, VALUE, START_DT, END_DT, VALID_FROM_DTTM, VALID_TO_DTTM)
values ('BARRIER', 'USD', 'fix', 1, 1, 5474, null, null, 0.0075, to_date('13-07-2020', 'dd-mm-yyyy'), to_date('01-01-2400', 'dd-mm-yyyy'), to_date('14-10-2020 13:58:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-01-2400', 'dd-mm-yyyy'));

insert into DWH.TREASURY_SPREAD (TREASURY_SPREAD_TYPE, CURRENCY_LETTER_CD, FIXFLOAT, CONTRACTS_TERMS_KEY, INTERVAL1_DAYS_FROM, INTERVAL1_DAYS_TO, INTERVAL2_DAYS_FROM, INTERVAL2_DAYS_TO, VALUE, START_DT, END_DT, VALID_FROM_DTTM, VALID_TO_DTTM)
values ('BARRIER', 'EUR', 'fix', 1, 1, 5474, null, null, 0.0075, to_date('13-07-2020', 'dd-mm-yyyy'), to_date('01-01-2400', 'dd-mm-yyyy'), to_date('14-10-2020 13:58:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-01-2400', 'dd-mm-yyyy'));

insert into DWH.TREASURY_SPREAD (TREASURY_SPREAD_TYPE, CURRENCY_LETTER_CD, FIXFLOAT, CONTRACTS_TERMS_KEY, INTERVAL1_DAYS_FROM, INTERVAL1_DAYS_TO, INTERVAL2_DAYS_FROM, INTERVAL2_DAYS_TO, VALUE, START_DT, END_DT, VALID_FROM_DTTM, VALID_TO_DTTM)
values ('BARRIER', 'RUB', 'fix', 1, 1, 5474, null, null, 0.015, to_date('13-07-2020', 'dd-mm-yyyy'), to_date('01-01-2400', 'dd-mm-yyyy'), to_date('14-10-2020 13:58:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-01-2400', 'dd-mm-yyyy'));

insert into DWH.TREASURY_SPREAD (TREASURY_SPREAD_TYPE, CURRENCY_LETTER_CD, FIXFLOAT, CONTRACTS_TERMS_KEY, INTERVAL1_DAYS_FROM, INTERVAL1_DAYS_TO, INTERVAL2_DAYS_FROM, INTERVAL2_DAYS_TO, VALUE, START_DT, END_DT, VALID_FROM_DTTM, VALID_TO_DTTM)
values ('BARRIER', 'RUB', 'fix', 2, 1, 5474, null, null, 0.015, to_date('13-07-2020', 'dd-mm-yyyy'), to_date('01-01-2400', 'dd-mm-yyyy'), to_date('14-10-2020 13:58:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-01-2400', 'dd-mm-yyyy'));

insert into DWH.TREASURY_SPREAD (TREASURY_SPREAD_TYPE, CURRENCY_LETTER_CD, FIXFLOAT, CONTRACTS_TERMS_KEY, INTERVAL1_DAYS_FROM, INTERVAL1_DAYS_TO, INTERVAL2_DAYS_FROM, INTERVAL2_DAYS_TO, VALUE, START_DT, END_DT, VALID_FROM_DTTM, VALID_TO_DTTM)
values ('BARRIER', 'EUR', 'fix', 2, 1, 5474, null, null, 0.0075, to_date('13-07-2020', 'dd-mm-yyyy'), to_date('01-01-2400', 'dd-mm-yyyy'), to_date('14-10-2020 13:58:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-01-2400', 'dd-mm-yyyy'));

insert into DWH.TREASURY_SPREAD (TREASURY_SPREAD_TYPE, CURRENCY_LETTER_CD, FIXFLOAT, CONTRACTS_TERMS_KEY, INTERVAL1_DAYS_FROM, INTERVAL1_DAYS_TO, INTERVAL2_DAYS_FROM, INTERVAL2_DAYS_TO, VALUE, START_DT, END_DT, VALID_FROM_DTTM, VALID_TO_DTTM)
values ('BARRIER', 'USD', 'fix', 2, 1, 5474, null, null, 0.0075, to_date('13-07-2020', 'dd-mm-yyyy'), to_date('01-01-2400', 'dd-mm-yyyy'), to_date('14-10-2020 13:58:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-01-2400', 'dd-mm-yyyy'));

insert into DWH.TREASURY_SPREAD (TREASURY_SPREAD_TYPE, CURRENCY_LETTER_CD, FIXFLOAT, CONTRACTS_TERMS_KEY, INTERVAL1_DAYS_FROM, INTERVAL1_DAYS_TO, INTERVAL2_DAYS_FROM, INTERVAL2_DAYS_TO, VALUE, START_DT, END_DT, VALID_FROM_DTTM, VALID_TO_DTTM)
values ('BARRIER', 'USD', 'fix', 3, 1, 5474, null, null, 0.0075, to_date('13-07-2020', 'dd-mm-yyyy'), to_date('01-01-2400', 'dd-mm-yyyy'), to_date('14-10-2020 13:58:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-01-2400', 'dd-mm-yyyy'));

insert into DWH.TREASURY_SPREAD (TREASURY_SPREAD_TYPE, CURRENCY_LETTER_CD, FIXFLOAT, CONTRACTS_TERMS_KEY, INTERVAL1_DAYS_FROM, INTERVAL1_DAYS_TO, INTERVAL2_DAYS_FROM, INTERVAL2_DAYS_TO, VALUE, START_DT, END_DT, VALID_FROM_DTTM, VALID_TO_DTTM)
values ('BARRIER', 'RUB', 'fix', 3, 1, 5474, null, null, 0.015, to_date('13-07-2020', 'dd-mm-yyyy'), to_date('01-01-2400', 'dd-mm-yyyy'), to_date('14-10-2020 13:58:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-01-2400', 'dd-mm-yyyy'));

insert into DWH.TREASURY_SPREAD (TREASURY_SPREAD_TYPE, CURRENCY_LETTER_CD, FIXFLOAT, CONTRACTS_TERMS_KEY, INTERVAL1_DAYS_FROM, INTERVAL1_DAYS_TO, INTERVAL2_DAYS_FROM, INTERVAL2_DAYS_TO, VALUE, START_DT, END_DT, VALID_FROM_DTTM, VALID_TO_DTTM)
values ('BARRIER', 'EUR', 'fix', 3, 1, 5474, null, null, 0.0075, to_date('13-07-2020', 'dd-mm-yyyy'), to_date('01-01-2400', 'dd-mm-yyyy'), to_date('14-10-2020 13:58:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-01-2400', 'dd-mm-yyyy'));

insert into DWH.TREASURY_SPREAD (TREASURY_SPREAD_TYPE, CURRENCY_LETTER_CD, FIXFLOAT, CONTRACTS_TERMS_KEY, INTERVAL1_DAYS_FROM, INTERVAL1_DAYS_TO, INTERVAL2_DAYS_FROM, INTERVAL2_DAYS_TO, VALUE, START_DT, END_DT, VALID_FROM_DTTM, VALID_TO_DTTM)
values ('BARRIER', 'USD', 'fix', 6, 1, 5474, null, null, 0.0075, to_date('13-07-2020', 'dd-mm-yyyy'), to_date('01-01-2400', 'dd-mm-yyyy'), to_date('14-10-2020 13:58:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-01-2400', 'dd-mm-yyyy'));

commit;