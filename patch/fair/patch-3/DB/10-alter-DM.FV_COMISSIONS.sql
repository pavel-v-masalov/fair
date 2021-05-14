update DM.FV_COMISSIONS set period_name = null;
commit;
alter table DM.FV_COMISSIONS modify period_name varchar2(100);
