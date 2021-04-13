-- Create table
create table DWH.ACCOUNT
(
    accountid                      VARCHAR2(36),
    createdon                      DATE,
    description                    VARCHAR2(4000),
    emailaddress1                  VARCHAR2(1000),
    industrycode                   NUMBER,
    industrycodename               VARCHAR2(1000),
    modifiedon                     DATE,
    name                           VARCHAR2(1000),
    new_4reliability_group         NUMBER,
    new_4reliability_groupname     VARCHAR2(1000),
    new_accountgroupid             VARCHAR2(36),
    new_accountgroupidname         VARCHAR2(1000),
    new_accountinductry            NUMBER,
    new_accountinductryname        VARCHAR2(1000),
    new_agent                      NUMBER,
    new_baza1                      NUMBER,
    new_baza2                      NUMBER,
    new_birthdaydate               DATE,
    new_black_list_date            DATE,
    new_ceochange                  NUMBER,
    new_ceochangename              VARCHAR2(1000),
    new_chekverification           NUMBER,
    new_cityphone                  NUMBER,
    new_companysite                VARCHAR2(1000),
    new_consent                    NUMBER,
    new_contactcentrid             VARCHAR2(36),
    new_contactcentridname         VARCHAR2(1000),
    new_coremanagerualid           VARCHAR2(36),
    new_coremanagerualidname       VARCHAR2(1000),
    new_date_appoiment             DATE,
    new_dateverification           DATE,
    new_duble1                     NUMBER,
    new_duble2                     NUMBER,
    new_email                      VARCHAR2(1000),
    new_exploitationpl1            VARCHAR2(1000),
    new_exploitationplmail         VARCHAR2(1000),
    new_exploitationplmobphone     VARCHAR2(1000),
    new_exploitationplphone        VARCHAR2(1000),
    new_exploitationplprof         VARCHAR2(1000),
    new_factsddress                VARCHAR2(36),
    new_factsddressname            VARCHAR2(1000),
    new_fio                        VARCHAR2(1000),
    new_fisical                    NUMBER,
    new_generalbuyer               VARCHAR2(4000),
    new_generalsuplier             VARCHAR2(4000),
    new_guarantor                  NUMBER,
    new_incidentsource             NUMBER,
    new_incidentsourcename         VARCHAR2(1000),
    new_inn                        VARCHAR2(1000),
    new_interest                   NUMBER,
    new_internet                   NUMBER,
    new_kpp                        VARCHAR2(1000),
    new_ky_customer                NUMBER,
    new_ky_speshlpr                NUMBER,
    new_leaseholder                NUMBER,
    new_legaddress                 VARCHAR2(36),
    new_legaddressname             VARCHAR2(1000),
    new_legalorganizationalform    NUMBER,
    new_legalorganizationalformnam VARCHAR2(1000),
    new_mobilephone                VARCHAR2(1000),
    new_num1c                      VARCHAR2(1000),
    new_obligations                NUMBER,
    new_officialdealer             NUMBER,
    new_ogrn                       VARCHAR2(1000),
    new_okvedid                    VARCHAR2(36),
    new_okvedidname                VARCHAR2(1000),
    new_ownerpl1                   VARCHAR2(1000),
    new_ownerplmail                VARCHAR2(1000),
    new_ownerplmobphone            VARCHAR2(1000),
    new_ownerplphone               VARCHAR2(1000),
    new_ownerplprof                VARCHAR2(1000),
    new_passport                   VARCHAR2(2000),
    new_paymentowner               VARCHAR2(1000),
    new_performer1                 VARCHAR2(1000),
    new_performermail              VARCHAR2(1000),
    new_performermobphone          VARCHAR2(1000),
    new_performerphone             VARCHAR2(1000),
    new_performerprof              VARCHAR2(1000),
    new_physicalinn                VARCHAR2(1000),
    new_postaddress                VARCHAR2(36),
    new_postaddressname            VARCHAR2(1000),
    new_profession                 VARCHAR2(1000),
    new_registrationaddress        VARCHAR2(2000),
    new_registrationdate           DATE,
    new_regulationsfz223           NUMBER,
    new_status                     NUMBER,
    new_statusname                 VARCHAR2(1000),
    new_subject                    NUMBER,
    new_supname                    VARCHAR2(2000),
    new_supplier                   NUMBER,
    new_suppliercategory           NUMBER,
    new_suppliercategoryname       VARCHAR2(1000),
    new_supplierid                 VARCHAR2(36),
    new_supplieridname             VARCHAR2(2000),
    new_suptype                    NUMBER,
    new_suptypename                VARCHAR2(1000),
    new_taxsystem                  NUMBER,
    new_taxsystemname              VARCHAR2(1000),
    new_territory                  VARCHAR2(36),
    new_territoryname              VARCHAR2(1000),
    new_uk                         NUMBER,
    new_unitar1                    NUMBER,
    new_workphone                  VARCHAR2(1000),
    ownerid                        VARCHAR2(36),
    owneridname                    VARCHAR2(1000),
    preferredcontactmethodcode     NUMBER,
    preferredcontactmethodcodename VARCHAR2(1000),
    primarycontactid               VARCHAR2(36),
    primarycontactidname           VARCHAR2(1000),
    statuscode                     NUMBER,
    statuscodename                 VARCHAR2(1000),
    telephone1                     VARCHAR2(1000),
    websiteurl                     VARCHAR2(1000),
    timeslotstart                  DATE,
    timeslotend                    DATE,
    sessionkey                     NUMBER,
    valid_from_dttm                DATE,
    valid_to_dttm                  DATE not null,
    dml_type                       VARCHAR2(1),
    dml_time                       DATE,
    sessionname                    VARCHAR2(100)
);
-- Add comments to the columns
comment on column DWH.ACCOUNT.accountid
  is ' Организация ';
