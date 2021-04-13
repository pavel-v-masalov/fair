drop table DWH.LEASROUT_TASKNEW_10009_TMP;

create table DWH.LEASROUT_TASKNEW_10009_TMP nologging as
select /*+ PARALLEL(4) */ t.*, max(t.rn) over (partition by opportunityid, COUNTEDON) rn_m from (
   select
        r.opportunityid, r.COUNTEDON,
        row_number() over (partition by r.opportunityid, r.countedon order by 1 asc) rn,
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
where t.new_status = 100000002 and t.statecode = 1 and t.new_type = 100000009
  and (t.SUBJECT like '%���� �� ��%' or t.SUBJECT like  '%���� �� 4�� ������%') and VALID_TO_DTTM = to_date('2400-01-01', 'yyyy-mm-dd')
) t;

create index DWH.LEASROUT_TASKNEW_10009_TMP_i01 on DWH.LEASROUT_TASKNEW_10009_TMP(opportunityid, COUNTEDON, rn) compress 2;

begin
    DBMS_STATS.GATHER_TABLE_STATS(ownname => 'DWH', tabname => 'LEASROUT_TASKNEW_10009_TMP', degree=>4);
end;
/
