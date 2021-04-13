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
  is ' ����������� ';
comment on column DWH.ACCOUNT.createdon
  is ' ���� �������� ';
comment on column DWH.ACCOUNT.description
  is ' �������� ';
comment on column DWH.ACCOUNT.emailaddress1
  is ' ����������� ����� ';
comment on column DWH.ACCOUNT.industrycode
  is ' ��� ������������ ';
comment on column DWH.ACCOUNT.industrycodename
  is ' NULL ';
comment on column DWH.ACCOUNT.modifiedon
  is ' ���� ��������� ';
comment on column DWH.ACCOUNT.name
  is ' �������� ����������� ';
comment on column DWH.ACCOUNT.new_4reliability_group
  is ' �������� ������ ���������� ';
comment on column DWH.ACCOUNT.new_4reliability_groupname
  is ' NULL ';
comment on column DWH.ACCOUNT.new_accountgroupid
  is ' ������ � ������ �������� ';
comment on column DWH.ACCOUNT.new_accountgroupidname
  is ' NULL ';
comment on column DWH.ACCOUNT.new_accountinductry
  is ' �������� ��� ������������ ';
comment on column DWH.ACCOUNT.new_accountinductryname
  is ' NULL ';
comment on column DWH.ACCOUNT.new_agent
  is ' ����� ';
comment on column DWH.ACCOUNT.new_baza1
  is ' ��������� �� ���������: ';
comment on column DWH.ACCOUNT.new_baza2
  is ' ��������� �� ���������: ';
comment on column DWH.ACCOUNT.new_birthdaydate
  is ' ���� �������� ';
comment on column DWH.ACCOUNT.new_black_list_date
  is ' ���� �������� � �� ';
comment on column DWH.ACCOUNT.new_ceochange
  is ' ��������� ���\����������� ';
comment on column DWH.ACCOUNT.new_ceochangename
  is ' NULL ';
comment on column DWH.ACCOUNT.new_chekverification
  is ' �������� ������������� ';
comment on column DWH.ACCOUNT.new_cityphone
  is ' ������� ���������� ��������: ';
comment on column DWH.ACCOUNT.new_companysite
  is ' ���� �������� ';
comment on column DWH.ACCOUNT.new_consent
  is ' �������� �� ��������� ������������ ������ �������� ';
comment on column DWH.ACCOUNT.new_contactcentrid
  is ' ��������� �� ';
comment on column DWH.ACCOUNT.new_contactcentridname
  is ' NULL ';
comment on column DWH.ACCOUNT.new_coremanagerualid
  is ' �������� �������� ������ ';
comment on column DWH.ACCOUNT.new_coremanagerualidname
  is ' NULL ';
comment on column DWH.ACCOUNT.new_date_appoiment
  is ' ���� ��������� ������� ';
comment on column DWH.ACCOUNT.new_dateverification
  is ' ���� ���������� ��������� ����������� ';
comment on column DWH.ACCOUNT.new_duble1
  is ' ��������� � ����������� ';
comment on column DWH.ACCOUNT.new_duble2
  is ' ��������� � ����������� ';
comment on column DWH.ACCOUNT.new_email
  is ' ����������� ����� (+) ';
comment on column DWH.ACCOUNT.new_exploitationpl1
  is ' ������������� �� ������������ �� ';
comment on column DWH.ACCOUNT.new_exploitationplmail
  is ' ����������� ����� (������������ ��) ';
comment on column DWH.ACCOUNT.new_exploitationplmobphone
  is ' ��������� ������� (������������ ��) ';
comment on column DWH.ACCOUNT.new_exploitationplphone
  is ' ������� ������� (������������ ��) ';
comment on column DWH.ACCOUNT.new_exploitationplprof
  is ' ��������� (������������ ��) ';
comment on column DWH.ACCOUNT.new_factsddress
  is ' ����������� ����� ';
comment on column DWH.ACCOUNT.new_factsddressname
  is ' NULL ';
comment on column DWH.ACCOUNT.new_fio
  is ' ��� ';
comment on column DWH.ACCOUNT.new_fisical
  is ' ���������� ���� ';
comment on column DWH.ACCOUNT.new_generalbuyer
  is ' �������� ���������� ';
comment on column DWH.ACCOUNT.new_generalsuplier
  is ' �������� ���������� ';
comment on column DWH.ACCOUNT.new_guarantor
  is ' ���������� ';
comment on column DWH.ACCOUNT.new_incidentsource
  is ' �������� ��������� ';
comment on column DWH.ACCOUNT.new_incidentsourcename
  is ' NULL ';
comment on column DWH.ACCOUNT.new_inn
  is ' ��� ';
comment on column DWH.ACCOUNT.new_interest
  is ' ���������� ������������������ � ���������� ������? ';
comment on column DWH.ACCOUNT.new_internet
  is ' ������� ��������-�����: ';
comment on column DWH.ACCOUNT.new_kpp
  is ' ��� ';
comment on column DWH.ACCOUNT.new_ky_customer
  is ' �������� ������ ';
comment on column DWH.ACCOUNT.new_ky_speshlpr
  is ' ���������� ';
comment on column DWH.ACCOUNT.new_leaseholder
  is ' ����������������� ';
comment on column DWH.ACCOUNT.new_legaddress
  is ' ����������� ����� ';
comment on column DWH.ACCOUNT.new_legaddressname
  is ' NULL ';
comment on column DWH.ACCOUNT.new_legalorganizationalform
  is ' ��������������-�������� ����� ����������� ';
