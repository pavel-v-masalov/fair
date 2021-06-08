create or replace procedure DM.P_LEASROUTING_MODELS_CALC (p_SNAPSHOT_DT date default trunc(sysdate), p_develop_mode boolean default false) is
    GC_PROC_NAME constant varchar2(100) := 'DM.P_LEASROUTING_MODELS_CALC';

procedure truncate_table (p_owner varchar2, p_table varchar2) is
begin
    for r in (select 1 from all_tables where owner = p_owner and table_name = p_table) loop
        execute immediate 'truncate table '||p_owner||'.'||p_table;
    end loop;
end;

procedure drop_table (p_owner varchar2, p_table varchar2) is
begin
    for r in (select 1 from all_tables where owner = p_owner and table_name = p_table) loop
        execute immediate 'drop table '||p_owner||'.'||p_table;
    end loop;
end;

procedure create_RMD_TMP is
begin
    dbms_application_info.set_action(action_name => 'create_RMD_TMP');
    drop_table('DWH','LEASROUTING_RMD_TMP');
    execute immediate q'!
    create table DWH.LEASROUTING_RMD_TMP NOLOGGING as
    select /*+ PARALLEL(4) */ min(r.opportunityname) KEEP (DENSE_RANK FIRST ORDER BY opportunityname nulls last) opportunityname, r.opportunityid, r.countedon,
           nvl(lead(r.countedon, 1) over(partition by r.opportunityid order by r.countedon),to_date('2400-01-01', 'yyyy-mm-dd')) countedon2,
        MIN(CREDITMODELISCOUNTABLE) KEEP (DENSE_RANK FIRST ORDER BY CREDITMODELISCOUNTABLE nulls last) CREDITMODELISCOUNTABLE,
        MIN(FINANCESUM) KEEP (DENSE_RANK FIRST ORDER BY FINANCESUM nulls last) FINANCESUM,
        MIN(CREDITMODELRESULT) KEEP (DENSE_RANK FIRST ORDER BY CREDITMODELRESULT nulls last) CREDITMODELRESULT,
        MIN(NEW_FINANCESUM) KEEP (DENSE_RANK FIRST ORDER BY NEW_FINANCESUM nulls last) NEW_FINANCESUM,
        MIN(FRAUDMODELRESULT) KEEP (DENSE_RANK FIRST ORDER BY FRAUDMODELRESULT nulls last) FRAUDMODELRESULT,
        MIN(OPPORTUNITYCREDITRESULT) KEEP (DENSE_RANK FIRST ORDER BY OPPORTUNITYCREDITRESULT nulls last) OPPORTUNITYCREDITRESULT,
        MIN(OPPORTUNITYFRAUDRESULT) KEEP (DENSE_RANK FIRST ORDER BY OPPORTUNITYFRAUDRESULT nulls last) OPPORTUNITYFRAUDRESULT,
        MIN(PRODUCTOP) KEEP (DENSE_RANK FIRST ORDER BY PRODUCTOP nulls last) PRODUCTOP,
        MIN(SCORINGSCORE) KEEP (DENSE_RANK FIRST ORDER BY SCORINGSCORE nulls last) SCORINGSCORE,
        MIN(MODEL_TYPE) KEEP (DENSE_RANK FIRST ORDER BY MODEL_TYPE nulls last) MODEL_TYPE,
        MIN(calc_conditions) KEEP (DENSE_RANK FIRST ORDER BY calc_conditions nulls last) calc_conditions,
        MIN(ISPRESCORINGCALL) KEEP (DENSE_RANK FIRST ORDER BY ISPRESCORINGCALL nulls last) ISPRESCORINGCALL,
        MIN(model_settings) KEEP (DENSE_RANK FIRST ORDER BY model_settings nulls last) model_settings
      from DWH.RMD r
     group by r.opportunityid, r.countedon
    !';
    execute immediate 'create index DWH.LEASROUTING_RMD_TMP_i01 on DWH.LEASROUTING_RMD_TMP(opportunityid) compress';
    DBMS_STATS.GATHER_TABLE_STATS(ownname => 'DWH', tabname => 'LEASROUTING_RMD_TMP', degree=>4);
exception
    when others then
        dm.u_log('create_RMD_TMP', 'error' ,sqlerrm);
        raise;
end;

procedure create_OPPORTUNITY_TMP is
begin
    dbms_application_info.set_action(action_name => 'create_OPPORTUNITY_TMP');
    drop_table('DWH', 'LEASROUTING_OPPORTUNITY_TMP');
    execute immediate q'!
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
    !';
    execute immediate 'create index DWH.LEASROUT_OPPORTUNITY_TMP_i01 on DWH.LEASROUTING_OPPORTUNITY_TMP (opportunityid, countedon) compress';
    DBMS_STATS.GATHER_TABLE_STATS(ownname => 'DWH', tabname => 'LEASROUTING_OPPORTUNITY_TMP', degree=>4);
exception
    when others then
        dm.u_log('create_OPPORTUNITY_TMP', 'error' ,sqlerrm);
        raise;
end;

procedure create_ACCOUNT_TMP is
begin
    dbms_application_info.set_action(action_name => 'create_ACCOUNT_TMP');
    drop_table('DWH','LEASROUTING_ACCOUNT_TMP');
    execute immediate q'!
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
    !';
    execute immediate 'create index DWH.LEASROUTING_ACCOUNT_TMP_i01 on DWH.LEASROUTING_ACCOUNT_TMP (opportunityid, countedon) compress';
    DBMS_STATS.GATHER_TABLE_STATS(ownname => 'DWH', tabname => 'LEASROUTING_ACCOUNT_TMP', degree=>4);
exception
    when others then
        dm.u_log('create_ACCOUNT_TMP', 'error' ,sqlerrm);
        raise;
end;

procedure create_CONTACT_TMP is
begin
    dbms_application_info.set_action(action_name => 'create_CONTACT_TMP');
    drop_table('DWH','LEASROUTING_CONTACT_TMP');
    execute immediate q'!
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
    !';
    execute immediate 'create index DWH.LEASROUTING_CONTACT_TMP_i01 on DWH.LEASROUTING_CONTACT_TMP (opportunityid, countedon) compress';
    DBMS_STATS.GATHER_TABLE_STATS(ownname => 'DWH', tabname => 'LEASROUTING_CONTACT_TMP', degree=>4);
exception
    when others then
        dm.u_log('create_CONTACT_TMP', 'error' ,sqlerrm);
        raise;
end;

procedure create_CRM_LEAD_TMP is
begin
    dbms_application_info.set_action(action_name => 'create_CRM_LEAD_TMP');
    drop_table('DWH','LEASROUTING_CRM_LEAD_TMP');
    execute immediate q'!
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
    !';
    execute immediate 'create index DWH.LEASROUTING_CRM_LEAD_TMP_i01 on DWH.LEASROUTING_CRM_LEAD_TMP (opportunityid, countedon) compress';
    DBMS_STATS.GATHER_TABLE_STATS(ownname => 'DWH', tabname => 'LEASROUTING_CRM_LEAD_TMP', degree=>4);
exception
    when others then
        dm.u_log('create_CRM_LEAD_TMP', 'error' ,sqlerrm);
        raise;
end;

