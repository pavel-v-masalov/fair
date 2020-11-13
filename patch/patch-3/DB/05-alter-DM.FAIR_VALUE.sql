alter table DM.FAIR_VALUE add MSFO_BALANCE_DEBT_AMT number;
alter table DM.FAIR_VALUE add COMISSION_AMT number;
comment on column DM.FAIR_VALUE.MSFO_BALANCE_DEBT_AMT is 'Задолженность по графику МСФО';
comment on column DM.FAIR_VALUE.COMISSION_AMT is 'Комиссия за организацию сделки';
alter table DM.FAIR_VALUE add FV_MSFO_V number;
comment on column DM.FAIR_VALUE.FV_MSFO_V is 'Справедливая ставка МСФО';
