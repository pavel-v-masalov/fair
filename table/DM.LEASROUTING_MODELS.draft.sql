create table DM.LEASROUTING_MODELS
as
select
cast(null as date)  as  SNAPSHOT_DT , --  Отчетная дата
DWH.ACCOUNT.ACCOUNTID as  ACCOUNTID , --  Организация
DWH.ACCOUNT.CREATEDON as  CREATEDON , --  Дата создания
DWH.ACCOUNT.EMAILADDRESS1 as  EMAILADDRESS1 , --  Электронная почта
DWH.ACCOUNT.INDUSTRYCODENAME  as  INDUSTRYCODENAME  , --  Вид деятельности
DWH.ACCOUNT.NAME  as  ORGNAME , --  Название организации
DWH.ACCOUNT.NEW_ACCOUNTINDUCTRYNAME as  NEW_ACCOUNTINDUCTRYNAME , --  Основной вид деятельности
DWH.ACCOUNT.NEW_BLACK_LIST_DATE as  NEW_BLACK_LIST_DATE , --  Дата внесения в ЧС
DWH.ACCOUNT.NEW_CEOCHANGENAME as  NEW_CEOCHANGENAME , --  Изменение ЕИО\учредителей
DWH.ACCOUNT.NEW_CHEKVERIFICATION  as  NEW_CHEKVERIFICATION  , --  Проверен верификатором
DWH.ACCOUNT.NEW_COMPANYSITE as  NEW_COMPANYSITE , --  Сайт компании
DWH.ACCOUNT.NEW_EXPLOITATIONPL1 as  NEW_EXPLOITATIONPL1 , --  Ответственный за эксплуатацию ПЛ
DWH.ACCOUNT.NEW_INCIDENTSOURCENAME  as  NEW_INCIDENTSOURCENAME  , --  Источник обращения
DWH.ACCOUNT.NEW_INN as  NEW_INN , --  ИНН
DWH.ACCOUNT.NEW_KY_CUSTOMER as  NEW_KY_CUSTOMER , --  Ключевой клиент
DWH.ACCOUNT.NEW_KY_SPESHLPR as  NEW_KY_SPESHLPR , --  Спецпроект
DWH.ACCOUNT.NEW_LEGALORGANIZATIONALFORMNAM  as  NEW_LEGALORGANIZATIONALFORMNAM  , --  Организационно-правовая форма организации
DWH.ACCOUNT.NEW_MOBILEPHONE as  NEW_MOBILEPHONE , --  Мобильный телефон
DWH.ACCOUNT.NEW_OGRN  as  NEW_OGRN  , --  ОГРН
DWH.ACCOUNT.NEW_OKVEDIDNAME as  NEW_OKVEDIDNAME , --  ОКВЭД
DWH.ACCOUNT.NEW_PHYSICALINN as  NEW_PHYSICALINN , --  ИНН физического лица
DWH.ACCOUNT.NEW_REGISTRATIONADDRESS as  NEW_REGISTRATIONADDRESS , --  Адрес регистрации
DWH.ACCOUNT.NEW_REGISTRATIONDATE  as  NEW_REGISTRATIONDATE  , --  Дата регистрации компании
DWH.ACCOUNT.PRIMARYCONTACTID  as  PRIMARYCONTACTID  , --  Руководитель
DWH.ACCOUNT.PRIMARYCONTACTIDNAME  as  PRIMARYCONTACTIDNAME  , --  Руководитель
DWH.ACCOUNT.WEBSITEURL  as  WEBSITEURL  , --  Веб-сайт
DWH.RELLGROUP.RELGROUPS as  RELGROUPS , --  Список групп надежности
DWH.RELLGROUP.relmax as  RELMAX  , --  Максимальная группа
DWH.OPPORTUNITY.NEW_AGENTID as  NEW_AGENTID , --  Агент (справочник)
DWH.OPPORTUNITY.NEW_ALLEXPRETISETASKSCLOSED as  NEW_ALLEXPRETISETASKSCLOSED , --  Закрыты все задачи на экспертизу
DWH.OPPORTUNITY.NEW_APPROVALRESULTNAME  as  NEW_APPROVALRESULTNAME  , --  Решение
DWH.OPPORTUNITY.NEW_FACTADRESS  as  NEW_FACTADRESS  , --  Фактический адрес бизнеса ЛП
DWH.OPPORTUNITY.NEW_LEASAGREEMENTCONDCONFIRMED  as  NEW_LEASAGREEMENTCONDCONFIRMED  , --  УЗДЛ/ЛИ УЗДЛ получено
DWH.OPPORTUNITY.NEW_NONFINANCIAL  as  NEW_NONFINANCIAL  , --  Низколиквидная техника с рассмотрением на КУФР
DWH.OPPORTUNITY.NEW_OPT as  NEW_OPT , --  Перенаем
DWH.OPPORTUNITY.NEW_PODPRODUCTNAME  as  NEW_PODPRODUCTNAME  , --  Подпродукт
DWH.OPPORTUNITY.NEW_PRODUCTIDNAME as  NEW_PRODUCTIDNAME , --  Продукт
DWH.OPPORTUNITY.NEW_PROPERTYRISK  as  NEW_PROPERTYRISK  , --  Выявлен имущественный риск
/*DWH.OPPORTUNITY.new_count*/cast(null as varchar2(100)) as  new_count, --  
DWH.OPPORTUNITY.NEW_ROUTINGBYMODEL  as  NEW_ROUTINGBYMODEL  , --  Маршрутизация по модели
DWH.OPPORTUNITY.NEW_STATUSCODEIDNAME  as  NEW_STATUSCODEIDNAME  , --  Этап
DWH.OPPORTUNITY.NEW_TOTALFINANCINGSUM as  NEW_TOTALFINANCINGSUM , --  Совокупная сумма ф-ия по ЛП с ГК с учетом инв
DWH.OPPORTUNITY.NEW_TOTALFINANCINGSUM_EXPRESS as  NEW_TOTALFINANCINGSUM_EXPRESS , --  Совокупная сумма финансирования по ЛП с ГК Express
DWH.OPPORTUNITY.NEW_TOTALSUMDEALPERIOD  as  NEW_TOTALSUMDEALPERIOD  , --  Общая сумма заключенных сделок, за период
DWH.NEW_ACCOUNTGROUP.NEW_ACCOUNTGROUPID  as  NEW_ACCOUNTGROUPID  , --  Группа компаний
DWH.NEW_ACCOUNTGROUP.NEW_NAME  as  NEW_NAME  , --  Имя
DWH.CONTACT.BIRTHDATE as  BIRTHDATE , --  День рождения
DWH.CONTACT.CONTACTID as  CONTACTID , --  Контакт
DWH.CONTACT.FIRSTNAME as  FIRSTNAME , --  Имя
DWH.CONTACT.GENDERCODENAME  as  GENDERCODENAME  , --  Пол
DWH.CONTACT.JOBTITLE  as  JOBTITLE  , --  Должность
DWH.CONTACT.MIDDLENAME  as  MIDDLENAME  , --  Отчество
DWH.CONTACT.MOBILEPHONE as  MOBILEPHONE , --  Мобильный телефон
DWH.CONTACT.NEW_ADDRESS as  NEW_ADDRESS , --  Адрес регистрации
DWH.CONTACT.NEW_CONTACTTYPENAME as  NEW_CONTACTTYPENAME , --  Тип контакта
DWH.CONTACT.VTBL_SCORINGSCORE as  VTBL_SCORINGSCORE , --  Скоринг-балл БКИ
DWH.NEW_HUMANDOCS.NEW_DOCNUMBER as  NEW_DOCNUMBER , --  Номер
DWH.NEW_HUMANDOCS.NEW_DOCTYPE as  NEW_DOCTYPE , --  Тип документа
DWH.NEW_HUMANDOCS.NEW_DOCTYPENAME as  NEW_DOCTYPENAME , --  NULL
DWH.NEW_HUMANDOCS.NEW_SERIA as  NEW_SERIA , --  Серия
DWH.NEW_HUMANDOCS.NEW_STARTDATE as  NEW_STARTDATE , --  Действует с
DWH.NEW_HUMANDOCS.NEW_WHENGIVE  as  NEW_WHENGIVE  , --  Когда выдан
DWH.NEW_HUMANDOCS.NEW_WHOGIVE as  NEW_WHOGIVE , --  Кем выдан
DWH.CRM_LEAD.LEADID  as  LEADID  , --  Интерес
DWH.CRM_LEAD.NEW_REF_ACCOUNTNAME as  NEW_REF_ACCOUNTNAME , --  Тип интереса
DWH.CRM_LEAD.NEW_WEB as  NEW_WEB , --  Родительская организация интереса
DWH.RMD.COUNTEDON as  COUNTEDON , --  Время и дата расчета по моделям
DWH.RMD.CREDITMODELISCOUNTABLE  as  CREDITMODELISCOUNTABLE  , --  Можно рассчитать кредитную модель
DWH.RMD.FINANCESUM  as  FINANCESUM  , --  Совокупная сумма ф-ия по ЛП с ГК с учетом инв (лизинговая сделка)
DWH.RMD.CREDITMODELRESULT as  CREDITMODELRESULT , --  Модель кредитного риска (лизинговая сделка)
DWH.RMD.NEW_FINANCESUM  as  NEW_FINANCESUM  , --  ССФ по сделке без ГК
DWH.RMD.FRAUDMODELRESULT  as  FRAUDMODELRESULT  , --  Модель фрод риска (лизинговая сделка)
DWH.RMD.OPPORTUNITYCREDITRESULT as  OPPORTUNITYCREDITRESULT , --  Прогноз кред дефолта на сделку
DWH.RMD.OPPORTUNITYFRAUDRESULT  as  OPPORTUNITYFRAUDRESULT  , --  Прогноз фрод дефолта на сделку
DWH.RMD.PRODUCTOP as  PRODUCTOP , --  Продукт из лизинговой сделки
DWH.RMD.SCORINGSCORE  as  SCORINGSCORE  , --  НБКИ балл
/*DWH.RMD.isPrescorig*/cast(null as varchar2(100)) as  isPrescorig , --  Расчёт в рамках прескоринга
/*DWH.RMD.MODEL_TYPE*/cast(null as varchar2(100)) as  MODEL_TYPE  , --  Тип модели
/*DWH.RMD.calc_conditions*/cast(null as varchar2(100)) as  calc_conditions , --  Условие попадания в повторные
/*DWH.RMD.ISPRESCORINGCALL*/cast(null as varchar2(100)) as  ISPRESCORINGCALL  , --  Расчёт в рамках прескоринга
/*DWH.RMD.model_settings*/cast(null as varchar2(100)) as  model_settings  , --  Кортеж включенных моделей на ммоент расчёта
DWH.TASKNEW.ACTIVITYID  as  VERACTIVITYID , --  Задача
cast(null as number)  as  VER_NO  , --  Номер задачи внутри расчёта
DWH.TASKNEW.ACTUALEND as  VERACTUALEND  , --  Фактическое окончание
DWH.TASKNEW.ACTUALSTART as  VERACTUALSTART  , --  Фактическое начало
DWH.TASKNEW.CREATEDON as  VERCREATEDON  , --  Дата создания
DWH.TASKNEW.NEW_APPROVALRESULT  as  VERNEW_APPROVALRESULT , --  Решение
DWH.TASKNEW.NEW_APPROVALRESULTNAME  as  VERNEW_APPROVALRESULTNAME , --  Решение
DWH.TASKNEW.NEW_COMMENTS  as  VERNEW_COMMENTS , --  Результат выполнения задачи
DWH.TASKNEW.NEW_COUNTER_FULLTIME  as  VERNEW_COUNTER_FULLTIME , --  Полное время (мин.)
DWH.TASKNEW.NEW_COUNTER_WORKTIME  as  VERNEW_COUNTER_WORKTIME , --  Время работы с задачей (мин.)
DWH.TASKNEW.NEW_HISTORY as  VERNEW_HISTORY  , --  История выполнения задачи
DWH.TASKNEW.NEW_TYPE  as  VERNEW_TYPE , --  Тип задачи
DWH.TASKNEW.NEW_TYPENAME  as  VERNEW_TYPENAME , --  Тип задачи
DWH.TASKNEW.NEW_UZDL  as  VERNEW_UZDL , --  Сделка в рамках УЗДЛ
DWH.TASKNEW.ACTIVITYID  as  RECONFIRMATIONACTIVITYID  , --  Задача
cast(null as number)  as  RECONFIRMATION_NO , --  Номер задачи внутри расчёта
DWH.TASKNEW.ACTUALEND as  RECONFIRMATIONACTUALEND , --  Фактическое окончание
DWH.TASKNEW.ACTUALSTART as  RECONFIRMATIONACTUALSTART , --  Фактическое начало
DWH.TASKNEW.CREATEDON as  RECONFIRMATIONCREATEDON , --  Дата создания
DWH.TASKNEW.NEW_APPROVALRESULT  as  RECONFIRMATIONNEW_APPROVALRESULT  , --  Решение
DWH.TASKNEW.NEW_APPROVALRESULTNAME  as  RECONFIRMATIONNEW_APPROVALRESULTNAME  , --  Решение
DWH.TASKNEW.NEW_COMMENTS  as  RECONFIRMATIONNEW_COMMENTS  , --  Результат выполнения задачи
DWH.TASKNEW.NEW_COUNTER_FULLTIME  as  RECONFIRMATIONNEW_COUNTER_FULLTIME  , --  Полное время (мин.)
DWH.TASKNEW.NEW_COUNTER_WORKTIME  as  RECONFIRMATIONNEW_COUNTER_WORKTIME  , --  Время работы с задачей (мин.)
DWH.TASKNEW.NEW_HISTORY as  RECONFIRMATIONNEW_HISTORY , --  История выполнения задачи
DWH.TASKNEW.NEW_TYPE  as  RECONFIRMATIONNEW_TYPE  , --  Тип задачи
DWH.TASKNEW.NEW_TYPENAME  as  RECONFIRMATIONNEW_TYPENAME  , --  Тип задачи
DWH.TASKNEW.NEW_UZDL  as  RECONFIRMATIONNEW_UZDL  , --  Сделка в рамках УЗДЛ
DWH.TASKNEW.ACTIVITYID  as  EXPOYBACTIVITYID  , --  Задача
cast(null as number)  as  EXPOYB_NO , --  Номер задачи внутри расчёта
DWH.TASKNEW.ACTUALEND as  EXPOYBACTUALEND , --  Фактическое окончание
DWH.TASKNEW.ACTUALSTART as  EXPOYBACTUALSTART , --  Фактическое начало
DWH.TASKNEW.CREATEDON as  EXPOYBCREATEDON , --  Дата создания
DWH.TASKNEW.NEW_APPROVALRESULT  as  EXPOYBNEW_APPROVALRESULT  , --  Решение
DWH.TASKNEW.NEW_APPROVALRESULTNAME  as  EXPOYBNEW_APPROVALRESULTNAME  , --  Решение
DWH.TASKNEW.NEW_COMMENTS  as  EXPOYBNEW_COMMENTS  , --  Результат выполнения задачи
DWH.TASKNEW.NEW_COUNTER_FULLTIME  as  EXPOYBNEW_COUNTER_FULLTIME  , --  Полное время (мин.)
DWH.TASKNEW.NEW_COUNTER_WORKTIME  as  EXPOYBNEW_COUNTER_WORKTIME  , --  Время работы с задачей (мин.)
DWH.TASKNEW.NEW_HISTORY as  EXPOYBNEW_HISTORY , --  История выполнения задачи
DWH.TASKNEW.NEW_TYPE  as  EXPOYBNEW_TYPE  , --  Тип задачи
DWH.TASKNEW.NEW_TYPENAME  as  EXPOYBNEW_TYPENAME  , --  Тип задачи
DWH.TASKNEW.NEW_UZDL  as  EXPOYBNEW_UZDL  , --  Сделка в рамках УЗДЛ
DWH.TASKNEW.ACTIVITYID  as  REPOYBACTIVITYID  , --  Задача
cast(null as number)  as  REPOYB_NO , --  Номер задачи внутри расчёта
DWH.TASKNEW.ACTUALEND as  REPOYBACTUALEND , --  Фактическое окончание
DWH.TASKNEW.ACTUALSTART as  REPOYBACTUALSTART , --  Фактическое начало
DWH.TASKNEW.CREATEDON as  REPOYBCREATEDON , --  Дата создания
DWH.TASKNEW.NEW_APPROVALRESULT  as  REPOYBNEW_APPROVALRESULT  , --  Решение
DWH.TASKNEW.NEW_APPROVALRESULTNAME  as  REPOYBNEW_APPROVALRESULTNAME  , --  Решение
DWH.TASKNEW.NEW_COMMENTS  as  REPOYBNEW_COMMENTS  , --  Результат выполнения задачи
DWH.TASKNEW.NEW_COUNTER_FULLTIME  as  REPOYBNEREPOYBW_COUNTER_FULLTIME  , --  Полное время (мин.)
DWH.TASKNEW.NEW_COUNTER_WORKTIME  as  REPOYBNEW_COUNTER_WORKTIME  , --  Время работы с задачей (мин.)
DWH.TASKNEW.NEW_HISTORY as  REPOYBNEW_HISTORY , --  История выполнения задачи
DWH.TASKNEW.NEW_TYPE  as  REPOYBNEW_TYPE  , --  Тип задачи
DWH.TASKNEW.NEW_TYPENAME  as  REPOYBNEW_TYPENAME  , --  Тип задачи
DWH.TASKNEW.NEW_UZDL  as  REPOYBNEW_UZDL  , --  Сделка в рамках УЗДЛ
DWH.TASKNEW.ACTIVITYID  as  EXPUAKRACTIVITYID , --  Задача
cast(null as number)  as  EXPUAKR_NO  , --  Номер задачи внутри расчёта
DWH.TASKNEW.ACTUALEND as  EXPUAKRACTUALEND  , --  Фактическое окончание
DWH.TASKNEW.ACTUALSTART as  EXPUAKRACTUALSTART  , --  Фактическое начало
DWH.TASKNEW.CREATEDON as  EXPUAKRCREATEDON  , --  Дата создания
DWH.TASKNEW.NEW_APPROVALRESULT  as  EXPUAKRNEW_APPROVALRESULT , --  Решение
DWH.TASKNEW.NEW_APPROVALRESULTNAME  as  EXPUAKRNEW_APPROVALRESULTNAME , --  Решение
DWH.TASKNEW.NEW_COMMENTS  as  EXPUAKRNEW_COMMENTS , --  Результат выполнения задачи
DWH.TASKNEW.NEW_COUNTER_FULLTIME  as  EXPUAKRNEW_COUNTER_FULLTIME , --  Полное время (мин.)
DWH.TASKNEW.NEW_COUNTER_WORKTIME  as  EXPUAKRNEW_COUNTER_WORKTIME , --  Время работы с задачей (мин.)
DWH.TASKNEW.NEW_HISTORY as  EXPUAKRNEW_HISTORY  , --  История выполнения задачи
DWH.TASKNEW.NEW_TYPE  as  EXPUAKRNEW_TYPE , --  Тип задачи
DWH.TASKNEW.NEW_TYPENAME  as  EXPUAKRNEW_TYPENAME , --  Тип задачи
DWH.TASKNEW.NEW_UZDL  as  EXPUAKRNEW_UZDL , --  Сделка в рамках УЗДЛ
DWH.TASKNEW.ACTIVITYID  as  REPUAKRACTIVITYID , --  Задача
cast(null as number)  as  REPUAKR_NO  , --  Номер задачи внутри расчёта
DWH.TASKNEW.ACTUALEND as  REPUAKRACTUALEND  , --  Фактическое окончание
DWH.TASKNEW.ACTUALSTART as  REPUAKRACTUALSTART  , --  Фактическое начало
DWH.TASKNEW.CREATEDON as  REPUAKRCREATEDON  , --  Дата создания
DWH.TASKNEW.NEW_APPROVALRESULT  as  REPUAKRNEW_APPROVALRESULT , --  Решение
DWH.TASKNEW.NEW_APPROVALRESULTNAME  as  REPUAKRNEW_APPROVALRESULTNAME , --  Решение
DWH.TASKNEW.NEW_COMMENTS  as  REPUAKRNEW_COMMENTS , --  Результат выполнения задачи
DWH.TASKNEW.NEW_COUNTER_FULLTIME  as  REPUAKRNEW_COUNTER_FULLTIME , --  Полное время (мин.)
DWH.TASKNEW.NEW_COUNTER_WORKTIME  as  REPUAKRNEW_COUNTER_WORKTIME , --  Время работы с задачей (мин.)
DWH.TASKNEW.NEW_HISTORY as  REPUAKRNEW_HISTORY  , --  История выполнения задачи
DWH.TASKNEW.NEW_TYPE  as  REPUAKRNEW_TYPE , --  Тип задачи
DWH.TASKNEW.NEW_TYPENAME  as  REPUAKRNEW_TYPENAME , --  Тип задачи
DWH.TASKNEW.NEW_UZDL  as  REPUAKRNEW_UZDL , --  Сделка в рамках УЗДЛ
DWH.TASKNEW.ACTIVITYID  as  UNDERWRITACTIVITYID , --  Задача
cast(null as number)  as  UNDERWRIT_NO  , --  Номер задачи внутри расчёта
DWH.TASKNEW.ACTUALEND as  UNDERWRITACTUALEND  , --  Фактическое окончание
DWH.TASKNEW.ACTUALSTART as  UNDERWRITACTUALSTART  , --  Фактическое начало
DWH.TASKNEW.CREATEDON as  UNDERWRITCREATEDON  , --  Дата создания
DWH.TASKNEW.NEW_APPROVALRESULT  as  UNDERWRITNEW_APPROVALRESULT , --  Решение
DWH.TASKNEW.NEW_APPROVALRESULTNAME  as  UNDERWRITNEW_APPROVALRESULTNAME , --  Решение
DWH.TASKNEW.NEW_COMMENTS  as  UNDERWRITNEW_COMMENTS , --  Результат выполнения задачи
DWH.TASKNEW.NEW_COUNTER_FULLTIME  as  UNDERWRITNEW_COUNTER_FULLTIME , --  Полное время (мин.)
DWH.TASKNEW.NEW_COUNTER_WORKTIME  as  UNDERWRITNEW_COUNTER_WORKTIME , --  Время работы с задачей (мин.)
DWH.TASKNEW.NEW_HISTORY as  UNDERWRITNEW_HISTORY  , --  История выполнения задачи
DWH.TASKNEW.NEW_TYPE  as  UNDERWRITNEW_TYPE , --  Тип задачи
DWH.TASKNEW.NEW_TYPENAME  as  UNDERWRITNEW_TYPENAME , --  Тип задачи
DWH.TASKNEW.NEW_UZDL  as  UNDERWRITNEW_UZDL , --  Сделка в рамках УЗДЛ
DWH.TASKNEW.ACTIVITYID  as  SOLUTIONDESACTIVITYID , --  Задача
cast(null as number)  as  SOLUTIONDES_NO  , --  Номер задачи внутри расчёта
DWH.TASKNEW.ACTUALEND as  SOLUTIONDESACTUALEND  , --  Фактическое окончание
DWH.TASKNEW.ACTUALSTART as  SOLUTIONDESACTUALSTART  , --  Фактическое начало
DWH.TASKNEW.CREATEDON as  SOLUTIONDESCREATEDON  , --  Дата создания
DWH.TASKNEW.NEW_APPROVALRESULT  as  SOLUTIONDESNEW_APPROVALRESULT , --  Решение
DWH.TASKNEW.NEW_APPROVALRESULTNAME  as  SOLUTIONDESNEW_APPROVALRESULTNAME , --  Решение
DWH.TASKNEW.NEW_COMMENTS  as  SOLUTIONDESNEW_COMMENTS , --  Результат выполнения задачи
DWH.TASKNEW.NEW_COUNTER_FULLTIME  as  SOLUTIONDESNEW_COUNTER_FULLTIME , --  Полное время (мин.)
DWH.TASKNEW.NEW_COUNTER_WORKTIME  as  SOLUTIONDESNEW_COUNTER_WORKTIME , --  Время работы с задачей (мин.)
DWH.TASKNEW.NEW_HISTORY as  SOLUTIONDESNEW_HISTORY  , --  История выполнения задачи
DWH.TASKNEW.NEW_TYPE  as  SOLUTIONDESNEW_TYPE , --  Тип задачи
DWH.TASKNEW.NEW_TYPENAME  as  SOLUTIONDESNEW_TYPENAME , --  Тип задачи
DWH.TASKNEW.NEW_UZDL  as  SOLUTIONDESNEW_UZDL , --  Сделка в рамках УЗДЛ
DWH.TASKNEW.ACTIVITYID  as  SOLUTIONDESKUFRACTIVITYID , --  Задача
cast(null as number)  as  SOLUTIONDESKUFR_NO  , --  Номер задачи внутри расчёта
DWH.TASKNEW.ACTUALEND as  SOLUTIONDESKUFRACTUALEND  , --  Фактическое окончание
DWH.TASKNEW.ACTUALSTART as  SOLUTIONDESKUFRACTUALSTART  , --  Фактическое начало
DWH.TASKNEW.CREATEDON as  SOLUTIONDESKUFRCREATEDON  , --  Дата создания
DWH.TASKNEW.NEW_APPROVALRESULT  as  SOLUTIONDESKUFRNEW_APPROVALRESULT , --  Решение
DWH.TASKNEW.NEW_APPROVALRESULTNAME  as  SOLUTIONDESKUFRNEW_APPROVALRESULTNAME , --  Решение
DWH.TASKNEW.NEW_COMMENTS  as  SOLUTIONDESKUFRNEW_COMMENTS , --  Результат выполнения задачи
DWH.TASKNEW.NEW_COUNTER_FULLTIME  as  SOLUTIONDESKUFRNEW_COUNTER_FULLTIME , --  Полное время (мин.)
DWH.TASKNEW.NEW_COUNTER_WORKTIME  as  SOLUTIONDESKUFRNEW_COUNTER_WORKTIME , --  Время работы с задачей (мин.)
DWH.TASKNEW.NEW_HISTORY as  SOLUTIONDESKUFRNEW_HISTORY  , --  История выполнения задачи
DWH.TASKNEW.NEW_TYPE  as  SOLUTIONDESKUFRNEW_TYPE , --  Тип задачи
DWH.TASKNEW.NEW_TYPENAME  as  SOLUTIONDESKUFRNEW_TYPENAME , --  Тип задачи
DWH.TASKNEW.NEW_UZDL  as  SOLUTIONDESKUFRNEW_UZDL , --  Сделка в рамках УЗДЛ
DWH.TASKNEW.ACTIVITYID  as  REAPPROVACTIVITYID  , --  Задача
cast(null as number)  as  REAPPROV_NO , --  Номер задачи внутри расчёта
DWH.TASKNEW.ACTUALEND as  REAPPROVACTUALEND , --  Фактическое окончание
DWH.TASKNEW.ACTUALSTART as  REAPPROVACTUALSTART , --  Фактическое начало
DWH.TASKNEW.CREATEDON as  REAPPROVCREATEDON , --  Дата создания
DWH.TASKNEW.NEW_APPROVALRESULT  as  REAPPROVNEW_APPROVALRESULT  , --  Решение
DWH.TASKNEW.NEW_APPROVALRESULTNAME  as  REAPPROVNEW_APPROVALRESULTNAME  , --  Решение
DWH.TASKNEW.NEW_COMMENTS  as  REAPPROVNEW_COMMENTS  , --  Результат выполнения задачи
DWH.TASKNEW.NEW_COUNTER_FULLTIME  as  REAPPROVNEW_COUNTER_FULLTIME  , --  Полное время (мин.)
DWH.TASKNEW.NEW_COUNTER_WORKTIME  as  REAPPROVNEW_COUNTER_WORKTIME  , --  Время работы с задачей (мин.)
DWH.TASKNEW.NEW_HISTORY as  REAPPROVNEW_HISTORY , --  История выполнения задачи
DWH.TASKNEW.NEW_TYPE  as  REAPPROVNEW_TYPE  , --  Тип задачи
DWH.TASKNEW.NEW_TYPENAME  as  REAPPROVNEW_TYPENAME  , --  Тип задачи
DWH.TASKNEW.NEW_UZDL  as  REAPPROVNEW_UZDL   --  Сделка в рамках УЗДЛ
from DWH.ACCOUNT join DWH.RELLGROUP on 1=0
join DWH.OPPORTUNITY on 1=0
join DWH.NEW_ACCOUNTGROUP on 1=0
join DWH.CONTACT on 1=0
join DWH.NEW_HUMANDOCS on 1=0
join DWH.CRM_LEAD on 1=0
join DWH.RMD on 1=0
join DWH.TASKNEW on 1=0
where 1=0
