-- Create table
create table DM.LEASROUTING_MODELS
(
    snapshot_dt                           DATE,
    accountid                             VARCHAR2(36),
    createdon                             DATE,
    emailaddress1                         VARCHAR2(1000),
    industrycodename                      VARCHAR2(1000),
    orgname                               VARCHAR2(1000),
    new_accountinductryname               VARCHAR2(1000),
    new_black_list_date                   DATE,
    new_ceochangename                     VARCHAR2(1000),
    new_chekverification                  NUMBER,
    new_companysite                       VARCHAR2(1000),
    new_exploitationpl1                   VARCHAR2(1000),
    new_incidentsourcename                VARCHAR2(1000),
    new_inn                               VARCHAR2(1000),
    new_ky_customer                       NUMBER,
    new_ky_speshlpr                       NUMBER,
    new_legalorganizationalformnam        VARCHAR2(1000),
    new_mobilephone                       VARCHAR2(1000),
    new_ogrn                              VARCHAR2(1000),
    new_okvedidname                       VARCHAR2(1000),
    new_physicalinn                       VARCHAR2(1000),
    new_registrationaddress               VARCHAR2(2000),
    new_registrationdate                  DATE,
    primarycontactid                      VARCHAR2(36),
    primarycontactidname                  VARCHAR2(1000),
    websiteurl                            VARCHAR2(1000),
    relgroups                             VARCHAR2(200),
    relmax                                NUMBER,
    new_agentid                           VARCHAR2(36),
    new_allexpretisetasksclosed           NUMBER,
    new_approvalresultname                VARCHAR2(1000),
    new_factadress                        NUMBER,
    new_leasagreementcondconfirmed        NUMBER,
    new_nonfinancial                      NUMBER,
    new_opt                               NUMBER,
    new_podproductname                    VARCHAR2(1000),
    new_productidname                     VARCHAR2(1000),
    new_propertyrisk                      NUMBER,
    new_count                             VARCHAR2(100),
    new_routingbymodel                    NUMBER,
    new_statuscodeidname                  VARCHAR2(1000),
    new_totalfinancingsum                 NUMBER,
    new_totalfinancingsum_express         NUMBER,
    new_totalsumdealperiod                NUMBER,
    new_accountgroupid                    VARCHAR2(36),
    new_name                              VARCHAR2(2000),
    birthdate                             DATE,
    contactid                             VARCHAR2(36),
    firstname                             VARCHAR2(1000),
    gendercodename                        VARCHAR2(1000),
    jobtitle                              VARCHAR2(1000),
    middlename                            VARCHAR2(1000),
    mobilephone                           VARCHAR2(1000),
    new_address                           VARCHAR2(2000),
    new_contacttypename                   VARCHAR2(1000),
    vtbl_scoringscore                     NUMBER,
    new_docnumber                         VARCHAR2(1000),
    new_doctype                           NUMBER,
    new_doctypename                       VARCHAR2(1000),
    new_seria                             VARCHAR2(1000),
    new_startdate                         DATE,
    new_whengive                          DATE,
    new_whogive                           VARCHAR2(2000),
    leadid                                VARCHAR2(36),
    new_ref_accountname                   VARCHAR2(2000),
    new_web                               NUMBER,
    countedon                             DATE,
    creditmodeliscountable                NUMBER,
    financesum                            NUMBER,
    creditmodelresult                     NUMBER,
    new_financesum                        NUMBER,
    fraudmodelresult                      NUMBER,
    opportunitycreditresult               NUMBER,
    opportunityfraudresult                NUMBER,
    productop                             VARCHAR2(200),
    scoringscore                          NUMBER,
    isprescorig                           VARCHAR2(100),
    model_type                            VARCHAR2(100),
    calc_conditions                       VARCHAR2(100),
    isprescoringcall                      VARCHAR2(100),
    model_settings                        VARCHAR2(100),
    veractivityid                         VARCHAR2(36),
    ver_no                                NUMBER,
    veractualend                          DATE,
    veractualstart                        DATE,
    vercreatedon                          DATE,
    vernew_approvalresult                 NUMBER,
    vernew_approvalresultname             VARCHAR2(1000),
    vernew_comments                       VARCHAR2(4000),
    vernew_counter_fulltime               NUMBER,
    vernew_counter_worktime               NUMBER,
    vernew_history                        VARCHAR2(4000),
    vernew_type                           NUMBER,
    vernew_typename                       VARCHAR2(1000),
    vernew_uzdl                           NUMBER,
    reconfirmationactivityid              VARCHAR2(36),
    reconfirmation_no                     NUMBER,
    reconfirmationactualend               DATE,
    reconfirmationactualstart             DATE,
    reconfirmationcreatedon               DATE,
    RECONFIRMNEW_APPROVALRESULT      NUMBER,
    RECONFIRMNEW_APPROVALRESULTNM  VARCHAR2(1000),
    reconfirmationnew_comments            VARCHAR2(4000),
    RECONFIRMNEW_COUNTER_FULLTIME    NUMBER,
    RECONFIRMNEW_COUNTER_WORKTIME    NUMBER,
    reconfirmationnew_history             VARCHAR2(4000),
    reconfirmationnew_type                NUMBER,
    reconfirmationnew_typename            VARCHAR2(1000),
    reconfirmationnew_uzdl                NUMBER,
    expoybactivityid                      VARCHAR2(36),
    expoyb_no                             NUMBER,
    expoybactualend                       DATE,
    expoybactualstart                     DATE,
    expoybcreatedon                       DATE,
    expoybnew_approvalresult              NUMBER,
    expoybnew_approvalresultname          VARCHAR2(1000),
    expoybnew_comments                    VARCHAR2(4000),
    expoybnew_counter_fulltime            NUMBER,
    expoybnew_counter_worktime            NUMBER,
    expoybnew_history                     VARCHAR2(4000),
    expoybnew_type                        NUMBER,
    expoybnew_typename                    VARCHAR2(1000),
    expoybnew_uzdl                        NUMBER,
    repoybactivityid                      VARCHAR2(36),
    repoyb_no                             NUMBER,
    repoybactualend                       DATE,
    repoybactualstart                     DATE,
    repoybcreatedon                       DATE,
    repoybnew_approvalresult              NUMBER,
    repoybnew_approvalresultname          VARCHAR2(1000),
    repoybnew_comments                    VARCHAR2(4000),
    REPOYBNEW_COUNTER_FULLTIME      NUMBER,
    repoybnew_counter_worktime            NUMBER,
    repoybnew_history                     VARCHAR2(4000),
    repoybnew_type                        NUMBER,
    repoybnew_typename                    VARCHAR2(1000),
    repoybnew_uzdl                        NUMBER,
    expuakractivityid                     VARCHAR2(36),
    expuakr_no                            NUMBER,
    expuakractualend                      DATE,
    expuakractualstart                    DATE,
    expuakrcreatedon                      DATE,
    expuakrnew_approvalresult             NUMBER,
    expuakrnew_approvalresultname         VARCHAR2(1000),
    expuakrnew_comments                   VARCHAR2(4000),
    expuakrnew_counter_fulltime           NUMBER,
    expuakrnew_counter_worktime           NUMBER,
    expuakrnew_history                    VARCHAR2(4000),
    expuakrnew_type                       NUMBER,
    expuakrnew_typename                   VARCHAR2(1000),
    expuakrnew_uzdl                       NUMBER,
    repuakractivityid                     VARCHAR2(36),
    repuakr_no                            NUMBER,
    repuakractualend                      DATE,
    repuakractualstart                    DATE,
    repuakrcreatedon                      DATE,
    repuakrnew_approvalresult             NUMBER,
    repuakrnew_approvalresultname         VARCHAR2(1000),
    repuakrnew_comments                   VARCHAR2(4000),
    repuakrnew_counter_fulltime           NUMBER,
    repuakrnew_counter_worktime           NUMBER,
    repuakrnew_history                    VARCHAR2(4000),
    repuakrnew_type                       NUMBER,
    repuakrnew_typename                   VARCHAR2(1000),
    repuakrnew_uzdl                       NUMBER,
    underwritactivityid                   VARCHAR2(36),
    underwrit_no                          NUMBER,
    underwritactualend                    DATE,
    underwritactualstart                  DATE,
    underwritcreatedon                    DATE,
    underwritnew_approvalresult           NUMBER,
    UNDWRITNEW_APPROVALRESULTNAME       VARCHAR2(1000),
    underwritnew_comments                 VARCHAR2(4000),
    underwritnew_counter_fulltime         NUMBER,
    underwritnew_counter_worktime         NUMBER,
    underwritnew_history                  VARCHAR2(4000),
    underwritnew_type                     NUMBER,
    underwritnew_typename                 VARCHAR2(1000),
    underwritnew_uzdl                     NUMBER,
    solutiondesactivityid                 VARCHAR2(36),
    solutiondes_no                        NUMBER,
    solutiondesactualend                  DATE,
    solutiondesactualstart                DATE,
    solutiondescreatedon                  DATE,
    solutiondesnew_approvalresult         NUMBER,
    SOLDESNEW_APPROVALRESULTNAME     VARCHAR2(1000),
    solutiondesnew_comments               VARCHAR2(4000),
    SOLDESNEW_COUNTER_FULLTIME       NUMBER,
    SOLNDESNEW_COUNTER_WORKTIME       NUMBER,
    solutiondesnew_history                VARCHAR2(4000),
    solutiondesnew_type                   NUMBER,
    solutiondesnew_typename               VARCHAR2(1000),
    solutiondesnew_uzdl                   NUMBER,
    solutiondeskufractivityid             VARCHAR2(36),
    solutiondeskufr_no                    NUMBER,
    solutiondeskufractualend              DATE,
    solutiondeskufractualstart            DATE,
    solutiondeskufrcreatedon              DATE,
    SOLDESKUFRNEW_APPROVALRESULT     NUMBER,
    SOLDESKUFRNEW_APPROVALRESULTNM VARCHAR2(1000),
    solutiondeskufrnew_comments           VARCHAR2(4000),
    SOLDESKUFRNEW_COUNTER_FULLTIME   NUMBER,
    SOLDESKUFRNEW_COUNTER_WORKTIME   NUMBER,
    solutiondeskufrnew_history            VARCHAR2(4000),
    solutiondeskufrnew_type               NUMBER,
    solutiondeskufrnew_typename           VARCHAR2(1000),
    solutiondeskufrnew_uzdl               NUMBER,
    reapprovactivityid                    VARCHAR2(36),
    reapprov_no                           NUMBER,
    reapprovactualend                     DATE,
    reapprovactualstart                   DATE,
    reapprovcreatedon                     DATE,
    reapprovnew_approvalresult            NUMBER,
    reapprovnew_approvalresultname        VARCHAR2(1000),
    reapprovnew_comments                  VARCHAR2(4000),
    reapprovnew_counter_fulltime          NUMBER,
    reapprovnew_counter_worktime          NUMBER,
    reapprovnew_history                   VARCHAR2(4000),
    reapprovnew_type                      NUMBER,
    reapprovnew_typename                  VARCHAR2(1000),
    reapprovnew_uzdl                      NUMBER
);
comment on column DM.LEASROUTING_MODELS.SNAPSHOT_DT	is '�������� ����';
comment on column DM.LEASROUTING_MODELS.ACCOUNTID	is '�����������';
comment on column DM.LEASROUTING_MODELS.CREATEDON	is '���� ��������';
comment on column DM.LEASROUTING_MODELS.EMAILADDRESS1	is '����������� �����';
comment on column DM.LEASROUTING_MODELS.INDUSTRYCODENAME	is '��� ������������';
comment on column DM.LEASROUTING_MODELS.ORGNAME	is '�������� �����������';
comment on column DM.LEASROUTING_MODELS.NEW_ACCOUNTINDUCTRYNAME	is '�������� ��� ������������';
comment on column DM.LEASROUTING_MODELS.NEW_BLACK_LIST_DATE	is '���� �������� � ��';
comment on column DM.LEASROUTING_MODELS.NEW_CEOCHANGENAME	is '��������� ���\�����������';
comment on column DM.LEASROUTING_MODELS.NEW_CHEKVERIFICATION	is '�������� �������������';
comment on column DM.LEASROUTING_MODELS.NEW_COMPANYSITE	is '���� ��������';
comment on column DM.LEASROUTING_MODELS.NEW_EXPLOITATIONPL1	is '������������� �� ������������ ��';
comment on column DM.LEASROUTING_MODELS.NEW_INCIDENTSOURCENAME	is '�������� ���������';
comment on column DM.LEASROUTING_MODELS.NEW_INN	is '���';
comment on column DM.LEASROUTING_MODELS.NEW_KY_CUSTOMER	is '�������� ������';
comment on column DM.LEASROUTING_MODELS.NEW_KY_SPESHLPR	is '����������';
comment on column DM.LEASROUTING_MODELS.NEW_LEGALORGANIZATIONALFORMNAM	is '��������������-�������� ����� �����������';
comment on column DM.LEASROUTING_MODELS.NEW_MOBILEPHONE	is '��������� �������';
comment on column DM.LEASROUTING_MODELS.NEW_OGRN	is '����';
comment on column DM.LEASROUTING_MODELS.NEW_OKVEDIDNAME	is '�����';
comment on column DM.LEASROUTING_MODELS.NEW_PHYSICALINN	is '��� ����������� ����';
comment on column DM.LEASROUTING_MODELS.NEW_REGISTRATIONADDRESS	is '����� �����������';
comment on column DM.LEASROUTING_MODELS.NEW_REGISTRATIONDATE	is '���� ����������� ��������';
comment on column DM.LEASROUTING_MODELS.PRIMARYCONTACTID	is '������������';
comment on column DM.LEASROUTING_MODELS.PRIMARYCONTACTIDNAME	is '������������';
comment on column DM.LEASROUTING_MODELS.WEBSITEURL	is '���-����';
comment on column DM.LEASROUTING_MODELS.RELGROUPS	is '������ ����� ����������';
comment on column DM.LEASROUTING_MODELS.RELMAX	is '������������ ������';
comment on column DM.LEASROUTING_MODELS.NEW_AGENTID	is '����� (����������)';
comment on column DM.LEASROUTING_MODELS.NEW_ALLEXPRETISETASKSCLOSED	is '������� ��� ������ �� ����������';
comment on column DM.LEASROUTING_MODELS.NEW_APPROVALRESULTNAME	is '�������';
comment on column DM.LEASROUTING_MODELS.NEW_FACTADRESS	is '����������� ����� ������� ��';
comment on column DM.LEASROUTING_MODELS.NEW_LEASAGREEMENTCONDCONFIRMED	is '����/�� ���� ��������';
comment on column DM.LEASROUTING_MODELS.NEW_NONFINANCIAL	is '�������������� ������� � ������������� �� ����';
comment on column DM.LEASROUTING_MODELS.NEW_OPT	is '��������';
comment on column DM.LEASROUTING_MODELS.NEW_PODPRODUCTNAME	is '����������';
comment on column DM.LEASROUTING_MODELS.NEW_PRODUCTIDNAME	is '�������';
comment on column DM.LEASROUTING_MODELS.NEW_PROPERTYRISK	is '������� ������������� ����';
comment on column DM.LEASROUTING_MODELS.new_count is ' ';
comment on column DM.LEASROUTING_MODELS.NEW_ROUTINGBYMODEL	is '������������� �� ������';
comment on column DM.LEASROUTING_MODELS.NEW_STATUSCODEIDNAME	is '����';
comment on column DM.LEASROUTING_MODELS.NEW_TOTALFINANCINGSUM	is '���������� ����� �-�� �� �� � �� � ������ ���';
comment on column DM.LEASROUTING_MODELS.NEW_TOTALFINANCINGSUM_EXPRESS	is '���������� ����� �������������� �� �� � �� Express';
comment on column DM.LEASROUTING_MODELS.NEW_TOTALSUMDEALPERIOD	is '����� ����� ����������� ������, �� ������';
comment on column DM.LEASROUTING_MODELS.NEW_ACCOUNTGROUPID	is '������ ��������';
comment on column DM.LEASROUTING_MODELS.NEW_NAME	is '���';
comment on column DM.LEASROUTING_MODELS.BIRTHDATE	is '���� ��������';
comment on column DM.LEASROUTING_MODELS.CONTACTID	is '�������';
comment on column DM.LEASROUTING_MODELS.FIRSTNAME	is '���';
comment on column DM.LEASROUTING_MODELS.GENDERCODENAME	is '���';
comment on column DM.LEASROUTING_MODELS.JOBTITLE	is '���������';
comment on column DM.LEASROUTING_MODELS.MIDDLENAME	is '��������';
comment on column DM.LEASROUTING_MODELS.MOBILEPHONE	is '��������� �������';
comment on column DM.LEASROUTING_MODELS.NEW_ADDRESS	is '����� �����������';
comment on column DM.LEASROUTING_MODELS.NEW_CONTACTTYPENAME	is '��� ��������';
comment on column DM.LEASROUTING_MODELS.VTBL_SCORINGSCORE	is '�������-���� ���';
comment on column DM.LEASROUTING_MODELS.NEW_DOCNUMBER	is '�����';
comment on column DM.LEASROUTING_MODELS.NEW_DOCTYPE	is '��� ���������';
comment on column DM.LEASROUTING_MODELS.NEW_DOCTYPENAME	is 'NULL';
comment on column DM.LEASROUTING_MODELS.NEW_SERIA	is '�����';
comment on column DM.LEASROUTING_MODELS.NEW_STARTDATE	is '��������� �';
comment on column DM.LEASROUTING_MODELS.NEW_WHENGIVE	is '����� �����';
comment on column DM.LEASROUTING_MODELS.NEW_WHOGIVE	is '��� �����';
comment on column DM.LEASROUTING_MODELS.LEADID	is '�������';
comment on column DM.LEASROUTING_MODELS.NEW_REF_ACCOUNTNAME	is '��� ��������';
comment on column DM.LEASROUTING_MODELS.NEW_WEB	is '������������ ����������� ��������';
comment on column DM.LEASROUTING_MODELS.COUNTEDON	is '����� � ���� ������� �� �������';
comment on column DM.LEASROUTING_MODELS.CREDITMODELISCOUNTABLE	is '����� ���������� ��������� ������';
comment on column DM.LEASROUTING_MODELS.FINANCESUM	is '���������� ����� �-�� �� �� � �� � ������ ��� (���������� ������)';
comment on column DM.LEASROUTING_MODELS.CREDITMODELRESULT	is '������ ���������� ����� (���������� ������)';
comment on column DM.LEASROUTING_MODELS.NEW_FINANCESUM	is '��� �� ������ ��� ��';
comment on column DM.LEASROUTING_MODELS.FRAUDMODELRESULT	is '������ ���� ����� (���������� ������)';
comment on column DM.LEASROUTING_MODELS.OPPORTUNITYCREDITRESULT	is '������� ���� ������� �� ������';
comment on column DM.LEASROUTING_MODELS.OPPORTUNITYFRAUDRESULT	is '������� ���� ������� �� ������';
comment on column DM.LEASROUTING_MODELS.PRODUCTOP	is '������� �� ���������� ������';
comment on column DM.LEASROUTING_MODELS.SCORINGSCORE	is '���� ����';
comment on column DM.LEASROUTING_MODELS.isPrescorig	is '������ � ������ �����������';
comment on column DM.LEASROUTING_MODELS.MODEL_TYPE	is '��� ������';
comment on column DM.LEASROUTING_MODELS.calc_conditions	is '������� ��������� � ���������';
comment on column DM.LEASROUTING_MODELS.ISPRESCORINGCALL	is '������ � ������ �����������';
comment on column DM.LEASROUTING_MODELS.model_settings	is '������ ���������� ������� �� ������ �������';
comment on column DM.LEASROUTING_MODELS.VERACTIVITYID	is '������';
comment on column DM.LEASROUTING_MODELS.VER_NO	is '����� ������ ������ �������';
comment on column DM.LEASROUTING_MODELS.VERACTUALEND	is '����������� ���������';
comment on column DM.LEASROUTING_MODELS.VERACTUALSTART	is '����������� ������';
comment on column DM.LEASROUTING_MODELS.VERCREATEDON	is '���� ��������';
comment on column DM.LEASROUTING_MODELS.VERNEW_APPROVALRESULT	is '�������';
comment on column DM.LEASROUTING_MODELS.VERNEW_APPROVALRESULTNAME	is '�������';
comment on column DM.LEASROUTING_MODELS.VERNEW_COMMENTS	is '��������� ���������� ������';
comment on column DM.LEASROUTING_MODELS.VERNEW_COUNTER_FULLTIME	is '������ ����� (���.)';
comment on column DM.LEASROUTING_MODELS.VERNEW_COUNTER_WORKTIME	is '����� ������ � ������� (���.)';
comment on column DM.LEASROUTING_MODELS.VERNEW_HISTORY	is '������� ���������� ������';
comment on column DM.LEASROUTING_MODELS.VERNEW_TYPE	is '��� ������';
comment on column DM.LEASROUTING_MODELS.VERNEW_TYPENAME	is '��� ������';
comment on column DM.LEASROUTING_MODELS.VERNEW_UZDL	is '������ � ������ ����';
comment on column DM.LEASROUTING_MODELS.RECONFIRMATIONACTIVITYID	is '������';
comment on column DM.LEASROUTING_MODELS.RECONFIRMATION_NO	is '����� ������ ������ �������';
comment on column DM.LEASROUTING_MODELS.RECONFIRMATIONACTUALEND	is '����������� ���������';
comment on column DM.LEASROUTING_MODELS.RECONFIRMATIONACTUALSTART	is '����������� ������';
comment on column DM.LEASROUTING_MODELS.RECONFIRMATIONCREATEDON	is '���� ��������';
comment on column DM.LEASROUTING_MODELS.RECONFIRMNEW_APPROVALRESULT	is '�������';
comment on column DM.LEASROUTING_MODELS.RECONFIRMNEW_APPROVALRESULTNM	is '�������';
comment on column DM.LEASROUTING_MODELS.RECONFIRMATIONNEW_COMMENTS	is '��������� ���������� ������';
comment on column DM.LEASROUTING_MODELS.RECONFIRMNEW_COUNTER_FULLTIME	is '������ ����� (���.)';
comment on column DM.LEASROUTING_MODELS.RECONFIRMNEW_COUNTER_WORKTIME	is '����� ������ � ������� (���.)';
comment on column DM.LEASROUTING_MODELS.RECONFIRMATIONNEW_HISTORY	is '������� ���������� ������';
comment on column DM.LEASROUTING_MODELS.RECONFIRMATIONNEW_TYPE	is '��� ������';
comment on column DM.LEASROUTING_MODELS.RECONFIRMATIONNEW_TYPENAME	is '��� ������';
comment on column DM.LEASROUTING_MODELS.RECONFIRMATIONNEW_UZDL	is '������ � ������ ����';
comment on column DM.LEASROUTING_MODELS.EXPOYBACTIVITYID	is '������';
comment on column DM.LEASROUTING_MODELS.EXPOYB_NO	is '����� ������ ������ �������';
comment on column DM.LEASROUTING_MODELS.EXPOYBACTUALEND	is '����������� ���������';
comment on column DM.LEASROUTING_MODELS.EXPOYBACTUALSTART	is '����������� ������';
comment on column DM.LEASROUTING_MODELS.EXPOYBCREATEDON	is '���� ��������';
comment on column DM.LEASROUTING_MODELS.EXPOYBNEW_APPROVALRESULT	is '�������';
comment on column DM.LEASROUTING_MODELS.EXPOYBNEW_APPROVALRESULTNAME	is '�������';
comment on column DM.LEASROUTING_MODELS.EXPOYBNEW_COMMENTS	is '��������� ���������� ������';
comment on column DM.LEASROUTING_MODELS.EXPOYBNEW_COUNTER_FULLTIME	is '������ ����� (���.)';
comment on column DM.LEASROUTING_MODELS.EXPOYBNEW_COUNTER_WORKTIME	is '����� ������ � ������� (���.)';
comment on column DM.LEASROUTING_MODELS.EXPOYBNEW_HISTORY	is '������� ���������� ������';
comment on column DM.LEASROUTING_MODELS.EXPOYBNEW_TYPE	is '��� ������';
comment on column DM.LEASROUTING_MODELS.EXPOYBNEW_TYPENAME	is '��� ������';
comment on column DM.LEASROUTING_MODELS.EXPOYBNEW_UZDL	is '������ � ������ ����';
comment on column DM.LEASROUTING_MODELS.REPOYBACTIVITYID	is '������';
comment on column DM.LEASROUTING_MODELS.REPOYB_NO	is '����� ������ ������ �������';
comment on column DM.LEASROUTING_MODELS.REPOYBACTUALEND	is '����������� ���������';
comment on column DM.LEASROUTING_MODELS.REPOYBACTUALSTART	is '����������� ������';
comment on column DM.LEASROUTING_MODELS.REPOYBCREATEDON	is '���� ��������';
comment on column DM.LEASROUTING_MODELS.REPOYBNEW_APPROVALRESULT	is '�������';
comment on column DM.LEASROUTING_MODELS.REPOYBNEW_APPROVALRESULTNAME	is '�������';
comment on column DM.LEASROUTING_MODELS.REPOYBNEW_COMMENTS	is '��������� ���������� ������';
comment on column DM.LEASROUTING_MODELS.REPOYBNEW_COUNTER_FULLTIME	is '������ ����� (���.)';
comment on column DM.LEASROUTING_MODELS.REPOYBNEW_COUNTER_WORKTIME	is '����� ������ � ������� (���.)';
comment on column DM.LEASROUTING_MODELS.REPOYBNEW_HISTORY	is '������� ���������� ������';
comment on column DM.LEASROUTING_MODELS.REPOYBNEW_TYPE	is '��� ������';
comment on column DM.LEASROUTING_MODELS.REPOYBNEW_TYPENAME	is '��� ������';
comment on column DM.LEASROUTING_MODELS.REPOYBNEW_UZDL	is '������ � ������ ����';
comment on column DM.LEASROUTING_MODELS.EXPUAKRACTIVITYID	is '������';
comment on column DM.LEASROUTING_MODELS.EXPUAKR_NO	is '����� ������ ������ �������';
comment on column DM.LEASROUTING_MODELS.EXPUAKRACTUALEND	is '����������� ���������';
comment on column DM.LEASROUTING_MODELS.EXPUAKRACTUALSTART	is '����������� ������';
comment on column DM.LEASROUTING_MODELS.EXPUAKRCREATEDON	is '���� ��������';
comment on column DM.LEASROUTING_MODELS.EXPUAKRNEW_APPROVALRESULT	is '�������';
comment on column DM.LEASROUTING_MODELS.EXPUAKRNEW_APPROVALRESULTNAME	is '�������';
comment on column DM.LEASROUTING_MODELS.EXPUAKRNEW_COMMENTS	is '��������� ���������� ������';
comment on column DM.LEASROUTING_MODELS.EXPUAKRNEW_COUNTER_FULLTIME	is '������ ����� (���.)';
comment on column DM.LEASROUTING_MODELS.EXPUAKRNEW_COUNTER_WORKTIME	is '����� ������ � ������� (���.)';
comment on column DM.LEASROUTING_MODELS.EXPUAKRNEW_HISTORY	is '������� ���������� ������';
comment on column DM.LEASROUTING_MODELS.EXPUAKRNEW_TYPE	is '��� ������';
comment on column DM.LEASROUTING_MODELS.EXPUAKRNEW_TYPENAME	is '��� ������';
comment on column DM.LEASROUTING_MODELS.EXPUAKRNEW_UZDL	is '������ � ������ ����';
comment on column DM.LEASROUTING_MODELS.REPUAKRACTIVITYID	is '������';
comment on column DM.LEASROUTING_MODELS.REPUAKR_NO	is '����� ������ ������ �������';
comment on column DM.LEASROUTING_MODELS.REPUAKRACTUALEND	is '����������� ���������';
comment on column DM.LEASROUTING_MODELS.REPUAKRACTUALSTART	is '����������� ������';
comment on column DM.LEASROUTING_MODELS.REPUAKRCREATEDON	is '���� ��������';
comment on column DM.LEASROUTING_MODELS.REPUAKRNEW_APPROVALRESULT	is '�������';
comment on column DM.LEASROUTING_MODELS.REPUAKRNEW_APPROVALRESULTNAME	is '�������';
comment on column DM.LEASROUTING_MODELS.REPUAKRNEW_COMMENTS	is '��������� ���������� ������';
comment on column DM.LEASROUTING_MODELS.REPUAKRNEW_COUNTER_FULLTIME	is '������ ����� (���.)';
comment on column DM.LEASROUTING_MODELS.REPUAKRNEW_COUNTER_WORKTIME	is '����� ������ � ������� (���.)';
comment on column DM.LEASROUTING_MODELS.REPUAKRNEW_HISTORY	is '������� ���������� ������';
comment on column DM.LEASROUTING_MODELS.REPUAKRNEW_TYPE	is '��� ������';
comment on column DM.LEASROUTING_MODELS.REPUAKRNEW_TYPENAME	is '��� ������';
comment on column DM.LEASROUTING_MODELS.REPUAKRNEW_UZDL	is '������ � ������ ����';
comment on column DM.LEASROUTING_MODELS.UNDERWRITACTIVITYID	is '������';
comment on column DM.LEASROUTING_MODELS.UNDERWRIT_NO	is '����� ������ ������ �������';
comment on column DM.LEASROUTING_MODELS.UNDERWRITACTUALEND	is '����������� ���������';
comment on column DM.LEASROUTING_MODELS.UNDERWRITACTUALSTART	is '����������� ������';
comment on column DM.LEASROUTING_MODELS.UNDERWRITCREATEDON	is '���� ��������';
comment on column DM.LEASROUTING_MODELS.UNDERWRITNEW_APPROVALRESULT	is '�������';
comment on column DM.LEASROUTING_MODELS.UNDWRITNEW_APPROVALRESULTNAME	is '�������';
comment on column DM.LEASROUTING_MODELS.UNDERWRITNEW_COMMENTS	is '��������� ���������� ������';
comment on column DM.LEASROUTING_MODELS.UNDERWRITNEW_COUNTER_FULLTIME	is '������ ����� (���.)';
comment on column DM.LEASROUTING_MODELS.UNDERWRITNEW_COUNTER_WORKTIME	is '����� ������ � ������� (���.)';
comment on column DM.LEASROUTING_MODELS.UNDERWRITNEW_HISTORY	is '������� ���������� ������';
comment on column DM.LEASROUTING_MODELS.UNDERWRITNEW_TYPE	is '��� ������';
comment on column DM.LEASROUTING_MODELS.UNDERWRITNEW_TYPENAME	is '��� ������';
comment on column DM.LEASROUTING_MODELS.UNDERWRITNEW_UZDL	is '������ � ������ ����';
comment on column DM.LEASROUTING_MODELS.SOLUTIONDESACTIVITYID	is '������';
comment on column DM.LEASROUTING_MODELS.SOLUTIONDES_NO	is '����� ������ ������ �������';
comment on column DM.LEASROUTING_MODELS.SOLUTIONDESACTUALEND	is '����������� ���������';
comment on column DM.LEASROUTING_MODELS.SOLUTIONDESACTUALSTART	is '����������� ������';
comment on column DM.LEASROUTING_MODELS.SOLUTIONDESCREATEDON	is '���� ��������';
comment on column DM.LEASROUTING_MODELS.SOLUTIONDESNEW_APPROVALRESULT	is '�������';
comment on column DM.LEASROUTING_MODELS.SOLDESNEW_APPROVALRESULTNAME	is '�������';
comment on column DM.LEASROUTING_MODELS.SOLUTIONDESNEW_COMMENTS	is '��������� ���������� ������';
comment on column DM.LEASROUTING_MODELS.SOLDESNEW_COUNTER_FULLTIME	is '������ ����� (���.)';
comment on column DM.LEASROUTING_MODELS.SOLNDESNEW_COUNTER_WORKTIME	is '����� ������ � ������� (���.)';
comment on column DM.LEASROUTING_MODELS.SOLUTIONDESNEW_HISTORY	is '������� ���������� ������';
comment on column DM.LEASROUTING_MODELS.SOLUTIONDESNEW_TYPE	is '��� ������';
comment on column DM.LEASROUTING_MODELS.SOLUTIONDESNEW_TYPENAME	is '��� ������';
comment on column DM.LEASROUTING_MODELS.SOLUTIONDESNEW_UZDL	is '������ � ������ ����';
comment on column DM.LEASROUTING_MODELS.SOLUTIONDESKUFRACTIVITYID	is '������';
comment on column DM.LEASROUTING_MODELS.SOLUTIONDESKUFR_NO	is '����� ������ ������ �������';
comment on column DM.LEASROUTING_MODELS.SOLUTIONDESKUFRACTUALEND	is '����������� ���������';
comment on column DM.LEASROUTING_MODELS.SOLUTIONDESKUFRACTUALSTART	is '����������� ������';
comment on column DM.LEASROUTING_MODELS.SOLUTIONDESKUFRCREATEDON	is '���� ��������';
comment on column DM.LEASROUTING_MODELS.SOLDESKUFRNEW_APPROVALRESULT	is '�������';
comment on column DM.LEASROUTING_MODELS.SOLDESKUFRNEW_APPROVALRESULTNM	is '�������';
comment on column DM.LEASROUTING_MODELS.SOLUTIONDESKUFRNEW_COMMENTS	is '��������� ���������� ������';
comment on column DM.LEASROUTING_MODELS.SOLDESKUFRNEW_COUNTER_FULLTIME	is '������ ����� (���.)';
comment on column DM.LEASROUTING_MODELS.SOLDESKUFRNEW_COUNTER_WORKTIME	is '����� ������ � ������� (���.)';
comment on column DM.LEASROUTING_MODELS.SOLUTIONDESKUFRNEW_HISTORY	is '������� ���������� ������';
comment on column DM.LEASROUTING_MODELS.SOLUTIONDESKUFRNEW_TYPE	is '��� ������';
comment on column DM.LEASROUTING_MODELS.SOLUTIONDESKUFRNEW_TYPENAME	is '��� ������';
comment on column DM.LEASROUTING_MODELS.SOLUTIONDESKUFRNEW_UZDL	is '������ � ������ ����';
comment on column DM.LEASROUTING_MODELS.REAPPROVACTIVITYID	is '������';
comment on column DM.LEASROUTING_MODELS.REAPPROV_NO	is '����� ������ ������ �������';
comment on column DM.LEASROUTING_MODELS.REAPPROVACTUALEND	is '����������� ���������';
comment on column DM.LEASROUTING_MODELS.REAPPROVACTUALSTART	is '����������� ������';
comment on column DM.LEASROUTING_MODELS.REAPPROVCREATEDON	is '���� ��������';
comment on column DM.LEASROUTING_MODELS.REAPPROVNEW_APPROVALRESULT	is '�������';
comment on column DM.LEASROUTING_MODELS.REAPPROVNEW_APPROVALRESULTNAME	is '�������';
comment on column DM.LEASROUTING_MODELS.REAPPROVNEW_COMMENTS	is '��������� ���������� ������';
comment on column DM.LEASROUTING_MODELS.REAPPROVNEW_COUNTER_FULLTIME	is '������ ����� (���.)';
comment on column DM.LEASROUTING_MODELS.REAPPROVNEW_COUNTER_WORKTIME	is '����� ������ � ������� (���.)';
comment on column DM.LEASROUTING_MODELS.REAPPROVNEW_HISTORY	is '������� ���������� ������';
comment on column DM.LEASROUTING_MODELS.REAPPROVNEW_TYPE	is '��� ������';
comment on column DM.LEASROUTING_MODELS.REAPPROVNEW_TYPENAME	is '��� ������';
comment on column DM.LEASROUTING_MODELS.REAPPROVNEW_UZDL	is '������ � ������ ����';
