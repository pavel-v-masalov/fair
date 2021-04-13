drop table DWH.LEASROUTING_NEW_HUMANDOCS_TMP;

create table DWH.LEASROUTING_NEW_HUMANDOCS_TMP nologging as
select /*+ PARALLEL(4) */ opportunityid, countedon,
    NEW_DOCNUMBER,
        NEW_DOCTYPE,
    NEW_DOCTYPENAME,
    NEW_SERIA,
    NEW_STARTDATE,
    NEW_WHENGIVE,
    NEW_WHOGIVE
from
    (select row_number() over (partition by c.opportunityid, c.countedon order by hd.timeslotstart desc) rn$,
         c.opportunityid, c.countedon,
         hd.NEW_DOCNUMBER,
         hd.NEW_DOCTYPE,
         hd.NEW_DOCTYPENAME,
         hd.NEW_SERIA,
         hd.NEW_STARTDATE,
         hd.NEW_WHENGIVE,
         hd.NEW_WHOGIVE
     from DWH.NEW_HUMANDOCS hd
     join DWH.LEASROUTING_CONTACT_TMP c on c.CONTACTID = hd.NEW_CONTACT and hd.timeslotstart < c.countedon
     where not hd.timeslotstart is null
    ) where rn$ = 1
;

create index DWH.LEASROUT_NEW_HUMANDOCS_TMP_i01 on DWH.LEASROUTING_NEW_HUMANDOCS_TMP (opportunityid, countedon) compress;

begin
    DBMS_STATS.GATHER_TABLE_STATS(ownname => 'DWH', tabname => 'LEASROUTING_NEW_HUMANDOCS_TMP', degree=>4);
end;
/
