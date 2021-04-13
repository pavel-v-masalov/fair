drop table DWH.LEASROUTING_CRM_LEAD_TMP;

create table DWH.LEASROUTING_CRM_LEAD_TMP nologging as
select /*+ PARALLEL(4) */ opportunityid, countedon,
    LEADID,
    NEW_REF_ACCOUNTNAME,
    NEW_WEB
from
    (select row_number() over (partition by o.opportunityid, o.countedon order by l.timeslotstart desc) rn$,
         o.opportunityid, o.countedon,
         LEADID,
         NEW_REF_ACCOUNTNAME,
         NEW_WEB
     from DWH.CRM_LEAD l
     join DWH.LEASROUTING_OPPORTUNITY_TMP o on o.ORIGINATINGLEADID = l.leadid and l.timeslotstart < o.countedon
     where not l.timeslotstart is null
    ) where rn$ = 1
;

create index DWH.LEASROUTING_CRM_LEAD_TMP_i01 on DWH.LEASROUTING_CRM_LEAD_TMP (opportunityid, countedon) compress;

begin
    DBMS_STATS.GATHER_TABLE_STATS(ownname => 'DWH', tabname => 'LEASROUTING_CRM_LEAD_TMP', degree=>4);
end;
/
