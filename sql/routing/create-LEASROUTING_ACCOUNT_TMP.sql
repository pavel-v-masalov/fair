drop table DWH.LEASROUTING_ACCOUNT_TMP;

create table DWH.LEASROUTING_ACCOUNT_TMP nologging as
select /*+ PARALLEL(4) */ opportunityid, countedon,
    ACCOUNTID,
    CREATEDON,
    EMAILADDRESS1,
    INDUSTRYCODENAME,
    NAME,
    NEW_ACCOUNTINDUCTRYNAME,
    NEW_ACCOUNTGROUPID,
    NEW_BLACK_LIST_DATE,
    NEW_CEOCHANGENAME,
    NEW_CHEKVERIFICATION,
    NEW_COMPANYSITE,
    NEW_EXPLOITATIONPL1,
    NEW_INCIDENTSOURCENAME,
    NEW_INN,
    NEW_KY_CUSTOMER,
    NEW_KY_SPESHLPR,
    NEW_LEGALORGANIZATIONALFORMNAM,
    NEW_MOBILEPHONE,
    NEW_OGRN,
    NEW_OKVEDIDNAME,
    NEW_PHYSICALINN,
    NEW_REGISTRATIONADDRESS,
    NEW_REGISTRATIONDATE,
    PRIMARYCONTACTID,
    PRIMARYCONTACTIDNAME,
    WEBSITEURL
from
    (select row_number() over (partition by o.opportunityid, o.countedon order by timeslotstart desc) rn$,
         o.opportunityid, o.countedon,
        a.ACCOUNTID,
        a.CREATEDON,
        a.EMAILADDRESS1,
        a.INDUSTRYCODENAME,
        a.NAME,
        a.NEW_ACCOUNTINDUCTRYNAME,
        a.NEW_ACCOUNTGROUPID,
        a.NEW_BLACK_LIST_DATE,
        a.NEW_CEOCHANGENAME,
        a.NEW_CHEKVERIFICATION,
        a.NEW_COMPANYSITE,
        a.NEW_EXPLOITATIONPL1,
        a.NEW_INCIDENTSOURCENAME,
        a.NEW_INN,
        a.NEW_KY_CUSTOMER,
        a.NEW_KY_SPESHLPR,
        a.NEW_LEGALORGANIZATIONALFORMNAM,
        a.NEW_MOBILEPHONE,
        a.NEW_OGRN,
        a.NEW_OKVEDIDNAME,
        a.NEW_PHYSICALINN,
        a.NEW_REGISTRATIONADDRESS,
        a.NEW_REGISTRATIONDATE,
        a.PRIMARYCONTACTID,
        a.PRIMARYCONTACTIDNAME,
        a.WEBSITEURL
     from DWH.ACCOUNT a
     join DWH.LEASROUTING_OPPORTUNITY_TMP o on o.CUSTOMERID = a.ACCOUNTID and a.timeslotstart < o.countedon
     where not a.timeslotstart is null
    ) where rn$ = 1
;

create index DWH.LEASROUTING_ACCOUNT_TMP_i01 on DWH.LEASROUTING_ACCOUNT_TMP (opportunityid, countedon) compress;

begin
    DBMS_STATS.GATHER_TABLE_STATS(ownname => 'DWH', tabname => 'LEASROUTING_ACCOUNT_TMP', degree=>4);
end;
/
