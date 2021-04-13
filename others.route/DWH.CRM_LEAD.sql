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
  is 'Адрес 1: идентификатор';
comment on column DWH.CRM_LEAD.address2_addressid
  is 'Адрес 2: идентификатор';
comment on column DWH.CRM_LEAD.companyname
  is 'Краткое название организации';
comment on column DWH.CRM_LEAD.confirminterest
  is 'Подтвердить интерес';
comment on column DWH.CRM_LEAD.createdon
  is 'Дата создания';
comment on column DWH.CRM_LEAD.decisionmaker
  is 'Лицо, принимающее решения?';
comment on column DWH.CRM_LEAD.donotbulkemail
  is 'Запретить рассылку по электронной почте';
comment on column DWH.CRM_LEAD.donotsendmm
  is 'Маркетинговые материалы';
comment on column DWH.CRM_LEAD.evaluatefit
  is 'Оценить соответствие';
comment on column DWH.CRM_LEAD.exchangerate
  is 'Валютный курс';
comment on column DWH.CRM_LEAD.firstname
  is 'Имя';
comment on column DWH.CRM_LEAD.fullname
  is 'Полное имя';
comment on column DWH.CRM_LEAD.lastname
  is 'Фамилия';
comment on column DWH.CRM_LEAD.leadid
  is 'Интерес';
comment on column DWH.CRM_LEAD.leadqualitycode
  is 'Оценка';
comment on column DWH.CRM_LEAD.merged
  is 'Документ слияния';
comment on column DWH.CRM_LEAD.middlename
  is 'Отчество';
comment on column DWH.CRM_LEAD.new_agent_accountid
  is 'Агент';
comment on column DWH.CRM_LEAD.new_archive
  is 'Архив';
comment on column DWH.CRM_LEAD.new_businessunitid
  is 'Подразделение';
comment on column DWH.CRM_LEAD.new_callcenter
  is 'Call-center';
comment on column DWH.CRM_LEAD.new_clienttype
  is 'Тип лизингополучателя';
comment on column DWH.CRM_LEAD.new_contactcentr
  is 'Сотрудник КЦ';
comment on column DWH.CRM_LEAD.new_contactid
  is 'Существующий контакт';
comment on column DWH.CRM_LEAD.new_convertation
  is 'Конвертация';
comment on column DWH.CRM_LEAD.new_foreigncompany
  is 'Иностранный контрагент';
comment on column DWH.CRM_LEAD.new_greenlight
  is 'Можно создать запись';
comment on column DWH.CRM_LEAD.new_incidentsource
  is 'Источник обращения';
comment on column DWH.CRM_LEAD.new_industrytype
  is 'Вид деятельности компании клиента';
comment on column DWH.CRM_LEAD.new_interestopf
  is 'Форма собственности';
comment on column DWH.CRM_LEAD.new_landing
  is 'Landing';
comment on column DWH.CRM_LEAD.new_moreyear
  is 'Сотрудничают с Организацией больше года';
comment on column DWH.CRM_LEAD.new_new_contact
  is 'Новый контакт';
comment on column DWH.CRM_LEAD.new_numberlead
  is 'Номер интереса';
comment on column DWH.CRM_LEAD.new_ref_account
  is 'Существующий контрагент';
comment on column DWH.CRM_LEAD.new_type
  is 'Тип интереса';
comment on column DWH.CRM_LEAD.new_web
  is 'Web';
comment on column DWH.CRM_LEAD.parentaccountid
  is 'Родительская организация интереса';
comment on column DWH.CRM_LEAD.parentcontactid
  is 'Родительский контакт интереса';
comment on column DWH.CRM_LEAD.preferredcontactmethodcode
  is 'Предпочтительный способ связи';
comment on column DWH.CRM_LEAD.qualifyingopportunityid
  is 'Квалификация возможной сделки';
comment on column DWH.CRM_LEAD.statecode
  is 'Состояние';
comment on column DWH.CRM_LEAD.statuscode
  is 'Причина состояния';
comment on column DWH.CRM_LEAD.telephone1
  is 'Рабочий телефон';
comment on column DWH.CRM_LEAD.transactioncurrencyid
  is 'Валюта приобретения';
comment on column DWH.CRM_LEAD.vtbl_revenue_per_yearcode
  is 'Выручка в год';
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
  is 'Время начала TimeSlot-а ';
comment on column DWH.CRM_LEAD.timeslotend
  is 'Время конца TimeSlot-а ';
comment on column DWH.CRM_LEAD.sessionkey
  is 'Ключ сессии ';
-- Create/Recreate indexes
create unique index DWH.U_CRM_LEAD on DWH.CRM_LEAD (LEADID, ADDRESS1_ADDRESSID, ADDRESS2_ADDRESSID, VALID_TO_DTTM, TIMESLOTSTART);