procedure create_NEW_ACCOUNTGROUP_TMP is
begin
    dbms_application_info.set_action(action_name => 'create_NEW_ACCOUNTGROUP_TMP');
    drop_table('DWH','LEASROUT_NEW_ACCOUNTGROUP_TMP');
    execute immediate q'!
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
    !';
    execute immediate 'create index DWH.LEASROUT_NEW_ACCOUNTGR_TMP_i01 on DWH.LEASROUT_NEW_ACCOUNTGROUP_TMP (opportunityid, countedon) compress';
    DBMS_STATS.GATHER_TABLE_STATS(ownname => 'DWH', tabname => 'LEASROUT_NEW_ACCOUNTGROUP_TMP', degree=>4);
exception
    when others then
        dm.u_log('create_NEW_ACCOUNTGROUP_TMP', 'error' ,sqlerrm);
        raise;
end;

procedure create_NEW_HUMANDOCS_TMP is
begin
    dbms_application_info.set_action(action_name => 'create_NEW_HUMANDOCS_TMP');
    drop_table('DWH','LEASROUTING_NEW_HUMANDOCS_TMP');
    execute immediate q'!
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
    !';
    execute immediate 'create index DWH.LEASROUT_NEW_HUMANDOCS_TMP_i01 on DWH.LEASROUTING_NEW_HUMANDOCS_TMP (opportunityid, countedon) compress';
    DBMS_STATS.GATHER_TABLE_STATS(ownname => 'DWH', tabname => 'LEASROUTING_NEW_HUMANDOCS_TMP', degree=>4);
exception
    when others then
        dm.u_log('create_NEW_HUMANDOCS_TMP', 'error' ,sqlerrm);
        raise;
end;

procedure create_RELLGROUP_TMP is
begin
    dbms_application_info.set_action(action_name => 'create_RELLGROUP_TMP');
    drop_table('DWH','LEASROUTING_RELLGROUP_TMP');
    execute immediate q'!
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
    !';
    execute immediate 'create index DWH.LEASROUTING_RELLGROUP_TMP_i01 on DWH.LEASROUTING_RELLGROUP_TMP (opportunityid, countedon) compress';
    DBMS_STATS.GATHER_TABLE_STATS(ownname => 'DWH', tabname => 'LEASROUTING_RELLGROUP_TMP', degree=>4);
exception
    when others then
        dm.u_log('create_RELLGROUP_TMP', 'error' ,sqlerrm);
        raise;
end;

procedure create_TASKNEW_10009_TMP is
begin
    dbms_application_info.set_action(action_name => 'create_TASKNEW_10009_TMP');
    drop_table('DWH', 'LEASROUT_TASKNEW_10009_TMP');
    execute immediate q'!
    create table DWH.LEASROUT_TASKNEW_10009_TMP nologging as
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
    where t.new_status = 100000002 and t.statecode = 1 and t.new_type = 100000009
      and (t.SUBJECT like '%КЛАС по ЛС%' or t.SUBJECT like  '%КЛАС по 4ой группе%') and VALID_TO_DTTM = to_date('2400-01-01', 'yyyy-mm-dd')
    ) t
    !';
    execute immediate 'create index DWH.LEASROUT_TASKNEW_10009_TMP_i01 on DWH.LEASROUT_TASKNEW_10009_TMP(opportunityid, COUNTEDON, rn) compress 2';
    DBMS_STATS.GATHER_TABLE_STATS(ownname => 'DWH', tabname => 'LEASROUT_TASKNEW_10009_TMP', degree=>4);
exception
    when others then
        dm.u_log('create_TASKNEW_10009_TMP', 'error' ,sqlerrm);
        raise;
end;

procedure create_TASKNEW_10009KUF_TMP is
begin
    dbms_application_info.set_action(action_name => 'create_TASKNEW_10009KUF_TMP');
    drop_table('DWH', 'LEASROUT_TASKNEW_10009KUF_TMP');
    execute immediate q'!
    create table DWH.LEASROUT_TASKNEW_10009KUF_TMP nologging as
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
    where t.new_status = 100000002 and t.statecode = 1 and t.new_type = 100000009
      and (t.SUBJECT like '%КУФР%' and t.SUBJECT like '%Одобрение%') and VALID_TO_DTTM = to_date('2400-01-01', 'yyyy-mm-dd')
    ) t
    !';
    execute immediate 'create index DWH.LEASROUT_TASK_10009KUF_TMP_i01 on DWH.LEASROUT_TASKNEW_10009KUF_TMP(opportunityid, COUNTEDON, rn) compress 2';
    DBMS_STATS.GATHER_TABLE_STATS(ownname => 'DWH', tabname => 'LEASROUT_TASKNEW_10009KUF_TMP', degree=>4);
exception
    when others then
        dm.u_log('create_TASKNEW_10009KUF_TMP', 'error' ,sqlerrm);
        raise;
end;

procedure create_TASKNEW_10011_TMP is
begin
    dbms_application_info.set_action(action_name => 'create_TASKNEW_10011_TMP');
    drop_table('DWH', 'LEASROUT_TASKNEW_10011_TMP');
    execute immediate q'!
    create table DWH.LEASROUT_TASKNEW_10011_TMP nologging as
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
    where t.new_status = 100000002 and t.statecode = 1 and (t.new_type = 100000011 or t.new_type = 100000028) and VALID_TO_DTTM = to_date('2400-01-01', 'yyyy-mm-dd')
    ) t
    !';
    execute immediate 'create index DWH.LEASROUT_TASKNEW_10011_TMP_i01 on DWH.LEASROUT_TASKNEW_10011_TMP(opportunityid, COUNTEDON, rn) compress 2';
    DBMS_STATS.GATHER_TABLE_STATS(ownname => 'DWH', tabname => 'LEASROUT_TASKNEW_10011_TMP', degree=>4);
exception
    when others then
        dm.u_log('create_TASKNEW_10011_TMP', 'error' ,sqlerrm);
        raise;
end;

procedure create_TASKNEW_10015_TMP is
begin
    dbms_application_info.set_action(action_name => 'create_TASKNEW_10015_TMP');
    drop_table('DWH', 'LEASROUT_TASKNEW_10015_TMP');
    execute immediate q'!
    create table DWH.LEASROUT_TASKNEW_10015_TMP nologging as
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
            modifiedon,
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
    where t.new_status = 100000002 and t.statecode = 1 and (t.new_type = 100000015 or t.new_type = 100000026) and VALID_TO_DTTM = to_date('2400-01-01', 'yyyy-mm-dd')
    ) t
    !';
    execute immediate 'create index DWH.LEASROUT_TASKNEW_10015_TMP_i01 on DWH.LEASROUT_TASKNEW_10015_TMP(opportunityid, COUNTEDON, rn) compress 2';
    DBMS_STATS.GATHER_TABLE_STATS(ownname => 'DWH', tabname => 'LEASROUT_TASKNEW_10015_TMP', degree=>4);
exception
    when others then
        dm.u_log('create_TASKNEW_10015_TMP', 'error' ,sqlerrm);
        raise;
end;

