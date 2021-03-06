drop table DWH.LEASROUT_TASKNEW_100032OD_TMP;

create table DWH.LEASROUT_TASKNEW_100032OD_TMP nologging as
select /*+ PARALLEL(4) */ t.*, max(t.rn) over (partition by opportunityid, COUNTEDON) rn_m,
       case when CREATEDON >= COUNTEDON and CREATEDON < COUNTEDON2 then 1 else 0 end start_flg,
       case when ACTUALEND >= COUNTEDON and ACTUALEND < COUNTEDON2 then 1 else 0 end end_flg
from (
   select
        r.opportunityid, r.COUNTEDON,r.countedon2,
        row_number() over (partition by r.opportunityid, r.countedon order by 1 asc) rn,
       ACTIVITYID,
        ACTUALEND,
        ACTUALSTART,
        CREATEDON,
        NEW_APPROVALRESULT,
        NEW_APPROVALRESULTNAME,
        NEW_COMMENTS,
        NEW_COUNTER_FULLTIME,
        NEW_COUNTER_WORKTIME,
        NEW_HISTORY,
        NEW_TYPE,
        NEW_TYPENAME,
        NEW_UZDL
   from DWH.TASKNEW t
   join DWH.LEASROUTING_RMD_TMP r on r.opportunityid = t.regardingobjectid
    and ((t.ACTUALEND >= r.COUNTEDON and t.ACTUALEND < r.COUNTEDON2) or (t.CREATEDON >= r.COUNTEDON and t.CREATEDON < r.COUNTEDON2))
where t.new_status = 100000002 and t.statecode = 1 and t.new_type = 100000032 and VALID_TO_DTTM = to_date('2400-01-01', 'yyyy-mm-dd')
  and (t.SUBJECT like '%�� %' OR t.SUBJECT like '%���������%' OR t.SUBJECT like '%�������� ���������%')
) t;

create index DWH.LEASROUT_TASKN_10032OD_TMP_i01 on DWH.LEASROUT_TASKNEW_100032OD_TMP(opportunityid, COUNTEDON, rn) compress 2;

begin
    DBMS_STATS.GATHER_TABLE_STATS(ownname => 'DWH', tabname => 'LEASROUT_TASKNEW_100032OD_TMP', degree=>4);
end;
/
