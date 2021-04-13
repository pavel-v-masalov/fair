drop table DWH.LEASROUTING_CONTACT_TMP;

create table DWH.LEASROUTING_CONTACT_TMP nologging as
select /*+ PARALLEL(4) */ opportunityid, countedon,
    BIRTHDATE,
    CONTACTID,
    FIRSTNAME,
    GENDERCODENAME,
    JOBTITLE,
    MIDDLENAME,
    MOBILEPHONE,
    NEW_ADDRESS,
    NEW_CONTACTTYPENAME,
    VTBL_SCORINGSCORE
from
    (select row_number() over (partition by a.opportunityid, a.countedon order by c.timeslotstart desc) rn$,
         a.opportunityid, a.countedon,
         c.BIRTHDATE,
         c.CONTACTID,
         c.FIRSTNAME,
         c.GENDERCODENAME,
         c.JOBTITLE,
         c.MIDDLENAME,
         c.MOBILEPHONE,
         c.NEW_ADDRESS,
         c.NEW_CONTACTTYPENAME,
         c.VTBL_SCORINGSCORE
     from DWH.CONTACT c
     join DWH.LEASROUTING_ACCOUNT_TMP a on a.PRIMARYCONTACTID = c.CONTACTID and c.timeslotstart < a.countedon
     where not c.timeslotstart is null
    ) where rn$ = 1
;

create index DWH.LEASROUTING_CONTACT_TMP_i01 on DWH.LEASROUTING_CONTACT_TMP (opportunityid, countedon) compress;

begin
    DBMS_STATS.GATHER_TABLE_STATS(ownname => 'DWH', tabname => 'LEASROUTING_CONTACT_TMP', degree=>4);
end;
/