procedure create_TASKNEW_10016_TMP is
begin
    dbms_application_info.set_action(action_name => 'create_TASKNEW_10016_TMP');
    drop_table('DWH','LEASROUT_TASKNEW_10016_TMP');
    execute immediate q'!
    create table DWH.LEASROUT_TASKNEW_10016_TMP nologging as
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
        where t.new_status = 100000002 and t.statecode = 1 and t.new_type = 100000016 and VALID_TO_DTTM = to_date('2400-01-01', 'yyyy-mm-dd')
    ) t
    !';
    execute immediate 'create index DWH.LEASROUT_TASKNEW_10016_TMP_i01 on DWH.LEASROUT_TASKNEW_10016_TMP(opportunityid, COUNTEDON, rn) compress 2';
    DBMS_STATS.GATHER_TABLE_STATS(ownname => 'DWH', tabname => 'LEASROUT_TASKNEW_10016_TMP', degree=>4);
exception
    when others then
        dm.u_log('create_TASKNEW_10016_TMP', 'error' ,sqlerrm);
        raise;
end;

procedure create_TASKNEW_10029_TMP is
begin
    dbms_application_info.set_action(action_name => 'create_TASKNEW_10029_TMP');
    drop_table('DWH', 'LEASROUT_TASKNEW_10029_TMP');
    execute immediate q'!
    create table DWH.LEASROUT_TASKNEW_10029_TMP nologging as
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
        where t.new_status = 100000002 and t.statecode = 1 and t.new_type = 100000029 and VALID_TO_DTTM = to_date('2400-01-01', 'yyyy-mm-dd')
    ) t
    !';
    execute immediate 'create index DWH.LEASROUT_TASKNEW_10029_TMP_i01 on DWH.LEASROUT_TASKNEW_10029_TMP(opportunityid, COUNTEDON, rn) compress 2';
    DBMS_STATS.GATHER_TABLE_STATS(ownname => 'DWH', tabname => 'LEASROUT_TASKNEW_10029_TMP', degree=>4);
exception
    when others then
        dm.u_log('create_TASKNEW_10029_TMP', 'error' ,sqlerrm);
        raise;
end;

procedure create_TASKNEW_10031_TMP is
begin
    dbms_application_info.set_action(action_name => 'create_TASKNEW_10031_TMP');
    drop_table('DWH','LEASROUT_TASKNEW_10031_TMP');
    execute immediate q'!
    create table DWH.LEASROUT_TASKNEW_10031_TMP nologging as
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
        where t.new_status = 100000002 and t.statecode = 1 and t.new_type = 100000031 and VALID_TO_DTTM = to_date('2400-01-01', 'yyyy-mm-dd')
    ) t
    !';
    execute immediate 'create index DWH.LEASROUT_TASKNEW_10031_TMP_i01 on DWH.LEASROUT_TASKNEW_10031_TMP(opportunityid, COUNTEDON, rn) compress 2';
    DBMS_STATS.GATHER_TABLE_STATS(ownname => 'DWH', tabname => 'LEASROUT_TASKNEW_10031_TMP', degree=>4);
exception
    when others then
        dm.u_log('create_TASKNEW_10031_TMP', 'error' ,sqlerrm);
        raise;
end;

procedure create_TASKNEW_100032_TMP is
begin
    dbms_application_info.set_action(action_name => 'create_TASKNEW_100032_TMP');
    drop_table('DWH','LEASROUT_TASKNEW_100032_TMP');
    execute immediate q'!
    create table DWH.LEASROUT_TASKNEW_100032_TMP nologging as
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
        where t.new_status = 100000002 and t.statecode = 1 and t.new_type = 100000045 and VALID_TO_DTTM = to_date('2400-01-01', 'yyyy-mm-dd')
          and (t.SUBJECT like '%ПИ %' OR t.SUBJECT like '%Повторное%' OR t.SUBJECT like '%Протокол изменений%')
    ) t
    !';
    execute immediate 'create index DWH.LEASROUT_TASKNEW_10032_TMP_i01 on DWH.LEASROUT_TASKNEW_100032_TMP(opportunityid, COUNTEDON, rn) compress 2';
    DBMS_STATS.GATHER_TABLE_STATS(ownname => 'DWH', tabname => 'LEASROUT_TASKNEW_100032_TMP', degree=>4);
exception
    when others then
        dm.u_log('create_TASKNEW_100032_TMP', 'error' ,sqlerrm);
        raise;
end;

procedure create_TASKNEW_100032OD_TMP is
begin
    dbms_application_info.set_action(action_name => 'create_TASKNEW_100032OD_TMP');
    drop_table('DWH','LEASROUT_TASKNEW_100032OD_TMP');
    execute immediate q'!
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
          and (t.SUBJECT like '%ПИ %' OR t.SUBJECT like '%Повторное%' OR t.SUBJECT like '%Протокол изменений%')
    ) t
    !';
    execute immediate 'create index DWH.LEASROUT_TASKN_10032OD_TMP_i01 on DWH.LEASROUT_TASKNEW_100032OD_TMP(opportunityid, COUNTEDON, rn) compress 2';
    DBMS_STATS.GATHER_TABLE_STATS(ownname => 'DWH', tabname => 'LEASROUT_TASKNEW_100032OD_TMP', degree=>4);
exception
    when others then
        dm.u_log('create_TASKNEW_100032OD_TMP', 'error' ,sqlerrm);
        raise;
end;

procedure create_TASKNEW_100000045_TMP is
begin
    dbms_application_info.set_action(action_name => 'create_TASKNEW_100000045_TMP');
    drop_table('DWH','LEASROUT_TASKNEW_100000045_TMP');
    execute immediate q'!
    create table DWH.LEASROUT_TASKNEW_100000045_TMP nologging as
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
            modifiedon,
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
        where t.new_status = 100000002 and t.statecode = 1 and t.new_type = 100000045 and VALID_TO_DTTM = to_date('2400-01-01', 'yyyy-mm-dd')
          and not (t.subject like '%ПИ %' or t.subject like '%Повторное%' or t.subject like '%Протокол изменений%')
    ) t
    !';
    execute immediate 'create index DWH.LEASROUT_TASKNEW_10045_TMP_i01 on DWH.LEASROUT_TASKNEW_100000045_TMP(opportunityid, COUNTEDON, rn) compress 2';
    DBMS_STATS.GATHER_TABLE_STATS(ownname => 'DWH', tabname => 'LEASROUT_TASKNEW_100000045_TMP', degree=>4);
exception
    when others then
        dm.u_log('create_TASKNEW_100000045_TMP', 'error' ,sqlerrm);
        raise;
end;