comment on column DWH.ACCOUNT.createdon
  is ' Дата создания ';
comment on column DWH.ACCOUNT.description
  is ' Описание ';
comment on column DWH.ACCOUNT.emailaddress1
  is ' Электронная почта ';
comment on column DWH.ACCOUNT.industrycode
  is ' Вид деятельности ';
comment on column DWH.ACCOUNT.industrycodename
  is ' NULL ';
comment on column DWH.ACCOUNT.modifiedon
  is ' Дата изменения ';
comment on column DWH.ACCOUNT.name
  is ' Название организации ';
comment on column DWH.ACCOUNT.new_4reliability_group
  is ' Четвёртая группа надежности ';
comment on column DWH.ACCOUNT.new_4reliability_groupname
  is ' NULL ';
comment on column DWH.ACCOUNT.new_accountgroupid
  is ' Входит в группу компаний ';
comment on column DWH.ACCOUNT.new_accountgroupidname
  is ' NULL ';
comment on column DWH.ACCOUNT.new_accountinductry
  is ' Основной вид деятельности ';
comment on column DWH.ACCOUNT.new_accountinductryname
  is ' NULL ';
comment on column DWH.ACCOUNT.new_agent
  is ' Агент ';
comment on column DWH.ACCOUNT.new_baza1
  is ' Действует на основании: ';
comment on column DWH.ACCOUNT.new_baza2
  is ' Действует на основании: ';
comment on column DWH.ACCOUNT.new_birthdaydate
  is ' Дата рождения ';
comment on column DWH.ACCOUNT.new_black_list_date
  is ' Дата внесения в ЧС ';
comment on column DWH.ACCOUNT.new_ceochange
  is ' Изменение ЕИО\учредителей ';
comment on column DWH.ACCOUNT.new_ceochangename
  is ' NULL ';
comment on column DWH.ACCOUNT.new_chekverification
  is ' Проверен верификатором ';
comment on column DWH.ACCOUNT.new_cityphone
  is ' Наличие городского телефона: ';
comment on column DWH.ACCOUNT.new_companysite
  is ' Сайт компании ';
comment on column DWH.ACCOUNT.new_consent
  is ' Согласие на обработку персональных данных получено ';
comment on column DWH.ACCOUNT.new_contactcentrid
  is ' Сотрудник КЦ ';
comment on column DWH.ACCOUNT.new_contactcentridname
  is ' NULL ';
comment on column DWH.ACCOUNT.new_coremanagerualid
  is ' Основной менеджер продаж ';
comment on column DWH.ACCOUNT.new_coremanagerualidname
  is ' NULL ';
comment on column DWH.ACCOUNT.new_date_appoiment
  is ' Дата последней встречи ';
