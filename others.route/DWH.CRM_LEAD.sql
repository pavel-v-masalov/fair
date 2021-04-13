-- Create table
create table DWH.CRM_LEAD
(
    address1_addressid             VARCHAR2(36),
    address2_addressid             VARCHAR2(36),
    companyname                    VARCHAR2(2000),
    confirminterest                NUMBER,
    createdon                      DATE,
    decisionmaker                  NUMBER,
    donotbulkemail                 NUMBER,
    donotsendmm                    NUMBER,
    evaluatefit                    NUMBER,
    exchangerate                   NUMBER,
    firstname                      VARCHAR2(1000),
    fullname                       VARCHAR2(1000),
    lastname                       VARCHAR2(1000),
    leadid                         VARCHAR2(36),
    leadqualitycode                NUMBER,
    leadqualitycodename            VARCHAR2(1000),
    merged                         NUMBER,
    middlename                     VARCHAR2(1000),
    new_agent_accountid            VARCHAR2(36),
    new_agent_accountidname        VARCHAR2(2000),
    new_archive                    NUMBER,
    new_businessunitid             VARCHAR2(36),
    new_businessunitidname         VARCHAR2(1000),
    new_callcenter                 NUMBER,
    new_clienttype                 NUMBER,
    new_clienttypename             VARCHAR2(1000),
    new_contactcentr               NUMBER,
    new_contactid                  VARCHAR2(36),
    new_contactidname              VARCHAR2(1000),
    new_convertation               NUMBER,
    new_foreigncompany             NUMBER,
    new_greenlight                 NUMBER,
    new_incidentsource             NUMBER,
    new_incidentsourcename         VARCHAR2(1000),
    new_industrytype               NUMBER,
    new_industrytypename           VARCHAR2(1000),
    new_interestopf                NUMBER,
    new_interestopfname            VARCHAR2(1000),
    new_landing                    NUMBER,
    new_moreyear                   NUMBER,
    new_new_contact                NUMBER,
    new_numberlead                 VARCHAR2(1000),
    new_ref_account                VARCHAR2(36),
    new_ref_accountname            VARCHAR2(2000),
    new_type                       NUMBER,
    new_typename                   VARCHAR2(1000),
    new_web                        NUMBER,
    parentaccountid                VARCHAR2(36),
    parentaccountidname            VARCHAR2(1000),
    parentcontactid                VARCHAR2(36),
    parentcontactidname            VARCHAR2(1000),
    preferredcontactmethodcode     NUMBER,
    preferredcontactmethodcodename VARCHAR2(1000),
    qualifyingopportunityid        VARCHAR2(36),
    qualifyingopportunityidname    VARCHAR2(1000),
    statecode                      NUMBER,
    statecodename                  VARCHAR2(1000),
    statuscode                     NUMBER,
    statuscodename                 VARCHAR2(1000),
    telephone1                     VARCHAR2(1000),
    transactioncurrencyid          VARCHAR2(36),
    transactioncurrencyidname      VARCHAR2(1000),
    vtbl_revenue_per_yearcode      NUMBER,
    vtbl_revenue_per_yearcodename  VARCHAR2(1000),
    vtbl_url                       VARCHAR2(1000),
    vtbl_utm_campaign              VARCHAR2(4000),
    vtbl_utm_medium                VARCHAR2(4000),
    vtbl_utm_source                VARCHAR2(4000),
    vtbl_utm_term                  VARCHAR2(4000),
    timeslotstart                  DATE,
    timeslotend                    DATE,
    sessionkey                     NUMBER,
    valid_from_dttm                DATE,
    valid_to_dttm                  DATE not null,
    dml_type                       VARCHAR2(1),
    dml_time                       TIMESTAMP(6),
    sessionname                    VARCHAR2(100)
);
-- Add comments to the columns
comment on column DWH.CRM_LEAD.address1_addressid
  is '����� 1: �������������';
comment on column DWH.CRM_LEAD.address2_addressid
  is '����� 2: �������������';
comment on column DWH.CRM_LEAD.companyname
  is '������� �������� �����������';
comment on column DWH.CRM_LEAD.confirminterest
  is '����������� �������';
comment on column DWH.CRM_LEAD.createdon
  is '���� ��������';
comment on column DWH.CRM_LEAD.decisionmaker
  is '����, ����������� �������?';
comment on column DWH.CRM_LEAD.donotbulkemail
  is '��������� �������� �� ����������� �����';
