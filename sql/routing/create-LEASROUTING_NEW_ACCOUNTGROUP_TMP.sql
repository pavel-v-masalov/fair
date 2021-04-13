drop table DWH.LEASROUT_NEW_ACCOUNTGROUP_TMP;

create table DWH.LEASROUT_NEW_ACCOUNTGROUP_TMP nologging as
select /*+ PARALLEL(4) */ opportunityid, countedon,
    NEW_ACCOUNTGROUPID,
        NEW_NAME
from
    (select row_number() over (partition by a.opportunityid, a.countedon order by ag.timeslotstart desc) rn$,
         a.opportunityid, a.countedon,
         ag.NEW_ACCOUNTGROUPID,
             ag.NEW_NAME
     from DWH.NEW_ACCOUNTGROUP ag
     join DWH.LEASROUTING_ACCOUNT_TMP a on a.NEW_ACCOUNTGROUPID = ag.NEW_ACCOUNTGROUPID and ag.timeslotstart < a.countedon
     where not ag.timeslotstart is null
    ) where rn$ = 1
;

create index DWH.LEASROUT_NEW_ACCOUNTGR_TMP_i01 on DWH.LEASROUT_NEW_ACCOUNTGROUP_TMP (opportunityid, countedon) compress;

begin
    DBMS_STATS.GATHER_TABLE_STATS(ownname => 'DWH', tabname => 'LEASROUT_NEW_ACCOUNTGROUP_TMP', degree=>4);
end;
/