procedure insert_LEASROUTING_MODELS is
begin
    dbms_application_info.set_action(action_name => 'insert_LEASROUTING_MODELS');
    execute immediate 'delete from DM.LEASROUTING_MODELS where SNAPSHOT_DT = :p_SNAPSHOT_DT' using p_SNAPSHOT_DT;
    execute immediate q'!
    insert /*+ append sys_dl_cursor nologging */ into DM.LEASROUTING_MODELS
    (
        SNAPSHOT_DT,
        opportunityid,
        ACCOUNTID,
        CREATEDON,
        EMAILADDRESS1,
        INDUSTRYCODENAME,
        ORGNAME,
        NEW_ACCOUNTINDUCTRYNAME,
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
        WEBSITEURL,
        RELGROUPS,
        RELMAX,
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
        NEW_TOTALSUMDEALPERIOD,
        NEW_ACCOUNTGROUPID,
        NEW_NAME,
        BIRTHDATE,
        CONTACTID,
        FIRSTNAME,
        GENDERCODENAME,
        JOBTITLE,
        MIDDLENAME,
        MOBILEPHONE,
        NEW_ADDRESS,
        NEW_CONTACTTYPENAME,
        VTBL_SCORINGSCORE,
        NEW_DOCNUMBER,
        NEW_DOCTYPE,
        NEW_DOCTYPENAME,
        NEW_SERIA,
        NEW_STARTDATE,
        NEW_WHENGIVE,
        NEW_WHOGIVE,
        LEADID,
        NEW_REF_ACCOUNTNAME,
        NEW_WEB,
        COUNTEDON,
        CREDITMODELISCOUNTABLE,
        FINANCESUM,
        CREDITMODELRESULT,
        NEW_FINANCESUM,
        FRAUDMODELRESULT,
        OPPORTUNITYCREDITRESULT,
        OPPORTUNITYFRAUDRESULT,
        PRODUCTOP,
        SCORINGSCORE,
        MODEL_TYPE,
        calc_conditions,
        ISPRESCORINGCALL,
        model_settings,
        -- tasks
        VERACTIVITYID,
        VER_NO,
        verstart_flg,
        verend_flg,
        VERACTUALEND,
        VERCREATEDON,
        VERNEW_APPROVALRESULT,
        VERNEW_APPROVALRESULTNAME,
        VERNEW_COMMENTS,
        VERNEW_COUNTER_FULLTIME,
        VERNEW_COUNTER_WORKTIME,
        VERNEW_HISTORY,
        VERNEW_TYPE,
        VERNEW_TYPENAME,
        VERNEW_UZDL,
        reverACTIVITYID,
        rever_NO,
        reverstart_flg,
        reverend_flg,
        reverACTUALEND,
        reverCREATEDON,
        reverNEW_APPROVALRESULT,
        reverNEW_APPROVALRESULTNM,
        reverNEW_COMMENTS,
        reverNEW_COUNTER_FULLTIME,
        reverNEW_COUNTER_WORKTIME,
        reverNEW_HISTORY,
        reverNEW_TYPE,
        reverNEW_TYPENAME,
        reverNEW_UZDL,
        uobACTIVITYID,
        uob_NO,
        uobstart_flg,
        uobend_flg,
        uobACTUALEND,
        uobCREATEDON,
        uobNEW_APPROVALRESULT,
        uobNEW_APPROVALRESULTNAME,
        uobNEW_COMMENTS,
        uobNEW_COUNTER_FULLTIME,
        uobNEW_COUNTER_WORKTIME,
        uobNEW_HISTORY,
        uobNEW_TYPE,
        uobNEW_TYPENAME,
        reuobACTIVITYID,
        reuob_NO,
        reuobstart_flg,
        reuobend_flg,
        reuobACTUALEND,
        reuobCREATEDON,
        reuobNEW_APPROVALRESULT,
        reuobNEW_APPROVALRESULTNAME,
        reuobNEW_COMMENTS,
        reuobNEW_COUNTER_FULLTIME,
        reuobNEW_COUNTER_WORKTIME,
        reuobNEW_HISTORY,
        reuobNEW_TYPE,
        reuobNEW_TYPENAME,
        uakrACTIVITYID,
        uakr_NO,
        uakrstart_flg,
        uakrend_flg,
        uakrACTUALEND,
        uakrCREATEDON,
        uakrNEW_APPROVALRESULT,
        uakrNEW_APPROVALRESULTNAME,
        uakrNEW_COMMENTS,
        uakrNEW_COUNTER_FULLTIME,
        uakrNEW_COUNTER_WORKTIME,
        uakrNEW_HISTORY,
        uakrNEW_TYPE,
        uakrNEW_TYPENAME,
        reuakrACTIVITYID,
        reuakr_NO,
        reuakrstart_flg,
        reuakrend_flg,
        reuakrACTUALEND,
        reuakrCREATEDON,
        reuakrNEW_APPROVALRESULT,
        reuakrNEW_APPROVALRESULTNAME,
        reuakrNEW_COMMENTS,
        reuakrNEW_COUNTER_FULLTIME,
        reuakrNEW_COUNTER_WORKTIME,
        reuakrNEW_HISTORY,
        reuakrNEW_TYPE,
        reuakrNEW_TYPENAME,
        UNDERWRITACTIVITYID,
        UNDERWRIT_NO,
        UNDERWRITstart_flg,
        UNDERWRITend_flg,
        UNDERWRITACTUALEND,
        UNDERWRITCREATEDON,
        UNDERWRITNEW_APPROVALRESULT,
        UNDWRITNEW_APPROVALRESULTNAME,
        UNDERWRITNEW_COMMENTS,
        UNDERWRITNEW_COUNTER_FULLTIME,
        UNDERWRITNEW_COUNTER_WORKTIME,
        UNDERWRITNEW_HISTORY,
        UNDERWRITNEW_TYPE,
        UNDERWRITNEW_TYPENAME,
        klasactivityid,
        klas_no,
        klasstart_flg,
        klasend_flg,
        klasactualend,
        klascreatedon,
        klasnew_approvalresult,
        klasNEW_APPROVALRESULTNAME,
        klasnew_comments,
        klasNEW_COUNTER_FULLTIME,
        klasNEW_COUNTER_WORKTIME,
        klasnew_history,
        klasnew_type,
        klasnew_typename,
        KUFRACTIVITYID,
        KUFR_NO,
        kufrstart_flg,
        kufrend_flg,
        KUFRACTUALEND,
        KUFRCREATEDON,
        KUFRNEW_APPROVALRESULT,
        KUFRNEW_APPROVALRESULTNM,
        KUFRNEW_COMMENTS,
        KUFRNEW_COUNTER_FULLTIME,
        KUFRNEW_COUNTER_WORKTIME,
        KUFRNEW_HISTORY,
        KUFRNEW_TYPE,
        KUFRNEW_TYPENAME,
        REAPPROVACTIVITYID,
        REAPPROV_NO,
        REAPPROVstart_flg,
        REAPPROVend_flg,
        REAPPROVACTUALEND,
        REAPPROVCREATEDON,
        REAPPROVNEW_APPROVALRESULT,
        REAPPROVNEW_APPROVALRESULTNAME,
        REAPPROVNEW_COMMENTS,
        REAPPROVNEW_COUNTER_FULLTIME,
        REAPPROVNEW_COUNTER_WORKTIME,
        REAPPROVNEW_HISTORY,
        REAPPROVNEW_TYPE,
        REAPPROVNEW_TYPENAME
    )
    select /*+ parallel(4) */
        :p_SNAPSHOT_DT SNAPSHOT_DT
        ,r.opportunityid
        ,a.ACCOUNTID
        ,a.CREATEDON
        ,a.EMAILADDRESS1
        ,a.INDUSTRYCODENAME
        ,a.NAME
        ,a.NEW_ACCOUNTINDUCTRYNAME
        ,a.NEW_BLACK_LIST_DATE
        ,a.NEW_CEOCHANGENAME
        ,a.NEW_CHEKVERIFICATION
        ,a.NEW_COMPANYSITE
        ,a.NEW_EXPLOITATIONPL1
        ,a.NEW_INCIDENTSOURCENAME
        ,a.NEW_INN
        ,a.NEW_KY_CUSTOMER
        ,a.NEW_KY_SPESHLPR
        ,a.NEW_LEGALORGANIZATIONALFORMNAM
        ,a.NEW_MOBILEPHONE
        ,a.NEW_OGRN
        ,a.NEW_OKVEDIDNAME
        ,a.NEW_PHYSICALINN
        ,a.NEW_REGISTRATIONADDRESS
        ,a.NEW_REGISTRATIONDATE
        ,a.PRIMARYCONTACTID
        ,a.PRIMARYCONTACTIDNAME
        ,a.WEBSITEURL
        ,rg.RELGROUPS
            ,rg.RELMAX
        ,o.NEW_AGENTID
            ,o.NEW_ALLEXPRETISETASKSCLOSED
            ,o.NEW_APPROVALRESULTNAME
            ,o.NEW_FACTADRESS
            ,o.NEW_LEASAGREEMENTCONDCONFIRMED
            ,o.NEW_NONFINANCIAL
            ,o.NEW_OPT
            ,o.NEW_PODPRODUCTNAME
            ,o.NEW_PRODUCTIDNAME
            ,o.NEW_PROPERTYRISK
            ,o.NEW_ROUTINGBYMODEL
            ,o.NEW_STATUSCODEIDNAME
            ,o.NEW_TOTALFINANCINGSUM
            ,o.NEW_TOTALFINANCINGSUM_EXPRESS
            ,o.NEW_TOTALSUMDEALPERIOD
        ,ag.NEW_ACCOUNTGROUPID
            ,ag.NEW_NAME
        ,c.BIRTHDATE
        ,c.CONTACTID
        ,c.FIRSTNAME
        ,c.GENDERCODENAME
        ,c.JOBTITLE
        ,c.MIDDLENAME
        ,c.MOBILEPHONE
        ,c.NEW_ADDRESS
        ,c.NEW_CONTACTTYPENAME
        ,c.VTBL_SCORINGSCORE
        ,hd.NEW_DOCNUMBER
        ,hd.NEW_DOCTYPE
        ,hd.NEW_DOCTYPENAME
        ,hd.NEW_SERIA
        ,hd.NEW_STARTDATE
        ,hd.NEW_WHENGIVE
        ,hd.NEW_WHOGIVE
        ,l.LEADID
            ,l.NEW_REF_ACCOUNTNAME
            ,l.NEW_WEB
        ,r.COUNTEDON
            ,r.CREDITMODELISCOUNTABLE
            ,r.FINANCESUM
            ,r.CREDITMODELRESULT
            ,r.NEW_FINANCESUM
            ,r.FRAUDMODELRESULT
            ,r.OPPORTUNITYCREDITRESULT
            ,r.OPPORTUNITYFRAUDRESULT
            ,r.PRODUCTOP
            ,r.SCORINGSCORE
            ,r.MODEL_TYPE
            ,r.calc_conditions
            ,r.ISPRESCORINGCALL
            ,r.model_settings
        -- tasks
        , r.VERACTIVITYID
        , r.VER_NO
        , r.verstart_flg
        , r.verend_flg
        , r.VERACTUALEND
        , r.VERCREATEDON
        , r.VERNEW_APPROVALRESULT
        , r.VERNEW_APPROVALRESULTNAME
        , r.VERNEW_COMMENTS
        , r.VERNEW_COUNTER_FULLTIME
        , r.VERNEW_COUNTER_WORKTIME
        , r.VERNEW_HISTORY
        , r.VERNEW_TYPE
        , r.VERNEW_TYPENAME
        , r.VERNEW_UZDL
        , r.reverACTIVITYID
        , r.rever_NO
        , r.reverstart_flg
        , r.reverend_flg
        , r.reverACTUALEND
        , r.reverCREATEDON
        , r.reverNEW_APPROVALRESULT
        , r.reverNEW_APPROVALRESULTNM
        , r.reverNEW_COMMENTS
        , r.reverNEW_COUNTER_FULLTIME
        , r.reverNEW_COUNTER_WORKTIME
        , r.reverNEW_HISTORY
        , r.reverNEW_TYPE
        , r.reverNEW_TYPENAME
        , r.reverNEW_UZDL
        , r.uobACTIVITYID
        , r.uob_NO
        , r.uobstart_flg
        , r.uobend_flg
        , r.uobACTUALEND
        , r.uobCREATEDON
        , r.uobNEW_APPROVALRESULT
        , r.uobNEW_APPROVALRESULTNAME
        , r.uobNEW_COMMENTS
        , r.uobNEW_COUNTER_FULLTIME
        , r.uobNEW_COUNTER_WORKTIME
        , r.uobNEW_HISTORY
        , r.uobNEW_TYPE
        , r.uobNEW_TYPENAME
        , r.reuobACTIVITYID
        , r.reuob_NO
        , r.reuobstart_flg
        , r.reuobend_flg
        , r.reuobACTUALEND
        , r.reuobCREATEDON
        , r.reuobNEW_APPROVALRESULT
        , r.reuobNEW_APPROVALRESULTNAME
        , r.reuobNEW_COMMENTS
        , r.reuobNEW_COUNTER_FULLTIME
        , r.reuobNEW_COUNTER_WORKTIME
        , r.reuobNEW_HISTORY
        , r.reuobNEW_TYPE
        , r.reuobNEW_TYPENAME
        , r.uakrACTIVITYID
        , r.uakr_NO
        , r.uakrstart_flg
        , r.uakrend_flg
        , r.uakrACTUALEND
        , r.uakrCREATEDON
        , r.uakrNEW_APPROVALRESULT
        , r.uakrNEW_APPROVALRESULTNAME
        , r.uakrNEW_COMMENTS
        , r.uakrNEW_COUNTER_FULLTIME
        , r.uakrNEW_COUNTER_WORKTIME
        , r.uakrNEW_HISTORY
        , r.uakrNEW_TYPE
        , r.uakrNEW_TYPENAME
        , r.reuakrACTIVITYID
        , r.reuakr_NO
        , r.reuakrstart_flg
        , r.reuakrend_flg
        , r.reuakrACTUALEND
        , r.reuakrCREATEDON
        , r.reuakrNEW_APPROVALRESULT
        , r.reuakrNEW_APPROVALRESULTNAME
        , r.reuakrNEW_COMMENTS
        , r.reuakrNEW_COUNTER_FULLTIME
        , r.reuakrNEW_COUNTER_WORKTIME
        , r.reuakrNEW_HISTORY
        , r.reuakrNEW_TYPE
        , r.reuakrNEW_TYPENAME
        , r.UNDERWRITACTIVITYID
        , r.UNDERWRIT_NO
        , r.UNDERWRITstart_flg
        , r.UNDERWRITend_flg
        , r.UNDERWRITACTUALEND
        , r.UNDERWRITCREATEDON
        , r.UNDERWRITNEW_APPROVALRESULT
        , r.UNDWRITNEW_APPROVALRESULTNAME
        , r.UNDERWRITNEW_COMMENTS
        , r.UNDERWRITNEW_COUNTER_FULLTIME
        , r.UNDERWRITNEW_COUNTER_WORKTIME
        , r.UNDERWRITNEW_HISTORY
        , r.UNDERWRITNEW_TYPE
        , r.UNDERWRITNEW_TYPENAME
        , r.klasactivityid
        , r.klas_no
        , r.klasstart_flg
        , r.klasend_flg
        , r.klasactualend
        , r.klascreatedon
        , r.klasnew_approvalresult
        , r.klasNEW_APPROVALRESULTNAME
        , r.klasnew_comments
        , r.klasNEW_COUNTER_FULLTIME
        , r.klasNEW_COUNTER_WORKTIME
        , r.klasnew_history
        , r.klasnew_type
        , r.klasnew_typename
        , r.KUFRACTIVITYID
        , r.KUFR_NO
        , r.kufrstart_flg
        , r.kufrend_flg
        , r.KUFRACTUALEND
        , r.KUFRCREATEDON
        , r.KUFRNEW_APPROVALRESULT
        , r.KUFRNEW_APPROVALRESULTNM
        , r.KUFRNEW_COMMENTS
        , r.KUFRNEW_COUNTER_FULLTIME
        , r.KUFRNEW_COUNTER_WORKTIME
        , r.KUFRNEW_HISTORY
        , r.KUFRNEW_TYPE
        , r.KUFRNEW_TYPENAME
        , r.REAPPROVACTIVITYID
        , r.REAPPROV_NO
        , r.REAPPROVstart_flg
        , r.REAPPROVend_flg
        , r.REAPPROVACTUALEND
        , r.REAPPROVCREATEDON
        , r.REAPPROVNEW_APPROVALRESULT
        , r.REAPPROVNEW_APPROVALRESULTNAME
        , r.REAPPROVNEW_COMMENTS
        , r.REAPPROVNEW_COUNTER_FULLTIME
        , r.REAPPROVNEW_COUNTER_WORKTIME
        , r.REAPPROVNEW_HISTORY
        , r.REAPPROVNEW_TYPE
        , r.REAPPROVNEW_TYPENAME
    from (
        with l as (SELECT LEVEL as rn FROM DUAL CONNECT BY LEVEL <= (select greatest((select nvl(max(rn),0) from DWH.LEASROUT_TASKNEW_100000045_TMP),
                                                                      (select nvl(max(rn),0) from DWH.LEASROUT_TASKNEW_10009_TMP),
                                                                      (select nvl(max(rn),0) from DWH.LEASROUT_TASKNEW_10009KUF_TMP),
                                                                      (select nvl(max(rn),0) from DWH.LEASROUT_TASKNEW_10011_TMP),
                                                                      (select nvl(max(rn),0) from DWH.LEASROUT_TASKNEW_10015_TMP),
                                                                      (select nvl(max(rn),0) from DWH.LEASROUT_TASKNEW_10016_TMP),
                                                                      (select nvl(max(rn),0) from DWH.LEASROUT_TASKNEW_10029_TMP),
                                                                      (select nvl(max(rn),0) from DWH.LEASROUT_TASKNEW_10031_TMP),
                                                                      (select nvl(max(rn),0) from DWH.LEASROUT_TASKNEW_100032_TMP),
                                                                      (select nvl(max(rn),0) from DWH.LEASROUT_TASKNEW_100032OD_TMP)) from dual)
        )
        select * from (
        select r.opportunityid, r.COUNTEDON, l.rn l_rn, greatest(nvl(t45.rn_m,1), nvl(t09.rn_m,1), nvl(t09kuf.rn_m,1), nvl(t15.rn_m,1), nvl(t11.rn_m,1), nvl(t16.rn_m,1), nvl(t29.rn_m,1), nvl(t31.rn_m,1), nvl(t32.rn_m,1), nvl(t32od.rn_m,1)) gr
                ,r.CREDITMODELISCOUNTABLE
                ,r.FINANCESUM
                ,r.CREDITMODELRESULT
                ,r.NEW_FINANCESUM
                ,r.FRAUDMODELRESULT
                ,r.OPPORTUNITYCREDITRESULT
                ,r.OPPORTUNITYFRAUDRESULT
                ,r.PRODUCTOP
                ,r.SCORINGSCORE
                ,r.MODEL_TYPE
                ,r.calc_conditions
                ,r.ISPRESCORINGCALL
                ,r.model_settings
            ,t45.ACTIVITYID	as	VERACTIVITYID
            ,t45.rn	as	VER_NO
            ,t45.start_flg verstart_flg
            ,t45.end_flg verend_flg
            ,t45.ACTUALEND	as	VERACTUALEND
            ,t45.CREATEDON	as	VERCREATEDON
            ,t45.NEW_APPROVALRESULT	as	VERNEW_APPROVALRESULT
            ,t45.NEW_APPROVALRESULTNAME	as	VERNEW_APPROVALRESULTNAME
            ,t45.NEW_COMMENTS	as	VERNEW_COMMENTS
            ,t45.NEW_COUNTER_FULLTIME	as	VERNEW_COUNTER_FULLTIME
            ,t45.NEW_COUNTER_WORKTIME	as	VERNEW_COUNTER_WORKTIME
            ,t45.NEW_HISTORY	as	VERNEW_HISTORY
            ,t45.NEW_TYPE	as	VERNEW_TYPE
            ,t45.NEW_TYPENAME	as	VERNEW_TYPENAME
            ,t45.NEW_UZDL	as	VERNEW_UZDL
            ,t32.ACTIVITYID	as	reverACTIVITYID
            ,t32.rn	as	        rever_NO
            ,t32.start_flg      reverstart_flg
            ,t32.end_flg        reverend_flg
            ,t32.ACTUALEND	as	reverACTUALEND
            ,t32.CREATEDON	as	    reverCREATEDON
            ,t32.NEW_APPROVALRESULT	as	reverNEW_APPROVALRESULT
            ,t32.NEW_APPROVALRESULTNAME	as	reverNEW_APPROVALRESULTNM
            ,t32.NEW_COMMENTS	as	        reverNEW_COMMENTS
            ,t32.NEW_COUNTER_FULLTIME	as	reverNEW_COUNTER_FULLTIME
            ,t32.NEW_COUNTER_WORKTIME	as	reverNEW_COUNTER_WORKTIME
            ,t32.NEW_HISTORY	as	        reverNEW_HISTORY
            ,t32.NEW_TYPE	as	            reverNEW_TYPE
            ,t32.NEW_TYPENAME	as	        reverNEW_TYPENAME
            ,t32.NEW_UZDL	as	            reverNEW_UZDL
            ,t15.ACTIVITYID	as	uobACTIVITYID
            ,t15.rn	as	uob_NO
            ,t15.start_flg uobstart_flg
            ,t15.end_flg uobend_flg
            ,t15.ACTUALEND	as	uobACTUALEND
            ,t15.CREATEDON	as	uobCREATEDON
            ,t15.NEW_APPROVALRESULT	as	uobNEW_APPROVALRESULT
            ,t15.NEW_APPROVALRESULTNAME	as	uobNEW_APPROVALRESULTNAME
            ,t15.NEW_COMMENTS	as	uobNEW_COMMENTS
            ,t15.NEW_COUNTER_FULLTIME	as	uobNEW_COUNTER_FULLTIME
            ,t15.NEW_COUNTER_WORKTIME	as	uobNEW_COUNTER_WORKTIME
            ,t15.NEW_HISTORY	as	uobNEW_HISTORY
            ,t15.NEW_TYPE	as	uobNEW_TYPE
            ,t15.NEW_TYPENAME	as	uobNEW_TYPENAME
            ,t29.ACTIVITYID	as	reuobACTIVITYID
            ,t29.rn	as	reuob_NO
            ,t29.start_flg reuobstart_flg
            ,t29.end_flg reuobend_flg
            ,t29.ACTUALEND	as	reuobACTUALEND
            ,t29.CREATEDON	as	reuobCREATEDON
            ,t29.NEW_APPROVALRESULT	as	reuobNEW_APPROVALRESULT
            ,t29.NEW_APPROVALRESULTNAME	as	reuobNEW_APPROVALRESULTNAME
            ,t29.NEW_COMMENTS	as	reuobNEW_COMMENTS
            ,t29.NEW_COUNTER_FULLTIME	as	reuobNEW_COUNTER_FULLTIME
            ,t29.NEW_COUNTER_WORKTIME	as	reuobNEW_COUNTER_WORKTIME
            ,t29.NEW_HISTORY	as	reuobNEW_HISTORY
            ,t29.NEW_TYPE	as	reuobNEW_TYPE
            ,t29.NEW_TYPENAME	as	reuobNEW_TYPENAME
            ,t11.ACTIVITYID	as	uakrACTIVITYID
            ,t11.rn	as	uakr_NO
            ,t11.start_flg uakrstart_flg
            ,t11.end_flg uakrend_flg
            ,t11.ACTUALEND	as	uakrACTUALEND
            ,t11.CREATEDON	as	uakrCREATEDON
            ,t11.NEW_APPROVALRESULT	as	uakrNEW_APPROVALRESULT
            ,t11.NEW_APPROVALRESULTNAME	as	uakrNEW_APPROVALRESULTNAME
            ,t11.NEW_COMMENTS	as	uakrNEW_COMMENTS
            ,t11.NEW_COUNTER_FULLTIME	as	uakrNEW_COUNTER_FULLTIME
            ,t11.NEW_COUNTER_WORKTIME	as	uakrNEW_COUNTER_WORKTIME
            ,t11.NEW_HISTORY	as	uakrNEW_HISTORY
            ,t11.NEW_TYPE	as	uakrNEW_TYPE
            ,t11.NEW_TYPENAME	as	uakrNEW_TYPENAME
            ,t31.ACTIVITYID	as	reuakrACTIVITYID
            ,t31.rn	as	reuakr_NO
            ,t31.start_flg reuakrstart_flg
            ,t31.end_flg reuakrend_flg
            ,t31.ACTUALEND	as	reuakrACTUALEND
            ,t31.CREATEDON	as	reuakrCREATEDON
            ,t31.NEW_APPROVALRESULT	as	reuakrNEW_APPROVALRESULT
            ,t31.NEW_APPROVALRESULTNAME	as	reuakrNEW_APPROVALRESULTNAME
            ,t31.NEW_COMMENTS	as	reuakrNEW_COMMENTS
            ,t31.NEW_COUNTER_FULLTIME	as	reuakrNEW_COUNTER_FULLTIME
            ,t31.NEW_COUNTER_WORKTIME	as	reuakrNEW_COUNTER_WORKTIME
            ,t31.NEW_HISTORY	as	reuakrNEW_HISTORY
            ,t31.NEW_TYPE	as	reuakrNEW_TYPE
            ,t31.NEW_TYPENAME	as	reuakrNEW_TYPENAME
            ,t16.ACTIVITYID	as	UNDERWRITACTIVITYID
            ,t16.rn	as	UNDERWRIT_NO
            ,t16.start_flg UNDERWRITstart_flg
            ,t16.end_flg UNDERWRITend_flg
            ,t16.ACTUALEND	as	UNDERWRITACTUALEND
            ,t16.CREATEDON	as	UNDERWRITCREATEDON
            ,t16.NEW_APPROVALRESULT	as	UNDERWRITNEW_APPROVALRESULT
            ,t16.NEW_APPROVALRESULTNAME	as	UNDWRITNEW_APPROVALRESULTNAME
            ,t16.NEW_COMMENTS	as	UNDERWRITNEW_COMMENTS
            ,t16.NEW_COUNTER_FULLTIME	as	UNDERWRITNEW_COUNTER_FULLTIME
            ,t16.NEW_COUNTER_WORKTIME	as	UNDERWRITNEW_COUNTER_WORKTIME
            ,t16.NEW_HISTORY	as	UNDERWRITNEW_HISTORY
            ,t16.NEW_TYPE	as	UNDERWRITNEW_TYPE
            ,t16.NEW_TYPENAME	as	UNDERWRITNEW_TYPENAME
            ,t09.ACTIVITYID	as	klasactivityid
            ,t09.rn	as	klas_no
            ,t09.start_flg klasstart_flg
            ,t09.end_flg klasend_flg
            ,t09.ACTUALEND	as	klasactualend
            ,t09.CREATEDON	as	klascreatedon
            ,t09.NEW_APPROVALRESULT	as	klasnew_approvalresult
            ,t09.NEW_APPROVALRESULTNAME	as	klasNEW_APPROVALRESULTNAME
            ,t09.NEW_COMMENTS	as	klasnew_comments
            ,t09.NEW_COUNTER_FULLTIME	as	klasNEW_COUNTER_FULLTIME
            ,t09.NEW_COUNTER_WORKTIME	as	klasNEW_COUNTER_WORKTIME
            ,t09.NEW_HISTORY	as	klasnew_history
            ,t09.NEW_TYPE	as	klasnew_type
            ,t09.NEW_TYPENAME	as	klasnew_typename
            ,t09kuf.ACTIVITYID	as	KUFRACTIVITYID
            ,t09kuf.rn	as	KUFR_NO
            ,t09kuf.start_flg as kufrstart_flg
            ,t09kuf.end_flg as kufrend_flg
            ,t09kuf.ACTUALEND	as	KUFRACTUALEND
            ,t09kuf.CREATEDON	as	KUFRCREATEDON
            ,t09kuf.NEW_APPROVALRESULT	as	KUFRNEW_APPROVALRESULT
            ,t09kuf.NEW_APPROVALRESULTNAME	as	KUFRNEW_APPROVALRESULTNM
            ,t09kuf.NEW_COMMENTS	as	KUFRNEW_COMMENTS
            ,t09kuf.NEW_COUNTER_FULLTIME	as	KUFRNEW_COUNTER_FULLTIME
            ,t09kuf.NEW_COUNTER_WORKTIME	as	KUFRNEW_COUNTER_WORKTIME
            ,t09kuf.NEW_HISTORY	as	KUFRNEW_HISTORY
            ,t09kuf.NEW_TYPE	as	KUFRNEW_TYPE
            ,t09kuf.NEW_TYPENAME	as	KUFRNEW_TYPENAME
            ,t32od.ACTIVITYID	as	REAPPROVACTIVITYID
            ,t32od.rn	as	REAPPROV_NO
            ,t32od.start_flg REAPPROVstart_flg
            ,t32od.end_flg REAPPROVend_flg
            ,t32od.ACTUALEND	as	REAPPROVACTUALEND
            ,t32od.CREATEDON	as	REAPPROVCREATEDON
            ,t32od.NEW_APPROVALRESULT	as	REAPPROVNEW_APPROVALRESULT
            ,t32od.NEW_APPROVALRESULTNAME	as	REAPPROVNEW_APPROVALRESULTNAME
            ,t32od.NEW_COMMENTS	as	REAPPROVNEW_COMMENTS
            ,t32od.NEW_COUNTER_FULLTIME	as	REAPPROVNEW_COUNTER_FULLTIME
            ,t32od.NEW_COUNTER_WORKTIME	as	REAPPROVNEW_COUNTER_WORKTIME
            ,t32od.NEW_HISTORY	as	REAPPROVNEW_HISTORY
            ,t32od.NEW_TYPE	as	REAPPROVNEW_TYPE
            ,t32od.NEW_TYPENAME	as	REAPPROVNEW_TYPENAME
        from DWH.LEASROUTING_RMD_TMP r
        full outer join l on 1=1
        left outer join DWH.LEASROUT_TASKNEW_100000045_TMP t45   on r.opportunityid = t45.opportunityid and r.COUNTEDON = t45.countedon and t45.rn = l.rn and t45.rn <= t45.rn_m
        left outer join DWH.LEASROUT_TASKNEW_10009_TMP t09       on r.opportunityid = t09.opportunityid and r.COUNTEDON = t09.countedon and t09.rn = l.rn and t09.rn <= t09.rn_m
        left outer join DWH.LEASROUT_TASKNEW_10009KUF_TMP t09kuf on r.opportunityid = t09kuf.opportunityid and r.COUNTEDON = t09kuf.countedon and t09kuf.rn = l.rn and t09kuf.rn <= t09kuf.rn_m
        left outer join DWH.LEASROUT_TASKNEW_10015_TMP t15 on r.opportunityid = t15.opportunityid and r.COUNTEDON = t15.countedon and t15.rn = l.rn and t15.rn <= t15.rn_m
        left outer join DWH.LEASROUT_TASKNEW_10011_TMP t11 on r.opportunityid = t11.opportunityid and r.COUNTEDON = t11.countedon and t11.rn = l.rn and t11.rn <= t11.rn_m
        left outer join DWH.LEASROUT_TASKNEW_10016_TMP t16 on r.opportunityid = t16.opportunityid and r.COUNTEDON = t16.countedon and t16.rn = l.rn and t16.rn <= t16.rn_m
        left outer join DWH.LEASROUT_TASKNEW_10029_TMP t29 on r.opportunityid = t29.opportunityid and r.COUNTEDON = t29.countedon and t29.rn = l.rn and t29.rn <= t29.rn_m
        left outer join DWH.LEASROUT_TASKNEW_10031_TMP t31 on r.opportunityid = t31.opportunityid and r.COUNTEDON = t31.countedon and t31.rn = l.rn and t31.rn <= t31.rn_m
        left outer join DWH.LEASROUT_TASKNEW_100032_TMP t32 on r.opportunityid = t32.opportunityid and r.COUNTEDON = t32.countedon and t32.rn = l.rn and t32.rn <= t32.rn_m
        left outer join DWH.LEASROUT_TASKNEW_100032OD_TMP t32od on r.opportunityid = t32od.opportunityid and r.COUNTEDON = t32od.countedon and t32od.rn = l.rn and t32od.rn <= t32od.rn_m
        order by r.opportunityid, r.COUNTEDON, l.rn
        ) where l_rn <= gr
    ) r
    left outer join DWH.LEASROUTING_OPPORTUNITY_TMP o on r.opportunityid = o.opportunityid and r.countedon = o.countedon
    left outer join DWH.LEASROUTING_ACCOUNT_TMP a on  r.opportunityid = a.opportunityid and r.countedon = a.countedon
    left outer join DWH.LEASROUTING_RELLGROUP_TMP rg on r.opportunityid = rg.opportunityid and r.countedon = rg.countedon
    left outer join DWH.LEASROUT_NEW_ACCOUNTGROUP_TMP ag on r.opportunityid = ag.opportunityid and r.countedon = ag.countedon
    left outer join DWH.LEASROUTING_CONTACT_TMP c on r.opportunityid = c.opportunityid and r.countedon = c.countedon
    left outer join DWH.LEASROUTING_NEW_HUMANDOCS_TMP hd on r.opportunityid = hd.opportunityid and r.countedon = hd.countedon
    left outer join DWH.LEASROUTING_CRM_LEAD_TMP l on r.opportunityid = l.opportunityid and r.countedon = l.countedon
    where not r.opportunityid is null
    !' using p_SNAPSHOT_DT;
