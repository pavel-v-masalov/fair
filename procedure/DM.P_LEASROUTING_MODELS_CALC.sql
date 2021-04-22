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
    select /*+ PARALLEL(4) */ t.*, max(t.rn) over (partition by opportunityid, COUNTEDON) rn_m from (
       select
            r.opportunityid, r.COUNTEDON,
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
      and (t.SUBJECT like '%���� �� ��%' or t.SUBJECT like  '%���� �� 4�� ������%') and VALID_TO_DTTM = to_date('2400-01-01', 'yyyy-mm-dd')
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
    select /*+ PARALLEL(4) */ t.*, max(t.rn) over (partition by opportunityid, COUNTEDON) rn_m from (
        select
            r.opportunityid, r.COUNTEDON,
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
      and (t.SUBJECT like '%����%' and t.SUBJECT like '%���������%') and VALID_TO_DTTM = to_date('2400-01-01', 'yyyy-mm-dd')
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
    select /*+ PARALLEL(4) */ t.*, max(t.rn) over (partition by opportunityid, COUNTEDON) rn_m from (
        select
            r.opportunityid, r.COUNTEDON,
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
    select /*+ PARALLEL(4) */ t.*, max(t.rn) over (partition by opportunityid, COUNTEDON) rn_m from (
        select
            r.opportunityid, r.COUNTEDON,
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
    select /*+ PARALLEL(4) */ t.*, max(t.rn) over (partition by opportunityid, COUNTEDON) rn_m from (
        select
            r.opportunityid, r.COUNTEDON,
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
    select /*+ PARALLEL(4) */ t.*, max(t.rn) over (partition by opportunityid, COUNTEDON) rn_m from (
        select
            r.opportunityid, r.COUNTEDON,
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
    select /*+ PARALLEL(4) */ t.*, max(t.rn) over (partition by opportunityid, COUNTEDON) rn_m from (
        select
            r.opportunityid, r.COUNTEDON,
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
    select /*+ PARALLEL(4) */ t.*, max(t.rn) over (partition by opportunityid, COUNTEDON) rn_m from (
        select
            r.opportunityid, r.COUNTEDON,
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
        where t.new_status = 100000002 and t.statecode = 1 and t.new_type = 100000032
                and t.SUBJECT like '%�� ��������� �������������%' and VALID_TO_DTTM = to_date('2400-01-01', 'yyyy-mm-dd')
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
    select /*+ PARALLEL(4) */ t.*, max(t.rn) over (partition by opportunityid, COUNTEDON) rn_m from (
        select
            r.opportunityid, r.COUNTEDON,
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
        where t.new_status = 100000002 and t.statecode = 1 and t.new_type = 100000032
                and t.SUBJECT like '%�� ��������� ���������%' and VALID_TO_DTTM = to_date('2400-01-01', 'yyyy-mm-dd')
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
    select /*+ PARALLEL(4) */ t.*, max(t.rn) over (partition by opportunityid, COUNTEDON) rn_m from (
        select
            r.opportunityid, r.COUNTEDON,
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
        VERACTUALEND,
        VERACTUALSTART,
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
        RECONFIRMATIONACTIVITYID,
        RECONFIRMATION_NO,
        RECONFIRMATIONACTUALEND,
        RECONFIRMATIONACTUALSTART,
        RECONFIRMATIONCREATEDON,
        RECONFIRMNEW_APPROVALRESULT,
        RECONFIRMNEW_APPROVALRESULTNM,
        RECONFIRMATIONNEW_COMMENTS,
        RECONFIRMNEW_COUNTER_FULLTIME,
        RECONFIRMNEW_COUNTER_WORKTIME,
        RECONFIRMATIONNEW_HISTORY,
        RECONFIRMATIONNEW_TYPE,
        RECONFIRMATIONNEW_TYPENAME,
        RECONFIRMATIONNEW_UZDL,
        EXPOYBACTIVITYID,
        EXPOYB_NO,
        EXPOYBACTUALEND,
        EXPOYBACTUALSTART,
        EXPOYBCREATEDON,
        EXPOYBNEW_APPROVALRESULT,
        EXPOYBNEW_APPROVALRESULTNAME,
        EXPOYBNEW_COMMENTS,
        EXPOYBNEW_COUNTER_FULLTIME,
        EXPOYBNEW_COUNTER_WORKTIME,
        EXPOYBNEW_HISTORY,
        EXPOYBNEW_TYPE,
        EXPOYBNEW_TYPENAME,
        EXPOYBNEW_UZDL,
        REPOYBACTIVITYID,
        REPOYB_NO,
        REPOYBACTUALEND,
        REPOYBACTUALSTART,
        REPOYBCREATEDON,
        REPOYBNEW_APPROVALRESULT,
        REPOYBNEW_APPROVALRESULTNAME,
        REPOYBNEW_COMMENTS,
        REPOYBNEW_COUNTER_FULLTIME,
        REPOYBNEW_COUNTER_WORKTIME,
        REPOYBNEW_HISTORY,
        REPOYBNEW_TYPE,
        REPOYBNEW_TYPENAME,
        REPOYBNEW_UZDL,
        EXPUAKRACTIVITYID,
        EXPUAKR_NO,
        EXPUAKRACTUALEND,
        EXPUAKRACTUALSTART,
        EXPUAKRCREATEDON,
        EXPUAKRNEW_APPROVALRESULT,
        EXPUAKRNEW_APPROVALRESULTNAME,
        EXPUAKRNEW_COMMENTS,
        EXPUAKRNEW_COUNTER_FULLTIME,
        EXPUAKRNEW_COUNTER_WORKTIME,
        EXPUAKRNEW_HISTORY,
        EXPUAKRNEW_TYPE,
        EXPUAKRNEW_TYPENAME,
        EXPUAKRNEW_UZDL,
        REPUAKRACTIVITYID,
        REPUAKR_NO,
        REPUAKRACTUALEND,
        REPUAKRACTUALSTART,
        REPUAKRCREATEDON,
        REPUAKRNEW_APPROVALRESULT,
        REPUAKRNEW_APPROVALRESULTNAME,
        REPUAKRNEW_COMMENTS,
        REPUAKRNEW_COUNTER_FULLTIME,
        REPUAKRNEW_COUNTER_WORKTIME,
        REPUAKRNEW_HISTORY,
        REPUAKRNEW_TYPE,
        REPUAKRNEW_TYPENAME,
        REPUAKRNEW_UZDL,
        UNDERWRITACTIVITYID,
        UNDERWRIT_NO,
        UNDERWRITACTUALEND,
        UNDERWRITACTUALSTART,
        UNDERWRITCREATEDON,
        UNDERWRITNEW_APPROVALRESULT,
        UNDWRITNEW_APPROVALRESULTNAME,
        UNDERWRITNEW_COMMENTS,
        UNDERWRITNEW_COUNTER_FULLTIME,
        UNDERWRITNEW_COUNTER_WORKTIME,
        UNDERWRITNEW_HISTORY,
        UNDERWRITNEW_TYPE,
        UNDERWRITNEW_TYPENAME,
        UNDERWRITNEW_UZDL,
        SOLUTIONDESACTIVITYID,
        SOLUTIONDES_NO,
        SOLUTIONDESACTUALEND,
        SOLUTIONDESACTUALSTART,
        SOLUTIONDESCREATEDON,
        SOLUTIONDESNEW_APPROVALRESULT,
        SOLDESNEW_APPROVALRESULTNAME,
        SOLUTIONDESNEW_COMMENTS,
        SOLDESNEW_COUNTER_FULLTIME,
        SOLNDESNEW_COUNTER_WORKTIME,
        SOLUTIONDESNEW_HISTORY,
        SOLUTIONDESNEW_TYPE,
        SOLUTIONDESNEW_TYPENAME,
        SOLUTIONDESNEW_UZDL,
        SOLUTIONDESKUFRACTIVITYID,
        SOLUTIONDESKUFR_NO,
        SOLUTIONDESKUFRACTUALEND,
        SOLUTIONDESKUFRACTUALSTART,
        SOLUTIONDESKUFRCREATEDON,
        SOLDESKUFRNEW_APPROVALRESULT,
        SOLDESKUFRNEW_APPROVALRESULTNM,
        SOLUTIONDESKUFRNEW_COMMENTS,
        SOLDESKUFRNEW_COUNTER_FULLTIME,
        SOLDESKUFRNEW_COUNTER_WORKTIME,
        SOLUTIONDESKUFRNEW_HISTORY,
        SOLUTIONDESKUFRNEW_TYPE,
        SOLUTIONDESKUFRNEW_TYPENAME,
        SOLUTIONDESKUFRNEW_UZDL,
        REAPPROVACTIVITYID,
        REAPPROV_NO,
        REAPPROVACTUALEND,
        REAPPROVACTUALSTART,
        REAPPROVCREATEDON,
        REAPPROVNEW_APPROVALRESULT,
        REAPPROVNEW_APPROVALRESULTNAME,
        REAPPROVNEW_COMMENTS,
        REAPPROVNEW_COUNTER_FULLTIME,
        REAPPROVNEW_COUNTER_WORKTIME,
        REAPPROVNEW_HISTORY,
        REAPPROVNEW_TYPE,
        REAPPROVNEW_TYPENAME,
        REAPPROVNEW_UZDL
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
            , r.VERACTUALEND
            , r.VERACTUALSTART
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
            , r.RECONFIRMATIONACTIVITYID
            , r.RECONFIRMATION_NO
            , r.RECONFIRMATIONACTUALEND
            , r.RECONFIRMATIONACTUALSTART
            , r.RECONFIRMATIONCREATEDON
            , r.RECONFIRMNEW_APPROVALRESULT
            , r.RECONFIRMNEW_APPROVALRESULTNM
            , r.RECONFIRMATIONNEW_COMMENTS
            , r.RECONFIRMNEW_COUNTER_FULLTIME
            , r.RECONFIRMNEW_COUNTER_WORKTIME
            , r.RECONFIRMATIONNEW_HISTORY
            , r.RECONFIRMATIONNEW_TYPE
            , r.RECONFIRMATIONNEW_TYPENAME
            , r.RECONFIRMATIONNEW_UZDL
            , r.EXPOYBACTIVITYID
            , r.EXPOYB_NO
            , r.EXPOYBACTUALEND
            , r.EXPOYBACTUALSTART
            , r.EXPOYBCREATEDON
            , r.EXPOYBNEW_APPROVALRESULT
            , r.EXPOYBNEW_APPROVALRESULTNAME
            , r.EXPOYBNEW_COMMENTS
            , r.EXPOYBNEW_COUNTER_FULLTIME
            , r.EXPOYBNEW_COUNTER_WORKTIME
            , r.EXPOYBNEW_HISTORY
            , r.EXPOYBNEW_TYPE
            , r.EXPOYBNEW_TYPENAME
            , r.EXPOYBNEW_UZDL
            , r.REPOYBACTIVITYID
            , r.REPOYB_NO
            , r.REPOYBACTUALEND
            , r.REPOYBACTUALSTART
            , r.REPOYBCREATEDON
            , r.REPOYBNEW_APPROVALRESULT
            , r.REPOYBNEW_APPROVALRESULTNAME
            , r.REPOYBNEW_COMMENTS
            , r.REPOYBNEW_COUNTER_FULLTIME
            , r.REPOYBNEW_COUNTER_WORKTIME
            , r.REPOYBNEW_HISTORY
            , r.REPOYBNEW_TYPE
            , r.REPOYBNEW_TYPENAME
            , r.REPOYBNEW_UZDL
            , r.EXPUAKRACTIVITYID
            , r.EXPUAKR_NO
            , r.EXPUAKRACTUALEND
            , r.EXPUAKRACTUALSTART
            , r.EXPUAKRCREATEDON
            , r.EXPUAKRNEW_APPROVALRESULT
            , r.EXPUAKRNEW_APPROVALRESULTNAME
            , r.EXPUAKRNEW_COMMENTS
            , r.EXPUAKRNEW_COUNTER_FULLTIME
            , r.EXPUAKRNEW_COUNTER_WORKTIME
            , r.EXPUAKRNEW_HISTORY
            , r.EXPUAKRNEW_TYPE
            , r.EXPUAKRNEW_TYPENAME
            , r.EXPUAKRNEW_UZDL
            , r.REPUAKRACTIVITYID
            , r.REPUAKR_NO
            , r.REPUAKRACTUALEND
            , r.REPUAKRACTUALSTART
            , r.REPUAKRCREATEDON
            , r.REPUAKRNEW_APPROVALRESULT
            , r.REPUAKRNEW_APPROVALRESULTNAME
            , r.REPUAKRNEW_COMMENTS
            , r.REPUAKRNEW_COUNTER_FULLTIME
            , r.REPUAKRNEW_COUNTER_WORKTIME
            , r.REPUAKRNEW_HISTORY
            , r.REPUAKRNEW_TYPE
            , r.REPUAKRNEW_TYPENAME
            , r.REPUAKRNEW_UZDL
            , r.UNDERWRITACTIVITYID
            , r.UNDERWRIT_NO
            , r.UNDERWRITACTUALEND
            , r.UNDERWRITACTUALSTART
            , r.UNDERWRITCREATEDON
            , r.UNDERWRITNEW_APPROVALRESULT
            , r.UNDWRITNEW_APPROVALRESULTNAME
            , r.UNDERWRITNEW_COMMENTS
            , r.UNDERWRITNEW_COUNTER_FULLTIME
            , r.UNDERWRITNEW_COUNTER_WORKTIME
            , r.UNDERWRITNEW_HISTORY
            , r.UNDERWRITNEW_TYPE
            , r.UNDERWRITNEW_TYPENAME
            , r.UNDERWRITNEW_UZDL
            , r.SOLUTIONDESACTIVITYID
            , r.SOLUTIONDES_NO
            , r.SOLUTIONDESACTUALEND
            , r.SOLUTIONDESACTUALSTART
            , r.SOLUTIONDESCREATEDON
            , r.SOLUTIONDESNEW_APPROVALRESULT
            , r.SOLDESNEW_APPROVALRESULTNAME
            , r.SOLUTIONDESNEW_COMMENTS
            , r.SOLDESNEW_COUNTER_FULLTIME
            , r.SOLNDESNEW_COUNTER_WORKTIME
            , r.SOLUTIONDESNEW_HISTORY
            , r.SOLUTIONDESNEW_TYPE
            , r.SOLUTIONDESNEW_TYPENAME
            , r.SOLUTIONDESNEW_UZDL
            , r.SOLUTIONDESKUFRACTIVITYID
            , r.SOLUTIONDESKUFR_NO
            , r.SOLUTIONDESKUFRACTUALEND
            , r.SOLUTIONDESKUFRACTUALSTART
            , r.SOLUTIONDESKUFRCREATEDON
            , r.SOLDESKUFRNEW_APPROVALRESULT
            , r.SOLDESKUFRNEW_APPROVALRESULTNM
            , r.SOLUTIONDESKUFRNEW_COMMENTS
            , r.SOLDESKUFRNEW_COUNTER_FULLTIME
            , r.SOLDESKUFRNEW_COUNTER_WORKTIME
            , r.SOLUTIONDESKUFRNEW_HISTORY
            , r.SOLUTIONDESKUFRNEW_TYPE
            , r.SOLUTIONDESKUFRNEW_TYPENAME
            , r.SOLUTIONDESKUFRNEW_UZDL
            , r.REAPPROVACTIVITYID
            , r.REAPPROV_NO
            , r.REAPPROVACTUALEND
            , r.REAPPROVACTUALSTART
            , r.REAPPROVCREATEDON
            , r.REAPPROVNEW_APPROVALRESULT
            , r.REAPPROVNEW_APPROVALRESULTNAME
            , r.REAPPROVNEW_COMMENTS
            , r.REAPPROVNEW_COUNTER_FULLTIME
            , r.REAPPROVNEW_COUNTER_WORKTIME
            , r.REAPPROVNEW_HISTORY
            , r.REAPPROVNEW_TYPE
            , r.REAPPROVNEW_TYPENAME
            , r.REAPPROVNEW_UZDL
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
                    ,t45.ACTUALEND	as	VERACTUALEND
                    ,t45.ACTUALSTART	as	VERACTUALSTART
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
                    ,t32.ACTIVITYID	as	RECONFIRMATIONACTIVITYID
                    ,t32.rn	as	RECONFIRMATION_NO
                    ,t32.ACTUALEND	as	RECONFIRMATIONACTUALEND
                    ,t32.ACTUALSTART	as	RECONFIRMATIONACTUALSTART
                    ,t32.CREATEDON	as	RECONFIRMATIONCREATEDON
                    ,t32.NEW_APPROVALRESULT	as	RECONFIRMNEW_APPROVALRESULT
                    ,t32.NEW_APPROVALRESULTNAME	as	RECONFIRMNEW_APPROVALRESULTNM
                    ,t32.NEW_COMMENTS	as	RECONFIRMATIONNEW_COMMENTS
                    ,t32.NEW_COUNTER_FULLTIME	as	RECONFIRMNEW_COUNTER_FULLTIME
                    ,t32.NEW_COUNTER_WORKTIME	as	RECONFIRMNEW_COUNTER_WORKTIME
                    ,t32.NEW_HISTORY	as	RECONFIRMATIONNEW_HISTORY
                    ,t32.NEW_TYPE	as	RECONFIRMATIONNEW_TYPE
                    ,t32.NEW_TYPENAME	as	RECONFIRMATIONNEW_TYPENAME
                    ,t32.NEW_UZDL	as	RECONFIRMATIONNEW_UZDL
                    ,t15.ACTIVITYID	as	EXPOYBACTIVITYID
                    ,t15.rn	as	EXPOYB_NO
                    ,t15.ACTUALEND	as	EXPOYBACTUALEND
                    ,t15.ACTUALSTART	as	EXPOYBACTUALSTART
                    ,t15.CREATEDON	as	EXPOYBCREATEDON
                    ,t15.NEW_APPROVALRESULT	as	EXPOYBNEW_APPROVALRESULT
                    ,t15.NEW_APPROVALRESULTNAME	as	EXPOYBNEW_APPROVALRESULTNAME
                    ,t15.NEW_COMMENTS	as	EXPOYBNEW_COMMENTS
                    ,t15.NEW_COUNTER_FULLTIME	as	EXPOYBNEW_COUNTER_FULLTIME
                    ,t15.NEW_COUNTER_WORKTIME	as	EXPOYBNEW_COUNTER_WORKTIME
                    ,t15.NEW_HISTORY	as	EXPOYBNEW_HISTORY
                    ,t15.NEW_TYPE	as	EXPOYBNEW_TYPE
                    ,t15.NEW_TYPENAME	as	EXPOYBNEW_TYPENAME
                    ,t15.NEW_UZDL	as	EXPOYBNEW_UZDL
                    ,t29.ACTIVITYID	as	REPOYBACTIVITYID
                    ,t29.rn	as	REPOYB_NO
                    ,t29.ACTUALEND	as	REPOYBACTUALEND
                    ,t29.ACTUALSTART	as	REPOYBACTUALSTART
                    ,t29.CREATEDON	as	REPOYBCREATEDON
                    ,t29.NEW_APPROVALRESULT	as	REPOYBNEW_APPROVALRESULT
                    ,t29.NEW_APPROVALRESULTNAME	as	REPOYBNEW_APPROVALRESULTNAME
                    ,t29.NEW_COMMENTS	as	REPOYBNEW_COMMENTS
                    ,t29.NEW_COUNTER_FULLTIME	as	REPOYBNEW_COUNTER_FULLTIME
                    ,t29.NEW_COUNTER_WORKTIME	as	REPOYBNEW_COUNTER_WORKTIME
                    ,t29.NEW_HISTORY	as	REPOYBNEW_HISTORY
                    ,t29.NEW_TYPE	as	REPOYBNEW_TYPE
                    ,t29.NEW_TYPENAME	as	REPOYBNEW_TYPENAME
                    ,t29.NEW_UZDL	as	REPOYBNEW_UZDL
                    ,t11.ACTIVITYID	as	EXPUAKRACTIVITYID
                    ,t11.rn	as	EXPUAKR_NO
                    ,t11.ACTUALEND	as	EXPUAKRACTUALEND
                    ,t11.ACTUALSTART	as	EXPUAKRACTUALSTART
                    ,t11.CREATEDON	as	EXPUAKRCREATEDON
                    ,t11.NEW_APPROVALRESULT	as	EXPUAKRNEW_APPROVALRESULT
                    ,t11.NEW_APPROVALRESULTNAME	as	EXPUAKRNEW_APPROVALRESULTNAME
                    ,t11.NEW_COMMENTS	as	EXPUAKRNEW_COMMENTS
                    ,t11.NEW_COUNTER_FULLTIME	as	EXPUAKRNEW_COUNTER_FULLTIME
                    ,t11.NEW_COUNTER_WORKTIME	as	EXPUAKRNEW_COUNTER_WORKTIME
                    ,t11.NEW_HISTORY	as	EXPUAKRNEW_HISTORY
                    ,t11.NEW_TYPE	as	EXPUAKRNEW_TYPE
                    ,t11.NEW_TYPENAME	as	EXPUAKRNEW_TYPENAME
                    ,t11.NEW_UZDL	as	EXPUAKRNEW_UZDL
                    ,t31.ACTIVITYID	as	REPUAKRACTIVITYID
                    ,t31.rn	as	REPUAKR_NO
                    ,t31.ACTUALEND	as	REPUAKRACTUALEND
                    ,t31.ACTUALSTART	as	REPUAKRACTUALSTART
                    ,t31.CREATEDON	as	REPUAKRCREATEDON
                    ,t31.NEW_APPROVALRESULT	as	REPUAKRNEW_APPROVALRESULT
                    ,t31.NEW_APPROVALRESULTNAME	as	REPUAKRNEW_APPROVALRESULTNAME
                    ,t31.NEW_COMMENTS	as	REPUAKRNEW_COMMENTS
                    ,t31.NEW_COUNTER_FULLTIME	as	REPUAKRNEW_COUNTER_FULLTIME
                    ,t31.NEW_COUNTER_WORKTIME	as	REPUAKRNEW_COUNTER_WORKTIME
                    ,t31.NEW_HISTORY	as	REPUAKRNEW_HISTORY
                    ,t31.NEW_TYPE	as	REPUAKRNEW_TYPE
                    ,t31.NEW_TYPENAME	as	REPUAKRNEW_TYPENAME
                    ,t31.NEW_UZDL	as	REPUAKRNEW_UZDL
                    ,t16.ACTIVITYID	as	UNDERWRITACTIVITYID
                    ,t16.rn	as	UNDERWRIT_NO
                    ,t16.ACTUALEND	as	UNDERWRITACTUALEND
                    ,t16.ACTUALSTART	as	UNDERWRITACTUALSTART
                    ,t16.CREATEDON	as	UNDERWRITCREATEDON
                    ,t16.NEW_APPROVALRESULT	as	UNDERWRITNEW_APPROVALRESULT
                    ,t16.NEW_APPROVALRESULTNAME	as	UNDWRITNEW_APPROVALRESULTNAME
                    ,t16.NEW_COMMENTS	as	UNDERWRITNEW_COMMENTS
                    ,t16.NEW_COUNTER_FULLTIME	as	UNDERWRITNEW_COUNTER_FULLTIME
                    ,t16.NEW_COUNTER_WORKTIME	as	UNDERWRITNEW_COUNTER_WORKTIME
                    ,t16.NEW_HISTORY	as	UNDERWRITNEW_HISTORY
                    ,t16.NEW_TYPE	as	UNDERWRITNEW_TYPE
                    ,t16.NEW_TYPENAME	as	UNDERWRITNEW_TYPENAME
                    ,t16.NEW_UZDL	as	UNDERWRITNEW_UZDL
                    ,t09.ACTIVITYID	as	SOLUTIONDESACTIVITYID
                    ,t09.rn	as	SOLUTIONDES_NO
                    ,t09.ACTUALEND	as	SOLUTIONDESACTUALEND
                    ,t09.ACTUALSTART	as	SOLUTIONDESACTUALSTART
                    ,t09.CREATEDON	as	SOLUTIONDESCREATEDON
                    ,t09.NEW_APPROVALRESULT	as	SOLUTIONDESNEW_APPROVALRESULT
                    ,t09.NEW_APPROVALRESULTNAME	as	SOLDESNEW_APPROVALRESULTNAME
                    ,t09.NEW_COMMENTS	as	SOLUTIONDESNEW_COMMENTS
                    ,t09.NEW_COUNTER_FULLTIME	as	SOLDESNEW_COUNTER_FULLTIME
                    ,t09.NEW_COUNTER_WORKTIME	as	SOLNDESNEW_COUNTER_WORKTIME
                    ,t09.NEW_HISTORY	as	SOLUTIONDESNEW_HISTORY
                    ,t09.NEW_TYPE	as	SOLUTIONDESNEW_TYPE
                    ,t09.NEW_TYPENAME	as	SOLUTIONDESNEW_TYPENAME
                    ,t09.NEW_UZDL	as	SOLUTIONDESNEW_UZDL
                    ,t09kuf.ACTIVITYID	as	SOLUTIONDESKUFRACTIVITYID
                    ,t09kuf.rn	as	SOLUTIONDESKUFR_NO
                    ,t09kuf.ACTUALEND	as	SOLUTIONDESKUFRACTUALEND
                    ,t09kuf.ACTUALSTART	as	SOLUTIONDESKUFRACTUALSTART
                    ,t09kuf.CREATEDON	as	SOLUTIONDESKUFRCREATEDON
                    ,t09kuf.NEW_APPROVALRESULT	as	SOLDESKUFRNEW_APPROVALRESULT
                    ,t09kuf.NEW_APPROVALRESULTNAME	as	SOLDESKUFRNEW_APPROVALRESULTNM
                    ,t09kuf.NEW_COMMENTS	as	SOLUTIONDESKUFRNEW_COMMENTS
                    ,t09kuf.NEW_COUNTER_FULLTIME	as	SOLDESKUFRNEW_COUNTER_FULLTIME
                    ,t09kuf.NEW_COUNTER_WORKTIME	as	SOLDESKUFRNEW_COUNTER_WORKTIME
                    ,t09kuf.NEW_HISTORY	as	SOLUTIONDESKUFRNEW_HISTORY
                    ,t09kuf.NEW_TYPE	as	SOLUTIONDESKUFRNEW_TYPE
                    ,t09kuf.NEW_TYPENAME	as	SOLUTIONDESKUFRNEW_TYPENAME
                    ,t09kuf.NEW_UZDL	as	SOLUTIONDESKUFRNEW_UZDL
                    ,t32od.ACTIVITYID	as	REAPPROVACTIVITYID
                    ,t32od.rn	as	REAPPROV_NO
                    ,t32od.ACTUALEND	as	REAPPROVACTUALEND
                    ,t32od.ACTUALSTART	as	REAPPROVACTUALSTART
                    ,t32od.CREATEDON	as	REAPPROVCREATEDON
                    ,t32od.NEW_APPROVALRESULT	as	REAPPROVNEW_APPROVALRESULT
                    ,t32od.NEW_APPROVALRESULTNAME	as	REAPPROVNEW_APPROVALRESULTNAME
                    ,t32od.NEW_COMMENTS	as	REAPPROVNEW_COMMENTS
                    ,t32od.NEW_COUNTER_FULLTIME	as	REAPPROVNEW_COUNTER_FULLTIME
                    ,t32od.NEW_COUNTER_WORKTIME	as	REAPPROVNEW_COUNTER_WORKTIME
                    ,t32od.NEW_HISTORY	as	REAPPROVNEW_HISTORY
                    ,t32od.NEW_TYPE	as	REAPPROVNEW_TYPE
                    ,t32od.NEW_TYPENAME	as	REAPPROVNEW_TYPENAME
                    ,t32od.NEW_UZDL	as	REAPPROVNEW_UZDL
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
    dm.u_log(GC_PROC_NAME, 'BEGIN','������ �������l ������ ������������� ������ �����������. ���� ������� '||to_char(p_snapshot_dt,'YYYY-MM-DD')
        ||' ������������ '||user);
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
    dm.u_log(GC_PROC_NAME,'END','������ �����������');
exception
    when others then
        dm.u_log(GC_PROC_NAME,'error' ,sqlerrm);
        raise;
end;
/
