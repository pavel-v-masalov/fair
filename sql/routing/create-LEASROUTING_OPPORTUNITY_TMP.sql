drop table DWH.LEASROUTING_OPPORTUNITY_TMP;

create table DWH.LEASROUTING_OPPORTUNITY_TMP nologging as
select /*+ PARALLEL(4) */ opportunityid, countedon,
       customerid,
       ORIGINATINGLEADID,
       NEW_AGENTID,
       NEW_ALLEXPRETISETASKSCLOSED,
       NEW_APPROVALRESULTNAME,
       NEW_FACTADRESS,
       NEW_LEASAGREEMENTCONDCONFIRMED,
      NEW_NONFINANCIAL,
      NEW_OPT,
      NEW_PODPRODUCTNAME,
      NEW_PRODUCTIDNAME,
      NEW_PROPERTYRISK,
      NEW_ROUTINGBYMODEL,
      NEW_STATUSCODEIDNAME,
      NEW_TOTALFINANCINGSUM,
      NEW_TOTALFINANCINGSUM_EXPRESS,
      NEW_TOTALSUMDEALPERIOD
  from
    (select row_number() over (partition by r.opportunityid, r.countedon order by o.timeslotstart desc) rn$,
         r.opportunityid, r.countedon,
         o.customerid,
         o.ORIGINATINGLEADID,
         o.NEW_AGENTID,
         o.NEW_ALLEXPRETISETASKSCLOSED,
         o.NEW_APPROVALRESULTNAME,
         o.NEW_FACTADRESS,
         o.NEW_LEASAGREEMENTCONDCONFIRMED,
         o.NEW_NONFINANCIAL,
         o.NEW_OPT,
         o.NEW_PODPRODUCTNAME,
         o.NEW_PRODUCTIDNAME,
         o.NEW_PROPERTYRISK,
         o.NEW_ROUTINGBYMODEL,
         o.NEW_STATUSCODEIDNAME,
         o.NEW_TOTALFINANCINGSUM,
         o.NEW_TOTALFINANCINGSUM_EXPRESS,
         o.NEW_TOTALSUMDEALPERIOD
     from DWH.OPPORTUNITY o
     join DWH.LEASROUTING_RMD_TMP r on r.opportunityid = o.opportunityid and o.timeslotstart < r.countedon
     where not o.timeslotstart is null
    ) where rn$ = 1
;

create index DWH.LEASROUT_OPPORTUNITY_TMP_i01 on DWH.LEASROUTING_OPPORTUNITY_TMP (opportunityid, countedon) compress;

begin
    DBMS_STATS.GATHER_TABLE_STATS(ownname => 'DWH', tabname => 'LEASROUTING_OPPORTUNITY_TMP', degree=>4);
end;
/