exception
    when others then
        dm.u_log('insert_LEASROUTING_MODELS', 'error' ,sqlerrm);
        raise;
end;

procedure drop_temp is
begin
    dbms_application_info.set_action(action_name => 'drop_temp');
    drop_table('DWH','LEASROUTING_RMD_TMP');
    drop_table('DWH','LEASROUTING_OPPORTUNITY_TMP');
    drop_table('DWH','LEASROUTING_ACCOUNT_TMP');
    drop_table('DWH','LEASROUTING_CONTACT_TMP');
    drop_table('DWH','LEASROUTING_CRM_LEAD_TMP');
    drop_table('DWH','LEASROUT_NEW_ACCOUNTGROUP_TMP');
    drop_table('DWH','LEASROUTING_NEW_HUMANDOCS_TMP');
    drop_table('DWH','LEASROUTING_RELLGROUP_TMP');
    drop_table('DWH','LEASROUT_TASKNEW_10009_TMP');
    drop_table('DWH','LEASROUT_TASKNEW_10009KUF_TMP');
    drop_table('DWH','LEASROUT_TASKNEW_10011_TMP');
    drop_table('DWH','LEASROUT_TASKNEW_10015_TMP');
    drop_table('DWH','LEASROUT_TASKNEW_10016_TMP');
    drop_table('DWH','LEASROUT_TASKNEW_10029_TMP');
    drop_table('DWH','LEASROUT_TASKNEW_10031_TMP');
    drop_table('DWH','LEASROUT_TASKNEW_100032_TMP');
    drop_table('DWH','LEASROUT_TASKNEW_100032OD_TMP');
    drop_table('DWH','LEASROUT_TASKNEW_100000045_TMP');
