select * from DWH.ACCOUNT;
select count(1) from DWH.OPPORTUNITY;
select count(1) from DWH.OPPORTUNITY_1;
select * from DWH.RELLGROUP;
select * from DWH.NEW_ACCOUNTGROUP;
select * from DWH.CONTACT;
select * from DWH.CRM_LEAD;
select * from DWH.NEW_HUMANDOCS;
select * from DWH.RMD;
select count(1) from DWH.RMD_old;
select * from DWH.TASKNEW;


select * from DM.LEASROUTING_MODELS;
--truncate table DM.LEASROUTING_MODELS; 


VALID_TO_DTTM = to_date('2400-01-01', 'yyyy-mm-dd')

WITH Factorial (operand,total_so_far) AS
(SELECT 5 operand, 5 total_so_far FROM dual    -- Using anchor member to pass in "5"
UNION ALL
SELECT operand-1, total_so_far * (operand-1) FROM Factorial
WHERE operand > 1)
SELECT * FROM Factorial;


select * from all_synonyms where owner='DWH' and synonym_name like 'RMD%';

create or replace synonym DM.RMD_S for DWH.RMD_1
create table DWH.RMD_OLD as select * from DWH.RMD
----drop table DWH.RMD
create table DWH.RMD as select * from DWH.RMD_1
