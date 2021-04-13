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
  is 'День рождения';
comment on column DWH.CONTACT.contactid
  is 'Контакт';
comment on column DWH.CONTACT.createdon
  is 'Дата создания';
comment on column DWH.CONTACT.donotsendmm
  is 'Отправка маркетинговых материалов';
comment on column DWH.CONTACT.emailaddress1
  is 'Электронная почта';
comment on column DWH.CONTACT.exchangerate
  is 'Валютный курс';
comment on column DWH.CONTACT.firstname
  is 'Имя';
comment on column DWH.CONTACT.gendercode
  is 'Пол';
comment on column DWH.CONTACT.jobtitle
  is 'Должность';
comment on column DWH.CONTACT.lastname
  is 'Фамилия';
comment on column DWH.CONTACT.merged
  is 'Документ слияния';
comment on column DWH.CONTACT.middlename
  is 'Отчество';
comment on column DWH.CONTACT.mobilephone
  is 'Мобильный телефон';
comment on column DWH.CONTACT.new_acceptor
  is 'Ответственный за приемку-передачу';
comment on column DWH.CONTACT.new_acctype
  is 'Тип контрагента';
comment on column DWH.CONTACT.new_address
  is 'Адрес регистрации';
comment on column DWH.CONTACT.new_agent
  is 'Агент';
comment on column DWH.CONTACT.new_anytime
  is 'Бессрочно';
comment on column DWH.CONTACT.new_birthplace
  is 'Место рождения';
comment on column DWH.CONTACT.new_citizenship1
  is 'Гражданство';
comment on column DWH.CONTACT.new_consent
  is 'Согласие на обработку персональных данных получено';
comment on column DWH.CONTACT.new_contactperson
  is 'Контактное лицо';
comment on column DWH.CONTACT.new_contacttype
  is 'Тип контакта';
comment on column DWH.CONTACT.new_forwarder
  is 'Экспедитор';
comment on column DWH.CONTACT.new_guarantor
  is 'Поручитель';
comment on column DWH.CONTACT.new_jobtitledat
  is 'Должность в дательном падеже';
comment on column DWH.CONTACT.new_jobtitlerod
  is 'Должность в родительном падеже';
comment on column DWH.CONTACT.new_liveladress
  is 'Адрес регистрации по месту жительства';
comment on column DWH.CONTACT.new_nomiddlename
  is 'Отчество не предусмотрено';
comment on column DWH.CONTACT.new_officalpresentative
  is 'Официальный представитель';
comment on column DWH.CONTACT.new_officialrepresentative
  is 'Официальный представитель Организации';
comment on column DWH.CONTACT.new_pasportid
  is 'Паспорт';
comment on column DWH.CONTACT.new_pass
  is 'Тянуть паспортные данные в ПФ из этого блока';
comment on column DWH.CONTACT.new_passport
  is 'Паспортные данные';
comment on column DWH.CONTACT.new_signature
  is 'Имеет право на подпись документов';
comment on column DWH.CONTACT.new_signer
  is 'Подписант';
comment on column DWH.CONTACT.new_territory
  is 'Подразделение';
comment on column DWH.CONTACT.new_ustav
  is 'На основании';
comment on column DWH.CONTACT.originatingleadid
  is 'Источник интереса';
comment on column DWH.CONTACT.ownerid
  is 'Ответственный';
comment on column DWH.CONTACT.parentcustomerid
  is 'Название компании';
comment on column DWH.CONTACT.preferredcontactmethodcode
  is 'Предпочтительный способ связи';
comment on column DWH.CONTACT.statecode
  is 'Состояние';
comment on column DWH.CONTACT.statuscode
  is 'Причина состояния';
comment on column DWH.CONTACT.telephone1
  is 'Рабочий телефон';
comment on column DWH.CONTACT.transactioncurrencyid
  is 'Валюта';
comment on column DWH.CONTACT.vtbl_datereceivedscoringscore
  is 'Дата получения ответа от БКИ';
comment on column DWH.CONTACT.vtbl_idbki
  is 'Идентификатор запроса в БКИ';
comment on column DWH.CONTACT.vtbl_membershareholder
  is 'Участник\Акционер';
comment on column DWH.CONTACT.vtbl_memshareholder_id
  is 'Участник\Акционер Физ.Лицо';
comment on column DWH.CONTACT.vtbl_scoringscore
  is 'Скоринг-балл БКИ';
comment on column DWH.CONTACT.vtbl_sendmm
  is 'Согласие на получение рекламной рассылки';
comment on column DWH.CONTACT.vtbl_statusscoringscore
  is 'Статус скоринг-балл БКИ';
comment on column DWH.CONTACT.timeslotstart
  is 'Время начала TimeSlot-а ';
comment on column DWH.CONTACT.timeslotend
  is 'Время конца TimeSlot-а ';
comment on column DWH.CONTACT.sessionkey
  is 'Ключ сессии ';
-- Create/Recreate indexes
create unique index DWH.CONTACT_I_1 on DWH.CONTACT (CONTACTID, TIMESLOTSTART, VALID_TO_DTTM);

