alter table DWH.ROE drop column username;
alter table DWH.ROE add file_id number;
alter table DWH.DIRECT_COST_RATES drop column username;
alter table DWH.DIRECT_COST_RATES add file_id number;
alter table DWH.MAINTENENCE_COST_RATES drop column username;
alter table DWH.MAINTENENCE_COST_RATES add file_id number;