comment on column DWH.ACCOUNT.new_dateverification
  is ' Дата проведения последней верификации ';
comment on column DWH.ACCOUNT.new_duble1
  is ' Совпадает с фактическим ';
comment on column DWH.ACCOUNT.new_duble2
  is ' Совпадает с фактическим ';
comment on column DWH.ACCOUNT.new_email
  is ' Электронная почта (+) ';
comment on column DWH.ACCOUNT.new_exploitationpl1
  is ' Ответственный за эксплуатацию ПЛ ';
comment on column DWH.ACCOUNT.new_exploitationplmail
  is ' Электронная почта (эксплуатация ПЛ) ';
comment on column DWH.ACCOUNT.new_exploitationplmobphone
  is ' Мобильный телефон (эксплуатация ПЛ) ';
comment on column DWH.ACCOUNT.new_exploitationplphone
  is ' Рабочий телефон (эксплуатация ПЛ) ';
comment on column DWH.ACCOUNT.new_exploitationplprof
  is ' Должность (эксплуатация ПЛ) ';
comment on column DWH.ACCOUNT.new_factsddress
  is ' Фактический адрес ';
comment on column DWH.ACCOUNT.new_factsddressname
  is ' NULL ';
comment on column DWH.ACCOUNT.new_fio
  is ' ФИО ';
comment on column DWH.ACCOUNT.new_fisical
  is ' Физическое лицо ';
comment on column DWH.ACCOUNT.new_generalbuyer
  is ' Основные покупатели ';
comment on column DWH.ACCOUNT.new_generalsuplier
  is ' Основные поставщики ';
comment on column DWH.ACCOUNT.new_guarantor
  is ' Поручитель ';
comment on column DWH.ACCOUNT.new_incidentsource
  is ' Источник обращения ';
comment on column DWH.ACCOUNT.new_incidentsourcename
  is ' NULL ';
comment on column DWH.ACCOUNT.new_inn
  is ' ИНН ';
comment on column DWH.ACCOUNT.new_interest
  is ' Существует заинтересованность в совершении сделки? ';
comment on column DWH.ACCOUNT.new_internet
  is ' Наличие интернет-сайта: ';
comment on column DWH.ACCOUNT.new_kpp
  is ' КПП ';
comment on column DWH.ACCOUNT.new_ky_customer
  is ' Ключевой клиент ';
comment on column DWH.ACCOUNT.new_ky_speshlpr
  is ' Спецпроект ';
comment on column DWH.ACCOUNT.new_leaseholder
  is ' Лизингополучатель ';
comment on column DWH.ACCOUNT.new_legaddress
  is ' Юридический адрес ';
comment on column DWH.ACCOUNT.new_legaddressname
  is ' NULL ';
comment on column DWH.ACCOUNT.new_legalorganizationalform
  is ' Организационно-правовая форма организации ';
comment on column DWH.ACCOUNT.new_legalorganizationalformnam
  is ' NULL ';
comment on column DWH.ACCOUNT.new_mobilephone
  is ' Мобильный телефон ';
comment on column DWH.ACCOUNT.new_num1c
  is ' Код контрагента в 1С ';
comment on column DWH.ACCOUNT.new_obligations
  is ' Существуют ли обстоятельства, указанные в ст. 84.6 ';
comment on column DWH.ACCOUNT.new_officialdealer
  is ' Официальный поставщик ';
comment on column DWH.ACCOUNT.new_ogrn
  is ' ОГРН ';
comment on column DWH.ACCOUNT.new_okvedid
  is ' ОКВЭД ';
comment on column DWH.ACCOUNT.new_okvedidname
  is ' NULL ';
comment on column DWH.ACCOUNT.new_ownerpl1
  is ' Ответственный за приемку-передачу ПЛ ';
comment on column DWH.ACCOUNT.new_ownerplmail
  is ' Электронная почта (приемка-передача ПЛ) ';
comment on column DWH.ACCOUNT.new_ownerplmobphone
  is ' Мобильный телефон (приемка-передача ПЛ) ';
comment on column DWH.ACCOUNT.new_ownerplphone
  is ' Рабочий телефон (приемка-передача ПЛ) ';
comment on column DWH.ACCOUNT.new_ownerplprof
  is ' Должность (приемка-передача ПЛ) ';
