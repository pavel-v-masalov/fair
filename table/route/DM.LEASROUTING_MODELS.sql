begin
    for r in (select 1 from all_tables t where t.owner = 'DM' and t.table_name = 'LEASROUTING_MODELS') loop
        execute immediate 'drop table DM.LEASROUTING_MODELS';
    end loop;
end;
/
create table DM.LEASROUTING_MODELS
(
    snapshot_dt                           DATE,
    opportunityid                         VARCHAR2(36),
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
  model_type                     VARCHAR2(500),
  calc_conditions                VARCHAR2(1000),
  isprescoringcall               NUMBER,
  model_settings                 VARCHAR2(1000),
    veractivityid                         VARCHAR2(36),
 -- tasks
    ver_no                                NUMBER,
    verstart_flg number,
    verend_flg   number,
    veractualend                          DATE,
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
    reveractivityid              VARCHAR2(36),
    rever_no                     NUMBER,
    reverstart_flg number,
    reverend_flg number,
    reveractualend               DATE,
    revercreatedon               DATE,
    reverNEW_APPROVALRESULT      NUMBER,
    reverNEW_APPROVALRESULTNM  VARCHAR2(1000),
    revernew_comments            VARCHAR2(4000),
    reverNEW_COUNTER_FULLTIME    NUMBER,
    reverNEW_COUNTER_WORKTIME    NUMBER,
    revernew_history             VARCHAR2(4000),
    revernew_type                NUMBER,
    revernew_typename            VARCHAR2(1000),
    revernew_uzdl                NUMBER,
    UOBactivityid                      VARCHAR2(36),
    UOB_no                             NUMBER,
    UOBstart_flg number,
    UOBend_flg number,
    UOBactualend                       DATE,
    UOBcreatedon                       DATE,
    UOBnew_approvalresult              NUMBER,
    UOBnew_approvalresultname          VARCHAR2(1000),
    UOBnew_comments                    VARCHAR2(4000),
    UOBnew_counter_fulltime            NUMBER,
    UOBnew_counter_worktime            NUMBER,
    UOBnew_history                     VARCHAR2(4000),
    UOBnew_type                        NUMBER,
    UOBnew_typename                    VARCHAR2(1000),
    REUOBactivityid                      VARCHAR2(36),
    REUOB_no                             NUMBER,
    REUOBstart_flg number,
    REUOBend_flg number,
    REUOBactualend                       DATE,
    REUOBcreatedon                       DATE,
    REUOBnew_approvalresult              NUMBER,
    REUOBnew_approvalresultname          VARCHAR2(1000),
    REUOBnew_comments                    VARCHAR2(4000),
    REUOBNEW_COUNTER_FULLTIME      NUMBER,
    REUOBnew_counter_worktime            NUMBER,
    REUOBnew_history                     VARCHAR2(4000),
    REUOBnew_type                        NUMBER,
    REUOBnew_typename                    VARCHAR2(1000),
    UAKRactivityid                     VARCHAR2(36),
    UAKR_no                            NUMBER,
    UAKRstart_flg number,
    UAKRend_flg number,
    UAKRactualend                      DATE,
    UAKRcreatedon                      DATE,
    UAKRnew_approvalresult             NUMBER,
    UAKRnew_approvalresultname         VARCHAR2(1000),
    UAKRnew_comments                   VARCHAR2(4000),
    UAKRnew_counter_fulltime           NUMBER,
    UAKRnew_counter_worktime           NUMBER,
    UAKRnew_history                    VARCHAR2(4000),
    UAKRnew_type                       NUMBER,
    UAKRnew_typename                   VARCHAR2(1000),
    REUAKRactivityid                     VARCHAR2(36),
    REUAKR_no                            NUMBER,
    REUAKRstart_flg number,
    REUAKRend_flg number,
    REUAKRactualend                      DATE,
    REUAKRcreatedon                      DATE,
    REUAKRnew_approvalresult             NUMBER,
    REUAKRnew_approvalresultname         VARCHAR2(1000),
    REUAKRnew_comments                   VARCHAR2(4000),
    REUAKRnew_counter_fulltime           NUMBER,
    REUAKRnew_counter_worktime           NUMBER,
    REUAKRnew_history                    VARCHAR2(4000),
    REUAKRnew_type                       NUMBER,
    REUAKRnew_typename                   VARCHAR2(1000),
    underwritactivityid                   VARCHAR2(36),
    underwrit_no                          NUMBER,
    underwritstart_flg number,
    underwritend_flg number,
    underwritactualend                    DATE,
    underwritcreatedon                    DATE,
    underwritnew_approvalresult           NUMBER,
    UNDWRITNEW_APPROVALRESULTNAME       VARCHAR2(1000),
    underwritnew_comments                 VARCHAR2(4000),
    underwritnew_counter_fulltime         NUMBER,
    underwritnew_counter_worktime         NUMBER,
    underwritnew_history                  VARCHAR2(4000),
    underwritnew_type                     NUMBER,
    underwritnew_typename                 VARCHAR2(1000),
    klasactivityid                 VARCHAR2(36),
    klas_no                        NUMBER,
    klasstart_flg number,
    klasend_flg number,
    klasactualend                  DATE,
    klascreatedon                  DATE,
    klasnew_approvalresult         NUMBER,
    klasNEW_APPROVALRESULTNAME     VARCHAR2(1000),
    klasnew_comments               VARCHAR2(4000),
    klasNEW_COUNTER_FULLTIME       NUMBER,
    klasNEW_COUNTER_WORKTIME       NUMBER,
    klasnew_history                VARCHAR2(4000),
    klasnew_type                   NUMBER,
    klasnew_typename               VARCHAR2(1000),
    kufractivityid             VARCHAR2(36),
    kufr_no                    NUMBER,
    kufrstart_flg number,
    kufrend_flg number,
    kufractualend              DATE,
    kufrcreatedon              DATE,
    KUFRNEW_APPROVALRESULT     NUMBER,
    KUFRNEW_APPROVALRESULTNM VARCHAR2(1000),
    kufrnew_comments           VARCHAR2(4000),
    KUFRNEW_COUNTER_FULLTIME   NUMBER,
    KUFRNEW_COUNTER_WORKTIME   NUMBER,
    kufrnew_history            VARCHAR2(4000),
    kufrnew_type               NUMBER,
    kufrnew_typename           VARCHAR2(1000),
    reapprovactivityid                    VARCHAR2(36),
    reapprov_no                           NUMBER,
    reapprovstart_flg number,
    reapprovend_flg number,
    reapprovactualend                     DATE,
    reapprovcreatedon                     DATE,
    reapprovnew_approvalresult            NUMBER,
    reapprovnew_approvalresultname        VARCHAR2(1000),
    reapprovnew_comments                  VARCHAR2(4000),
    reapprovnew_counter_fulltime          NUMBER,
    reapprovnew_counter_worktime          NUMBER,
    reapprovnew_history                   VARCHAR2(4000),
    reapprovnew_type                      NUMBER,
    reapprovnew_typename                  VARCHAR2(1000)
);
comment on column DM.LEASROUTING_MODELS.SNAPSHOT_DT	is 'Отчетная дата';
comment on column DM.LEASROUTING_MODELS.ACCOUNTID	is 'Организация';
comment on column DM.LEASROUTING_MODELS.CREATEDON	is 'Дата создания';
comment on column DM.LEASROUTING_MODELS.EMAILADDRESS1	is 'Электронная почта';
comment on column DM.LEASROUTING_MODELS.INDUSTRYCODENAME	is 'Вид деятельности';
comment on column DM.LEASROUTING_MODELS.ORGNAME	is 'Название организации';
comment on column DM.LEASROUTING_MODELS.NEW_ACCOUNTINDUCTRYNAME	is 'Основной вид деятельности';
comment on column DM.LEASROUTING_MODELS.NEW_BLACK_LIST_DATE	is 'Дата внесения в ЧС';
comment on column DM.LEASROUTING_MODELS.NEW_CEOCHANGENAME	is 'Изменение ЕИО\учредителей';
comment on column DM.LEASROUTING_MODELS.NEW_CHEKVERIFICATION	is 'Проверен верификатором';
comment on column DM.LEASROUTING_MODELS.NEW_COMPANYSITE	is 'Сайт компании';
comment on column DM.LEASROUTING_MODELS.NEW_EXPLOITATIONPL1	is 'Ответственный за эксплуатацию ПЛ';
comment on column DM.LEASROUTING_MODELS.NEW_INCIDENTSOURCENAME	is 'Источник обращения';
comment on column DM.LEASROUTING_MODELS.NEW_INN	is 'ИНН';
comment on column DM.LEASROUTING_MODELS.NEW_KY_CUSTOMER	is 'Ключевой клиент';
comment on column DM.LEASROUTING_MODELS.NEW_KY_SPESHLPR	is 'Спецпроект';
comment on column DM.LEASROUTING_MODELS.NEW_LEGALORGANIZATIONALFORMNAM	is 'Организационно-правовая форма организации';
comment on column DM.LEASROUTING_MODELS.NEW_MOBILEPHONE	is 'Мобильный телефон';
comment on column DM.LEASROUTING_MODELS.NEW_OGRN	is 'ОГРН';
comment on column DM.LEASROUTING_MODELS.NEW_OKVEDIDNAME	is 'ОКВЭД';
comment on column DM.LEASROUTING_MODELS.NEW_PHYSICALINN	is 'ИНН физического лица';
comment on column DM.LEASROUTING_MODELS.NEW_REGISTRATIONADDRESS	is 'Адрес регистрации';
comment on column DM.LEASROUTING_MODELS.NEW_REGISTRATIONDATE	is 'Дата регистрации компании';
comment on column DM.LEASROUTING_MODELS.PRIMARYCONTACTID	is 'Руководитель';
comment on column DM.LEASROUTING_MODELS.PRIMARYCONTACTIDNAME	is 'Руководитель';
comment on column DM.LEASROUTING_MODELS.WEBSITEURL	is 'Веб-сайт';
comment on column DM.LEASROUTING_MODELS.RELGROUPS	is 'Список групп надежности';
comment on column DM.LEASROUTING_MODELS.RELMAX	is 'Максимальная группа';
comment on column DM.LEASROUTING_MODELS.NEW_AGENTID	is 'Агент (справочник)';
comment on column DM.LEASROUTING_MODELS.NEW_ALLEXPRETISETASKSCLOSED	is 'Закрыты все задачи на экспертизу';
comment on column DM.LEASROUTING_MODELS.NEW_APPROVALRESULTNAME	is 'Решение';
comment on column DM.LEASROUTING_MODELS.NEW_FACTADRESS	is 'Фактический адрес бизнеса ЛП';
comment on column DM.LEASROUTING_MODELS.NEW_LEASAGREEMENTCONDCONFIRMED	is 'УЗДЛ/ЛИ УЗДЛ получено';
comment on column DM.LEASROUTING_MODELS.NEW_NONFINANCIAL	is 'Низколиквидная техника с рассмотрением на КУФР';
comment on column DM.LEASROUTING_MODELS.NEW_OPT	is 'Перенаем';
comment on column DM.LEASROUTING_MODELS.NEW_PODPRODUCTNAME	is 'Подпродукт';
comment on column DM.LEASROUTING_MODELS.NEW_PRODUCTIDNAME	is 'Продукт';
comment on column DM.LEASROUTING_MODELS.NEW_PROPERTYRISK	is 'Выявлен имущественный риск';
comment on column DM.LEASROUTING_MODELS.new_count is ' ';
comment on column DM.LEASROUTING_MODELS.NEW_ROUTINGBYMODEL	is 'Маршрутизация по модели';
comment on column DM.LEASROUTING_MODELS.NEW_STATUSCODEIDNAME	is 'Этап';
comment on column DM.LEASROUTING_MODELS.NEW_TOTALFINANCINGSUM	is 'Совокупная сумма ф-ия по ЛП с ГК с учетом инв';
comment on column DM.LEASROUTING_MODELS.NEW_TOTALFINANCINGSUM_EXPRESS	is 'Совокупная сумма финансирования по ЛП с ГК Express';
comment on column DM.LEASROUTING_MODELS.NEW_TOTALSUMDEALPERIOD	is 'Общая сумма заключенных сделок, за период';
comment on column DM.LEASROUTING_MODELS.NEW_ACCOUNTGROUPID	is 'Группа компаний';
comment on column DM.LEASROUTING_MODELS.NEW_NAME	is 'Имя';
comment on column DM.LEASROUTING_MODELS.BIRTHDATE	is 'День рождения';
comment on column DM.LEASROUTING_MODELS.CONTACTID	is 'Контакт';
comment on column DM.LEASROUTING_MODELS.FIRSTNAME	is 'Имя';
comment on column DM.LEASROUTING_MODELS.GENDERCODENAME	is 'Пол';
comment on column DM.LEASROUTING_MODELS.JOBTITLE	is 'Должность';
comment on column DM.LEASROUTING_MODELS.MIDDLENAME	is 'Отчество';
comment on column DM.LEASROUTING_MODELS.MOBILEPHONE	is 'Мобильный телефон';
comment on column DM.LEASROUTING_MODELS.NEW_ADDRESS	is 'Адрес регистрации';
comment on column DM.LEASROUTING_MODELS.NEW_CONTACTTYPENAME	is 'Тип контакта';
comment on column DM.LEASROUTING_MODELS.VTBL_SCORINGSCORE	is 'Скоринг-балл БКИ';
comment on column DM.LEASROUTING_MODELS.NEW_DOCNUMBER	is 'Номер';
comment on column DM.LEASROUTING_MODELS.NEW_DOCTYPE	is 'Тип документа';
comment on column DM.LEASROUTING_MODELS.NEW_DOCTYPENAME	is 'NULL';
comment on column DM.LEASROUTING_MODELS.NEW_SERIA	is 'Серия';
comment on column DM.LEASROUTING_MODELS.NEW_STARTDATE	is 'Действует с';
comment on column DM.LEASROUTING_MODELS.NEW_WHENGIVE	is 'Когда выдан';
comment on column DM.LEASROUTING_MODELS.NEW_WHOGIVE	is 'Кем выдан';
comment on column DM.LEASROUTING_MODELS.LEADID	is 'Интерес';
comment on column DM.LEASROUTING_MODELS.NEW_REF_ACCOUNTNAME	is 'Тип интереса';
comment on column DM.LEASROUTING_MODELS.NEW_WEB	is 'Родительская организация интереса';
comment on column DM.LEASROUTING_MODELS.COUNTEDON	is 'Время и дата расчета по моделям';
comment on column DM.LEASROUTING_MODELS.CREDITMODELISCOUNTABLE	is 'Можно рассчитать кредитную модель';
comment on column DM.LEASROUTING_MODELS.FINANCESUM	is 'Совокупная сумма ф-ия по ЛП с ГК с учетом инв (лизинговая сделка)';
comment on column DM.LEASROUTING_MODELS.CREDITMODELRESULT	is 'Модель кредитного риска (лизинговая сделка)';
comment on column DM.LEASROUTING_MODELS.NEW_FINANCESUM	is 'ССФ по сделке без ГК';
comment on column DM.LEASROUTING_MODELS.FRAUDMODELRESULT	is 'Модель фрод риска (лизинговая сделка)';
comment on column DM.LEASROUTING_MODELS.OPPORTUNITYCREDITRESULT	is 'Прогноз кред дефолта на сделку';
comment on column DM.LEASROUTING_MODELS.OPPORTUNITYFRAUDRESULT	is 'Прогноз фрод дефолта на сделку';
comment on column DM.LEASROUTING_MODELS.PRODUCTOP	is 'Продукт из лизинговой сделки';
comment on column DM.LEASROUTING_MODELS.SCORINGSCORE	is 'НБКИ балл';
comment on column DM.LEASROUTING_MODELS.MODEL_TYPE	is 'Тип модели';
comment on column DM.LEASROUTING_MODELS.calc_conditions	is 'Условие попадания в повторные';
comment on column DM.LEASROUTING_MODELS.ISPRESCORINGCALL	is 'Расчёт в рамках прескоринга';
comment on column DM.LEASROUTING_MODELS.model_settings	is 'Кортеж включенных моделей на ммоент расчёта';
comment on column DM.LEASROUTING_MODELS.VERACTIVITYID	is 'Задача';
comment on column DM.LEASROUTING_MODELS.VER_NO	is 'Номер задачи внутри расчёта';
comment on column DM.LEASROUTING_MODELS.VERACTUALEND	is 'Фактическое окончание';
comment on column DM.LEASROUTING_MODELS.VERCREATEDON	is 'Дата создания';
comment on column DM.LEASROUTING_MODELS.VERNEW_APPROVALRESULT	is 'Решение';
comment on column DM.LEASROUTING_MODELS.VERNEW_APPROVALRESULTNAME	is 'Решение';
comment on column DM.LEASROUTING_MODELS.VERNEW_COMMENTS	is 'Результат выполнения задачи';
comment on column DM.LEASROUTING_MODELS.VERNEW_COUNTER_FULLTIME	is 'Полное время (мин.)';
comment on column DM.LEASROUTING_MODELS.VERNEW_COUNTER_WORKTIME	is 'Время работы с задачей (мин.)';
comment on column DM.LEASROUTING_MODELS.VERNEW_HISTORY	is 'История выполнения задачи';
comment on column DM.LEASROUTING_MODELS.VERNEW_TYPE	is 'Тип задачи';
comment on column DM.LEASROUTING_MODELS.VERNEW_TYPENAME	is 'Тип задачи';
comment on column DM.LEASROUTING_MODELS.VERNEW_UZDL	is 'Сделка в рамках УЗДЛ';
comment on column DM.LEASROUTING_MODELS.reverACTIVITYID	is 'Задача';
comment on column DM.LEASROUTING_MODELS.rever_NO	is 'Номер задачи внутри расчёта';
comment on column DM.LEASROUTING_MODELS.reverACTUALEND	is 'Фактическое окончание';
comment on column DM.LEASROUTING_MODELS.reverCREATEDON	is 'Дата создания';
comment on column DM.LEASROUTING_MODELS.reverNEW_APPROVALRESULT	is 'Решение';
comment on column DM.LEASROUTING_MODELS.reverNEW_APPROVALRESULTNM	is 'Решение';
comment on column DM.LEASROUTING_MODELS.reverNEW_COMMENTS	is 'Результат выполнения задачи';
comment on column DM.LEASROUTING_MODELS.reverNEW_COUNTER_FULLTIME	is 'Полное время (мин.)';
comment on column DM.LEASROUTING_MODELS.reverNEW_COUNTER_WORKTIME	is 'Время работы с задачей (мин.)';
comment on column DM.LEASROUTING_MODELS.reverNEW_HISTORY	is 'История выполнения задачи';
comment on column DM.LEASROUTING_MODELS.reverNEW_TYPE	is 'Тип задачи';
comment on column DM.LEASROUTING_MODELS.reverNEW_TYPENAME	is 'Тип задачи';
comment on column DM.LEASROUTING_MODELS.reverNEW_UZDL	is 'Сделка в рамках УЗДЛ';
comment on column DM.LEASROUTING_MODELS.UOBACTIVITYID	is 'Задача';
comment on column DM.LEASROUTING_MODELS.UOB_NO	is 'Номер задачи внутри расчёта';
comment on column DM.LEASROUTING_MODELS.UOBACTUALEND	is 'Фактическое окончание';
comment on column DM.LEASROUTING_MODELS.UOBCREATEDON	is 'Дата создания';
comment on column DM.LEASROUTING_MODELS.UOBNEW_APPROVALRESULT	is 'Решение';
comment on column DM.LEASROUTING_MODELS.UOBNEW_APPROVALRESULTNAME	is 'Решение';
comment on column DM.LEASROUTING_MODELS.UOBNEW_COMMENTS	is 'Результат выполнения задачи';
comment on column DM.LEASROUTING_MODELS.UOBNEW_COUNTER_FULLTIME	is 'Полное время (мин.)';
comment on column DM.LEASROUTING_MODELS.UOBNEW_COUNTER_WORKTIME	is 'Время работы с задачей (мин.)';
comment on column DM.LEASROUTING_MODELS.UOBNEW_HISTORY	is 'История выполнения задачи';
comment on column DM.LEASROUTING_MODELS.UOBNEW_TYPE	is 'Тип задачи';
comment on column DM.LEASROUTING_MODELS.UOBNEW_TYPENAME	is 'Тип задачи';
comment on column DM.LEASROUTING_MODELS.REUOBACTIVITYID	is 'Задача';
comment on column DM.LEASROUTING_MODELS.REUOB_NO	is 'Номер задачи внутри расчёта';
comment on column DM.LEASROUTING_MODELS.REUOBACTUALEND	is 'Фактическое окончание';
comment on column DM.LEASROUTING_MODELS.REUOBCREATEDON	is 'Дата создания';
comment on column DM.LEASROUTING_MODELS.REUOBNEW_APPROVALRESULT	is 'Решение';
comment on column DM.LEASROUTING_MODELS.REUOBNEW_APPROVALRESULTNAME	is 'Решение';
comment on column DM.LEASROUTING_MODELS.REUOBNEW_COMMENTS	is 'Результат выполнения задачи';
comment on column DM.LEASROUTING_MODELS.REUOBNEW_COUNTER_FULLTIME	is 'Полное время (мин.)';
comment on column DM.LEASROUTING_MODELS.REUOBNEW_COUNTER_WORKTIME	is 'Время работы с задачей (мин.)';
comment on column DM.LEASROUTING_MODELS.REUOBNEW_HISTORY	is 'История выполнения задачи';
comment on column DM.LEASROUTING_MODELS.REUOBNEW_TYPE	is 'Тип задачи';
comment on column DM.LEASROUTING_MODELS.REUOBNEW_TYPENAME	is 'Тип задачи';
comment on column DM.LEASROUTING_MODELS.UAKRACTIVITYID	is 'Задача';
comment on column DM.LEASROUTING_MODELS.UAKR_NO	is 'Номер задачи внутри расчёта';
comment on column DM.LEASROUTING_MODELS.UAKRACTUALEND	is 'Фактическое окончание';
comment on column DM.LEASROUTING_MODELS.UAKRCREATEDON	is 'Дата создания';
comment on column DM.LEASROUTING_MODELS.UAKRNEW_APPROVALRESULT	is 'Решение';
comment on column DM.LEASROUTING_MODELS.UAKRNEW_APPROVALRESULTNAME	is 'Решение';
comment on column DM.LEASROUTING_MODELS.UAKRNEW_COMMENTS	is 'Результат выполнения задачи';
comment on column DM.LEASROUTING_MODELS.UAKRNEW_COUNTER_FULLTIME	is 'Полное время (мин.)';
comment on column DM.LEASROUTING_MODELS.UAKRNEW_COUNTER_WORKTIME	is 'Время работы с задачей (мин.)';
comment on column DM.LEASROUTING_MODELS.UAKRNEW_HISTORY	is 'История выполнения задачи';
comment on column DM.LEASROUTING_MODELS.UAKRNEW_TYPE	is 'Тип задачи';
comment on column DM.LEASROUTING_MODELS.UAKRNEW_TYPENAME	is 'Тип задачи';
comment on column DM.LEASROUTING_MODELS.REUAKRACTIVITYID	is 'Задача';
comment on column DM.LEASROUTING_MODELS.REUAKR_NO	is 'Номер задачи внутри расчёта';
comment on column DM.LEASROUTING_MODELS.REUAKRACTUALEND	is 'Фактическое окончание';
comment on column DM.LEASROUTING_MODELS.REUAKRCREATEDON	is 'Дата создания';
comment on column DM.LEASROUTING_MODELS.REUAKRNEW_APPROVALRESULT	is 'Решение';
comment on column DM.LEASROUTING_MODELS.REUAKRNEW_APPROVALRESULTNAME	is 'Решение';
comment on column DM.LEASROUTING_MODELS.REUAKRNEW_COMMENTS	is 'Результат выполнения задачи';
comment on column DM.LEASROUTING_MODELS.REUAKRNEW_COUNTER_FULLTIME	is 'Полное время (мин.)';
comment on column DM.LEASROUTING_MODELS.REUAKRNEW_COUNTER_WORKTIME	is 'Время работы с задачей (мин.)';
comment on column DM.LEASROUTING_MODELS.REUAKRNEW_HISTORY	is 'История выполнения задачи';
comment on column DM.LEASROUTING_MODELS.REUAKRNEW_TYPE	is 'Тип задачи';
comment on column DM.LEASROUTING_MODELS.REUAKRNEW_TYPENAME	is 'Тип задачи';
comment on column DM.LEASROUTING_MODELS.UNDERWRITACTIVITYID	is 'Задача';
comment on column DM.LEASROUTING_MODELS.UNDERWRIT_NO	is 'Номер задачи внутри расчёта';
comment on column DM.LEASROUTING_MODELS.UNDERWRITACTUALEND	is 'Фактическое окончание';
comment on column DM.LEASROUTING_MODELS.UNDERWRITCREATEDON	is 'Дата создания';
comment on column DM.LEASROUTING_MODELS.UNDERWRITNEW_APPROVALRESULT	is 'Решение';
comment on column DM.LEASROUTING_MODELS.UNDWRITNEW_APPROVALRESULTNAME	is 'Решение';
comment on column DM.LEASROUTING_MODELS.UNDERWRITNEW_COMMENTS	is 'Результат выполнения задачи';
comment on column DM.LEASROUTING_MODELS.UNDERWRITNEW_COUNTER_FULLTIME	is 'Полное время (мин.)';
comment on column DM.LEASROUTING_MODELS.UNDERWRITNEW_COUNTER_WORKTIME	is 'Время работы с задачей (мин.)';
comment on column DM.LEASROUTING_MODELS.UNDERWRITNEW_HISTORY	is 'История выполнения задачи';
comment on column DM.LEASROUTING_MODELS.UNDERWRITNEW_TYPE	is 'Тип задачи';
comment on column DM.LEASROUTING_MODELS.UNDERWRITNEW_TYPENAME	is 'Тип задачи';
comment on column DM.LEASROUTING_MODELS.klasactivityid	is 'Задача';
comment on column DM.LEASROUTING_MODELS.klas_no	is 'Номер задачи внутри расчёта';
comment on column DM.LEASROUTING_MODELS.klasactualend	is 'Фактическое окончание';
comment on column DM.LEASROUTING_MODELS.klascreatedon	is 'Дата создания';
comment on column DM.LEASROUTING_MODELS.klasnew_approvalresult	is 'Решение';
comment on column DM.LEASROUTING_MODELS.klasNEW_APPROVALRESULTNAME	is 'Решение';
comment on column DM.LEASROUTING_MODELS.klasnew_comments	is 'Результат выполнения задачи';
comment on column DM.LEASROUTING_MODELS.klasNEW_COUNTER_FULLTIME	is 'Полное время (мин.)';
comment on column DM.LEASROUTING_MODELS.klasNEW_COUNTER_WORKTIME	is 'Время работы с задачей (мин.)';
comment on column DM.LEASROUTING_MODELS.klasnew_history	is 'История выполнения задачи';
comment on column DM.LEASROUTING_MODELS.klasnew_type	is 'Тип задачи';
comment on column DM.LEASROUTING_MODELS.klasnew_typename	is 'Тип задачи';
comment on column DM.LEASROUTING_MODELS.KUFRACTIVITYID	is 'Задача';
comment on column DM.LEASROUTING_MODELS.KUFR_NO	is 'Номер задачи внутри расчёта';
comment on column DM.LEASROUTING_MODELS.KUFRACTUALEND	is 'Фактическое окончание';
comment on column DM.LEASROUTING_MODELS.KUFRCREATEDON	is 'Дата создания';
comment on column DM.LEASROUTING_MODELS.KUFRNEW_APPROVALRESULT	is 'Решение';
comment on column DM.LEASROUTING_MODELS.KUFRNEW_APPROVALRESULTNM	is 'Решение';
comment on column DM.LEASROUTING_MODELS.KUFRNEW_COMMENTS	is 'Результат выполнения задачи';
comment on column DM.LEASROUTING_MODELS.KUFRNEW_COUNTER_FULLTIME	is 'Полное время (мин.)';
comment on column DM.LEASROUTING_MODELS.KUFRNEW_COUNTER_WORKTIME	is 'Время работы с задачей (мин.)';
comment on column DM.LEASROUTING_MODELS.KUFRNEW_HISTORY	is 'История выполнения задачи';
comment on column DM.LEASROUTING_MODELS.KUFRNEW_TYPE	is 'Тип задачи';
comment on column DM.LEASROUTING_MODELS.KUFRNEW_TYPENAME	is 'Тип задачи';
comment on column DM.LEASROUTING_MODELS.REAPPROVACTIVITYID	is 'Задача';
comment on column DM.LEASROUTING_MODELS.REAPPROV_NO	is 'Номер задачи внутри расчёта';
comment on column DM.LEASROUTING_MODELS.REAPPROVACTUALEND	is 'Фактическое окончание';
comment on column DM.LEASROUTING_MODELS.REAPPROVCREATEDON	is 'Дата создания';
comment on column DM.LEASROUTING_MODELS.REAPPROVNEW_APPROVALRESULT	is 'Решение';
comment on column DM.LEASROUTING_MODELS.REAPPROVNEW_APPROVALRESULTNAME	is 'Решение';
comment on column DM.LEASROUTING_MODELS.REAPPROVNEW_COMMENTS	is 'Результат выполнения задачи';
comment on column DM.LEASROUTING_MODELS.REAPPROVNEW_COUNTER_FULLTIME	is 'Полное время (мин.)';
comment on column DM.LEASROUTING_MODELS.REAPPROVNEW_COUNTER_WORKTIME	is 'Время работы с задачей (мин.)';
comment on column DM.LEASROUTING_MODELS.REAPPROVNEW_HISTORY	is 'История выполнения задачи';
comment on column DM.LEASROUTING_MODELS.REAPPROVNEW_TYPE	is 'Тип задачи';
comment on column DM.LEASROUTING_MODELS.REAPPROVNEW_TYPENAME	is 'Тип задачи';

create index DM.LEASROUTING_MODELS_i01 on DM.LEASROUTING_MODELS (snapshot_dt);
