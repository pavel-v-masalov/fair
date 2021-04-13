-- Create table
create table DWH.CONTACT
(
    birthdate                      DATE,
    contactid                      VARCHAR2(36),
    createdon                      DATE,
    donotsendmm                    NUMBER,
    emailaddress1                  VARCHAR2(1000),
    exchangerate                   NUMBER,
    firstname                      VARCHAR2(1000),
    gendercode                     NUMBER,
    gendercodename                 VARCHAR2(1000),
    jobtitle                       VARCHAR2(1000),
    lastname                       VARCHAR2(1000),
    merged                         NUMBER,
    middlename                     VARCHAR2(1000),
    mobilephone                    VARCHAR2(1000),
    new_acceptor                   NUMBER,
    new_acctype                    NUMBER,
    new_acctypename                VARCHAR2(1000),
    new_address                    VARCHAR2(2000),
    new_agent                      NUMBER,
    new_anytime                    NUMBER,
    new_birthplace                 VARCHAR2(1000),
    new_citizenship1               VARCHAR2(1000),
    new_consent                    NUMBER,
    new_contactperson              NUMBER,
    new_contacttype                NUMBER,
    new_contacttypename            VARCHAR2(1000),
    new_forwarder                  NUMBER,
    new_guarantor                  NUMBER,
    new_jobtitledat                VARCHAR2(1000),
    new_jobtitlerod                VARCHAR2(1000),
    new_liveladress                VARCHAR2(36),
    new_liveladressname            VARCHAR2(1000),
    new_nomiddlename               NUMBER,
    new_officalpresentative        NUMBER,
    new_officialrepresentative     NUMBER,
    new_pasportid                  VARCHAR2(36),
    new_pasportidname              VARCHAR2(1000),
    new_pass                       NUMBER,
    new_passport                   VARCHAR2(4000),
    new_signature                  NUMBER,
    new_signer                     NUMBER,
    new_territory                  VARCHAR2(36),
    new_territoryname              VARCHAR2(1000),
    new_ustav                      NUMBER,
    new_ustavname                  VARCHAR2(1000),
    originatingleadid              VARCHAR2(36),
    originatingleadidname          VARCHAR2(1000),
    ownerid                        VARCHAR2(36),
    parentcustomerid               VARCHAR2(36),
    parentcustomeridname           VARCHAR2(4000),
    preferredcontactmethodcode     NUMBER,
    preferredcontactmethodcodename VARCHAR2(1000),
    statecode                      NUMBER,
    statecodename                  VARCHAR2(1000),
    statuscode                     NUMBER,
    statuscodename                 VARCHAR2(1000),
    telephone1                     VARCHAR2(1000),
    transactioncurrencyid          VARCHAR2(36),
    transactioncurrencyidname      VARCHAR2(1000),
    vtbl_datereceivedscoringscore  DATE,
    vtbl_idbki                     VARCHAR2(1000),
    vtbl_membershareholder         NUMBER,
    vtbl_memshareholder_id         VARCHAR2(36),
    vtbl_memshareholder_idname     VARCHAR2(1000),
    vtbl_scoringscore              NUMBER,
    vtbl_sendmm                    NUMBER,
    vtbl_statusscoringscore        NUMBER,
    vtbl_statusscoringscorename    VARCHAR2(1000),
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
comment on column DWH.CONTACT.birthdate
  is '���� ��������';
comment on column DWH.CONTACT.contactid
  is '�������';
comment on column DWH.CONTACT.createdon
  is '���� ��������';
comment on column DWH.CONTACT.donotsendmm
  is '�������� ������������� ����������';
comment on column DWH.CONTACT.emailaddress1
  is '����������� �����';
comment on column DWH.CONTACT.exchangerate
  is '�������� ����';
comment on column DWH.CONTACT.firstname
  is '���';
comment on column DWH.CONTACT.gendercode
  is '���';
comment on column DWH.CONTACT.jobtitle
  is '���������';
comment on column DWH.CONTACT.lastname
  is '�������';
comment on column DWH.CONTACT.merged
  is '�������� �������';
comment on column DWH.CONTACT.middlename
  is '��������';
comment on column DWH.CONTACT.mobilephone
  is '��������� �������';
comment on column DWH.CONTACT.new_acceptor
  is '������������� �� �������-��������';
comment on column DWH.CONTACT.new_acctype
  is '��� �����������';
comment on column DWH.CONTACT.new_address
  is '����� �����������';
comment on column DWH.CONTACT.new_agent
  is '�����';
comment on column DWH.CONTACT.new_anytime
  is '���������';
comment on column DWH.CONTACT.new_birthplace
  is '����� ��������';
comment on column DWH.CONTACT.new_citizenship1
  is '�����������';
comment on column DWH.CONTACT.new_consent
  is '�������� �� ��������� ������������ ������ ��������';
comment on column DWH.CONTACT.new_contactperson
  is '���������� ����';
comment on column DWH.CONTACT.new_contacttype
  is '��� ��������';
comment on column DWH.CONTACT.new_forwarder
  is '����������';
comment on column DWH.CONTACT.new_guarantor
  is '����������';
comment on column DWH.CONTACT.new_jobtitledat
  is '��������� � ��������� ������';
comment on column DWH.CONTACT.new_jobtitlerod
  is '��������� � ����������� ������';
comment on column DWH.CONTACT.new_liveladress
  is '����� ����������� �� ����� ����������';
comment on column DWH.CONTACT.new_nomiddlename
  is '�������� �� �������������';
comment on column DWH.CONTACT.new_officalpresentative
  is '����������� �������������';
comment on column DWH.CONTACT.new_officialrepresentative
  is '����������� ������������� �����������';
comment on column DWH.CONTACT.new_pasportid
  is '�������';
comment on column DWH.CONTACT.new_pass
  is '������ ���������� ������ � �� �� ����� �����';
comment on column DWH.CONTACT.new_passport
  is '���������� ������';
comment on column DWH.CONTACT.new_signature
  is '����� ����� �� ������� ����������';
comment on column DWH.CONTACT.new_signer
  is '���������';
comment on column DWH.CONTACT.new_territory
  is '�������������';
comment on column DWH.CONTACT.new_ustav
  is '�� ���������';
comment on column DWH.CONTACT.originatingleadid
  is '�������� ��������';
comment on column DWH.CONTACT.ownerid
  is '�������������';
comment on column DWH.CONTACT.parentcustomerid
  is '�������� ��������';
comment on column DWH.CONTACT.preferredcontactmethodcode
  is '���������������� ������ �����';
comment on column DWH.CONTACT.statecode
  is '���������';
comment on column DWH.CONTACT.statuscode
  is '������� ���������';
comment on column DWH.CONTACT.telephone1
  is '������� �������';
comment on column DWH.CONTACT.transactioncurrencyid
  is '������';
comment on column DWH.CONTACT.vtbl_datereceivedscoringscore
  is '���� ��������� ������ �� ���';
comment on column DWH.CONTACT.vtbl_idbki
  is '������������� ������� � ���';
comment on column DWH.CONTACT.vtbl_membershareholder
  is '��������\��������';
comment on column DWH.CONTACT.vtbl_memshareholder_id
  is '��������\�������� ���.����';
comment on column DWH.CONTACT.vtbl_scoringscore
  is '�������-���� ���';
comment on column DWH.CONTACT.vtbl_sendmm
  is '�������� �� ��������� ��������� ��������';
comment on column DWH.CONTACT.vtbl_statusscoringscore
  is '������ �������-���� ���';
comment on column DWH.CONTACT.timeslotstart
  is '����� ������ TimeSlot-� ';
comment on column DWH.CONTACT.timeslotend
  is '����� ����� TimeSlot-� ';
comment on column DWH.CONTACT.sessionkey
  is '���� ������ ';
-- Create/Recreate indexes
create unique index DWH.CONTACT_I_1 on DWH.CONTACT (CONTACTID, TIMESLOTSTART, VALID_TO_DTTM);

