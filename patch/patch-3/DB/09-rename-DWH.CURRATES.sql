alter table DWH.CURRATES rename column Curr to currency_letter_cd;
alter table DWH.CURRATES rename column denj to report_dt;
alter table DWH.CURRATES rename column rateperiod to day_cnt;
alter table DWH.CURRATES rename column ratename to fixfloat;