comment on column DWH.ACCOUNT.new_legalorganizationalformnam
  is ' NULL ';
comment on column DWH.ACCOUNT.new_mobilephone
  is ' ��������� ������� ';
comment on column DWH.ACCOUNT.new_num1c
  is ' ��� ����������� � 1� ';
comment on column DWH.ACCOUNT.new_obligations
  is ' ���������� �� ��������������, ��������� � ��. 84.6 ';
comment on column DWH.ACCOUNT.new_officialdealer
  is ' ����������� ��������� ';
comment on column DWH.ACCOUNT.new_ogrn
  is ' ���� ';
comment on column DWH.ACCOUNT.new_okvedid
  is ' ����� ';
comment on column DWH.ACCOUNT.new_okvedidname
  is ' NULL ';
comment on column DWH.ACCOUNT.new_ownerpl1
  is ' ������������� �� �������-�������� �� ';
comment on column DWH.ACCOUNT.new_ownerplmail
  is ' ����������� ����� (�������-�������� ��) ';
comment on column DWH.ACCOUNT.new_ownerplmobphone
  is ' ��������� ������� (�������-�������� ��) ';
comment on column DWH.ACCOUNT.new_ownerplphone
  is ' ������� ������� (�������-�������� ��) ';
comment on column DWH.ACCOUNT.new_ownerplprof
  is ' ��������� (�������-�������� ��) ';
comment on column DWH.ACCOUNT.new_passport
  is ' ���������� ������ ';
comment on column DWH.ACCOUNT.new_paymentowner
  is ' ������������� �� ������ ���������� �������� ';
comment on column DWH.ACCOUNT.new_performer1
  is ' ������������� (�����������) ';
comment on column DWH.ACCOUNT.new_performermail
  is ' ����������� ����� (�����������) ';
comment on column DWH.ACCOUNT.new_performermobphone
  is ' ��������� ������� (�����������) ';
comment on column DWH.ACCOUNT.new_performerphone
  is ' ������� ������� (�����������) ';
comment on column DWH.ACCOUNT.new_performerprof
  is ' ��������� (�����������) ';
comment on column DWH.ACCOUNT.new_physicalinn
  is ' ��� ����������� ���� ';
comment on column DWH.ACCOUNT.new_postaddress
  is ' �������� ����� ';
comment on column DWH.ACCOUNT.new_postaddressname
  is ' NULL ';
comment on column DWH.ACCOUNT.new_profession
  is ' ��������� ';
comment on column DWH.ACCOUNT.new_registrationaddress
  is ' ����� ����������� ';
comment on column DWH.ACCOUNT.new_registrationdate
  is ' ���� ����������� �������� ';
comment on column DWH.ACCOUNT.new_regulationsfz223
  is ' ��������� ����������� ���� ��������� �� � 223 ';
comment on column DWH.ACCOUNT.new_status
  is ' ������ ���������� ';
comment on column DWH.ACCOUNT.new_statusname
  is ' NULL ';
comment on column DWH.ACCOUNT.new_subject
  is ' �������� ������� ������������ ���������? ';
comment on column DWH.ACCOUNT.new_supname
  is ' ������ �������� ����������� ';
comment on column DWH.ACCOUNT.new_supplier
  is ' ��������� ';
comment on column DWH.ACCOUNT.new_suppliercategory
  is ' ��������� ���������� ';
comment on column DWH.ACCOUNT.new_suppliercategoryname
  is ' NULL ';
comment on column DWH.ACCOUNT.new_supplierid
  is ' ��������� ';
comment on column DWH.ACCOUNT.new_supplieridname
  is ' NULL ';
comment on column DWH.ACCOUNT.new_suptype
  is ' ��������� ����������� ';
comment on column DWH.ACCOUNT.new_suptypename
  is ' NULL ';
comment on column DWH.ACCOUNT.new_taxsystem
  is ' ������� ��������������� ';
comment on column DWH.ACCOUNT.new_taxsystemname
  is ' NULL ';
comment on column DWH.ACCOUNT.new_territory
  is ' ������������� ';
comment on column DWH.ACCOUNT.new_territoryname
  is ' NULL ';
comment on column DWH.ACCOUNT.new_uk
  is ' ����������� �������� ';
comment on column DWH.ACCOUNT.new_unitar1
  is ' �������� �� ��������� ����������� ������������ ';
comment on column DWH.ACCOUNT.new_workphone
  is ' ������� ������� ';
comment on column DWH.ACCOUNT.ownerid
  is ' ������������� ';
comment on column DWH.ACCOUNT.owneridname
  is ' NULL ';
comment on column DWH.ACCOUNT.preferredcontactmethodcode
  is ' ���������������� ������ ����� ';
comment on column DWH.ACCOUNT.preferredcontactmethodcodename
  is ' NULL ';
comment on column DWH.ACCOUNT.primarycontactid
  is ' ������������ ';
comment on column DWH.ACCOUNT.primarycontactidname
  is ' NULL ';
comment on column DWH.ACCOUNT.statuscode
  is ' ������ ';
comment on column DWH.ACCOUNT.statuscodename
  is ' NULL ';
comment on column DWH.ACCOUNT.telephone1
  is ' �������� ������� ';
comment on column DWH.ACCOUNT.websiteurl
  is ' ���-���� ';
-- Create/Recreate indexes
create index DWH.ACCOUNT_INN on DWH.ACCOUNT (NEW_INN, NEW_PHYSICALINN);
create unique index DWH.U_ACCOUNT on DWH.ACCOUNT (ACCOUNTID, VALID_TO_DTTM, TIMESLOTSTART);


