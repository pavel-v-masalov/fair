drop table DWH.LEASROUTING_RELLGROUP_TMP;

create table DWH.LEASROUTING_RELLGROUP_TMP nologging as
select /*+ PARALLEL(4) */ opportunityid, countedon,
    RELGROUPS,
    RELMAX
from
    (select row_number() over (partition by a.opportunityid, a.countedon order by rg.timeslotstart desc) rn$,
         a.opportunityid, a.countedon,
         RELGROUPS,
            RELMAX
     from DWH.RELLGROUP rg
     join DWH.LEASROUTING_ACCOUNT_TMP a on a.accountid = rg.accountid and rg.timeslotstart < a.countedon
     where not rg.timeslotstart is null
    ) where rn$ = 1
;

create index DWH.LEASROUTING_RELLGROUP_TMP_i01 on DWH.LEASROUTING_RELLGROUP_TMP (opportunityid, countedon) compress;

begin
    DBMS_STATS.GATHER_TABLE_STATS(ownname => 'DWH', tabname => 'LEASROUTING_RELLGROUP_TMP', degree=>4);
end;
/
