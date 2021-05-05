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
        klassACTIVITYID,
        klass_NO,
        klassstart_flg,
        klassend_flg,
        klassACTUALEND,
        klassCREATEDON,
        klassNEW_APPROVALRESULT,
        klassNEW_APPROVALRESULTNAME,
        klassNEW_COMMENTS,
        klassNEW_COUNTER_FULLTIME,
        klassNEW_COUNTER_WORKTIME,
        klassNEW_HISTORY,
        klassNEW_TYPE,
        klassNEW_TYPENAME,
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
        null/*:p_SNAPSHOT_DT*/ SNAPSHOT_DT
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
        , r.klassACTIVITYID
        , r.klass_NO
        , r.klassstart_flg
        , r.klassend_flg
        , r.klassACTUALEND
        , r.klassCREATEDON
        , r.klassNEW_APPROVALRESULT
        , r.klassNEW_APPROVALRESULTNAME
        , r.klassNEW_COMMENTS
        , r.klassNEW_COUNTER_FULLTIME
        , r.klassNEW_COUNTER_WORKTIME
        , r.klassNEW_HISTORY
        , r.klassNEW_TYPE
        , r.klassNEW_TYPENAME
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
            ,t09.ACTIVITYID	as	klassACTIVITYID
            ,t09.rn	as	klass_NO
            ,t09.start_flg klassstart_flg
            ,t09.end_flg klassend_flg
            ,t09.ACTUALEND	as	klassACTUALEND
            ,t09.CREATEDON	as	klassCREATEDON
            ,t09.NEW_APPROVALRESULT	as	klassNEW_APPROVALRESULT
            ,t09.NEW_APPROVALRESULTNAME	as	klassNEW_APPROVALRESULTNAME
            ,t09.NEW_COMMENTS	as	klassNEW_COMMENTS
            ,t09.NEW_COUNTER_FULLTIME	as	klassNEW_COUNTER_FULLTIME
            ,t09.NEW_COUNTER_WORKTIME	as	klassNEW_COUNTER_WORKTIME
            ,t09.NEW_HISTORY	as	klassNEW_HISTORY
            ,t09.NEW_TYPE	as	klassNEW_TYPE
            ,t09.NEW_TYPENAME	as	klassNEW_TYPENAME
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
        --where r.opportunityid = 'AD44822B-9189-EA11-80FC-02BF0A010246'
        --where r.opportunityid = 'AAAA03DA-6754-E911-80F3-02BF0A010246'
        --where r.opportunityid = 'AABC7A2C-F319-EB11-8105-02BF0A010246'
        --where r.opportunityid = 'AA2F70C4-AEF1-EA11-80FE-02BF0A010246'
        --and l.rn <= greatest(nvl(t45.rn_m,1), nvl(t09.rn_m,1), nvl(t09kuf.rn_m,1), nvl(t15.rn_m,1), nvl(t11.rn_m,1), nvl(t16.rn_m,1), nvl(t29.rn_m,1), nvl(t31.rn_m,1), nvl(t32.rn_m,1), nvl(t32od.rn_m,1))
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
    ;