comment on column DWH.ACCOUNT.new_passport
  is ' Паспортные данные ';
comment on column DWH.ACCOUNT.new_paymentowner
  is ' Ответственный за оплату лизинговых платежей ';
comment on column DWH.ACCOUNT.new_performer1
  is ' Ответственный (исполнитель) ';
comment on column DWH.ACCOUNT.new_performermail
  is ' Электронная почта (исполнитель) ';
comment on column DWH.ACCOUNT.new_performermobphone
  is ' Мобильный телефон (исполнитель) ';
comment on column DWH.ACCOUNT.new_performerphone
  is ' Рабочий телефон (исполнитель) ';
comment on column DWH.ACCOUNT.new_performerprof
  is ' Должность (исполнитель) ';
comment on column DWH.ACCOUNT.new_physicalinn
  is ' ИНН физического лица ';
comment on column DWH.ACCOUNT.new_postaddress
  is ' Почтовый адрес ';
comment on column DWH.ACCOUNT.new_postaddressname
  is ' NULL ';
comment on column DWH.ACCOUNT.new_profession
  is ' Должность ';
comment on column DWH.ACCOUNT.new_registrationaddress
  is ' Адрес регистрации ';
comment on column DWH.ACCOUNT.new_registrationdate
  is ' Дата регистрации компании ';
comment on column DWH.ACCOUNT.new_regulationsfz223
  is ' Применяет юридическое лицо положения ФЗ № 223 ';
comment on column DWH.ACCOUNT.new_status
  is ' Статус поставщика ';
comment on column DWH.ACCOUNT.new_statusname
  is ' NULL ';
comment on column DWH.ACCOUNT.new_subject
  is ' Общество субъект естественной монополии? ';
comment on column DWH.ACCOUNT.new_supname
  is ' Полное название организации ';
comment on column DWH.ACCOUNT.new_supplier
  is ' Поставщик ';
comment on column DWH.ACCOUNT.new_suppliercategory
  is ' Категория поставщика ';
comment on column DWH.ACCOUNT.new_suppliercategoryname
  is ' NULL ';
comment on column DWH.ACCOUNT.new_supplierid
  is ' Поставщик ';
comment on column DWH.ACCOUNT.new_supplieridname
  is ' NULL ';
comment on column DWH.ACCOUNT.new_suptype
  is ' Состояние контрагента ';
comment on column DWH.ACCOUNT.new_suptypename
  is ' NULL ';
comment on column DWH.ACCOUNT.new_taxsystem
  is ' Система налогообложения ';
comment on column DWH.ACCOUNT.new_taxsystemname
  is ' NULL ';
comment on column DWH.ACCOUNT.new_territory
  is ' Подразделение ';
comment on column DWH.ACCOUNT.new_territoryname
  is ' NULL ';
comment on column DWH.ACCOUNT.new_uk
  is ' Управляющая компания ';
comment on column DWH.ACCOUNT.new_unitar1
  is ' Подлежит ли унитарное предприятие приватизации ';
comment on column DWH.ACCOUNT.new_workphone
  is ' Рабочий телефон ';
comment on column DWH.ACCOUNT.ownerid
  is ' Ответственный ';
comment on column DWH.ACCOUNT.owneridname
  is ' NULL ';
comment on column DWH.ACCOUNT.preferredcontactmethodcode
  is ' Предпочтительный способ связи ';
comment on column DWH.ACCOUNT.preferredcontactmethodcodename
  is ' NULL ';
comment on column DWH.ACCOUNT.primarycontactid
  is ' Руководитель ';
comment on column DWH.ACCOUNT.primarycontactidname
  is ' NULL ';
comment on column DWH.ACCOUNT.statuscode
  is ' Статус ';
comment on column DWH.ACCOUNT.statuscodename
  is ' NULL ';
comment on column DWH.ACCOUNT.telephone1
  is ' Основной телефон ';
comment on column DWH.ACCOUNT.websiteurl
  is ' Веб-сайт ';
-- Create/Recreate indexes
create index DWH.ACCOUNT_INN on DWH.ACCOUNT (NEW_INN, NEW_PHYSICALINN);
create unique index DWH.U_ACCOUNT on DWH.ACCOUNT (ACCOUNTID, VALID_TO_DTTM, TIMESLOTSTART);