exception
    when others then
        dm.u_log('drop_temp', 'error' ,sqlerrm);
        raise;
end;

begin
    dm.u_log(GC_PROC_NAME, 'BEGIN','Начало расчётаl Модели маршрутизации сделок автолизинга. Дата расчёта '||to_char(p_snapshot_dt,'YYYY-MM-DD')
        ||' пользователь '||user);
    dbms_application_info.set_module(module_name => GC_PROC_NAME, action_name => 'main');
    dbms_application_info.set_client_info(client_info => to_char(p_snapshot_dt,'yyyy-mm-dd'));

    create_RMD_TMP;
    create_OPPORTUNITY_TMP;
    create_ACCOUNT_TMP;
    create_CONTACT_TMP;
    create_CRM_LEAD_TMP;
    create_NEW_ACCOUNTGROUP_TMP;
    create_NEW_HUMANDOCS_TMP;
    create_RELLGROUP_TMP;
    create_TASKNEW_10009_TMP;
    create_TASKNEW_10009KUF_TMP;
    create_TASKNEW_10011_TMP;
    create_TASKNEW_10015_TMP;
    create_TASKNEW_10016_TMP;
    create_TASKNEW_10029_TMP;
    create_TASKNEW_10031_TMP;
    create_TASKNEW_100032_TMP;
    create_TASKNEW_100032OD_TMP;
    create_TASKNEW_100000045_TMP;

    insert_LEASROUTING_MODELS;
    commit;
    if not p_develop_mode then
        drop_temp;
    end if;
    dm.u_log(GC_PROC_NAME,'END','Расчет сформирован');
exception
    when others then
        dm.u_log(GC_PROC_NAME,'error' ,sqlerrm);
        raise;
end;
/