comment on column DWH.CRM_LEAD.donotsendmm
  is '������������� ���������';
comment on column DWH.CRM_LEAD.evaluatefit
  is '������� ������������';
comment on column DWH.CRM_LEAD.exchangerate
  is '�������� ����';
comment on column DWH.CRM_LEAD.firstname
  is '���';
comment on column DWH.CRM_LEAD.fullname
  is '������ ���';
comment on column DWH.CRM_LEAD.lastname
  is '�������';
comment on column DWH.CRM_LEAD.leadid
  is '�������';
comment on column DWH.CRM_LEAD.leadqualitycode
  is '������';
comment on column DWH.CRM_LEAD.merged
  is '�������� �������';
comment on column DWH.CRM_LEAD.middlename
  is '��������';
comment on column DWH.CRM_LEAD.new_agent_accountid
  is '�����';
comment on column DWH.CRM_LEAD.new_archive
  is '�����';
comment on column DWH.CRM_LEAD.new_businessunitid
  is '�������������';
comment on column DWH.CRM_LEAD.new_callcenter
  is 'Call-center';
comment on column DWH.CRM_LEAD.new_clienttype
  is '��� �����������������';
comment on column DWH.CRM_LEAD.new_contactcentr
  is '��������� ��';
comment on column DWH.CRM_LEAD.new_contactid
  is '������������ �������';
comment on column DWH.CRM_LEAD.new_convertation
  is '�����������';
comment on column DWH.CRM_LEAD.new_foreigncompany
  is '����������� ����������';
comment on column DWH.CRM_LEAD.new_greenlight
  is '����� ������� ������';
comment on column DWH.CRM_LEAD.new_incidentsource
  is '�������� ���������';
comment on column DWH.CRM_LEAD.new_industrytype
  is '��� ������������ �������� �������';
comment on column DWH.CRM_LEAD.new_interestopf
  is '����� �������������';
comment on column DWH.CRM_LEAD.new_landing
  is 'Landing';
comment on column DWH.CRM_LEAD.new_moreyear
  is '������������ � ������������ ������ ����';
comment on column DWH.CRM_LEAD.new_new_contact
  is '����� �������';
comment on column DWH.CRM_LEAD.new_numberlead
  is '����� ��������';
comment on column DWH.CRM_LEAD.new_ref_account
  is '������������ ����������';
comment on column DWH.CRM_LEAD.new_type
  is '��� ��������';
comment on column DWH.CRM_LEAD.new_web
  is 'Web';
comment on column DWH.CRM_LEAD.parentaccountid
  is '������������ ����������� ��������';
comment on column DWH.CRM_LEAD.parentcontactid
  is '������������ ������� ��������';
comment on column DWH.CRM_LEAD.preferredcontactmethodcode
  is '���������������� ������ �����';
comment on column DWH.CRM_LEAD.qualifyingopportunityid
  is '������������ ��������� ������';
comment on column DWH.CRM_LEAD.statecode
  is '���������';
comment on column DWH.CRM_LEAD.statuscode
  is '������� ���������';
comment on column DWH.CRM_LEAD.telephone1
  is '������� �������';
comment on column DWH.CRM_LEAD.transactioncurrencyid
  is '������ ������������';
comment on column DWH.CRM_LEAD.vtbl_revenue_per_yearcode
  is '������� � ���';
comment on column DWH.CRM_LEAD.vtbl_url
  is 'URL';
comment on column DWH.CRM_LEAD.vtbl_utm_campaign
  is 'utm_campaign';
comment on column DWH.CRM_LEAD.vtbl_utm_medium
  is 'utm_medium';
comment on column DWH.CRM_LEAD.vtbl_utm_source
  is 'utm_source';
comment on column DWH.CRM_LEAD.vtbl_utm_term
  is 'utm_term';
comment on column DWH.CRM_LEAD.timeslotstart
  is '����� ������ TimeSlot-� ';
comment on column DWH.CRM_LEAD.timeslotend
  is '����� ����� TimeSlot-� ';
comment on column DWH.CRM_LEAD.sessionkey
  is '���� ������ ';
-- Create/Recreate indexes
create unique index DWH.U_CRM_LEAD on DWH.CRM_LEAD (LEADID, ADDRESS1_ADDRESSID, ADDRESS2_ADDRESSID, VALID_TO_DTTM, TIMESLOTSTART);
