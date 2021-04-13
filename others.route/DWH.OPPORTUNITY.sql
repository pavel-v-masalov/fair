-- Create table
create table DWH.OPPORTUNITY
(
    createdon                      DATE,
    customerid                     VARCHAR2(36),
    customeridname                 VARCHAR2(4000),
    modifiedon                     DATE,
    name                           VARCHAR2(2000),
    new_4reliability_group         NUMBER,
    new_4rel_group_opportunity     NUMBER,
    new_4reliability_groupname     VARCHAR2(1000),
    new_additionalconditions       VARCHAR2(4000),
    new_agencycontractid           VARCHAR2(36),
    new_agencycontractidname       VARCHAR2(1000),
    new_agentid                    VARCHAR2(36),
    new_agentidname                VARCHAR2(2000),
    new_allexpretisetasksclosed    NUMBER,
    new_approvalresult             NUMBER,
    new_approvalresultname         VARCHAR2(1000),
    new_approvalroute              NUMBER,
    new_approvalroutename          VARCHAR2(1000),
    new_confirmlitemtomidmvalue    NUMBER,
    new_contractsum                NUMBER,
    new_coremanagerualid           VARCHAR2(36),
    new_coremanagerualidname       VARCHAR2(1000),
    new_creditriskdefaultearlier   NUMBER,
    new_currency                   NUMBER,
    new_document                   NUMBER,
    new_factadress                 NUMBER,
    new_factsum                    NUMBER,
    new_financesum                 NUMBER,
    new_financesum_investrest_gk   NUMBER,
    new_franchise                  NUMBER,
    new_fraudriskdefaultearlier    NUMBER,
    new_headercoremanagerual       VARCHAR2(36),
    new_headercoremanagerualname   VARCHAR2(1000),
    new_headermanagerualid         VARCHAR2(36),
    new_headermanagerualidname     VARCHAR2(1000),
    new_incidentsource             NUMBER,
    new_incidentsourcename         VARCHAR2(1000),
    new_includeagent               NUMBER,
    new_inspectionuakr             NUMBER,
    new_inspectionuakrname         VARCHAR2(1000),
    new_insurancerisk              NUMBER,
    new_leasagreementcondconfirmed NUMBER,
    new_leasedealstopfactors       NUMBER,
    new_leasedealstopfactorsname   VARCHAR2(1000),
    new_leaseobject                NUMBER,
    new_leasesrok                  NUMBER,
    new_middlemanager              VARCHAR2(36),
    new_middlemanagername          VARCHAR2(1000),
    new_nonfinancial               NUMBER,
    new_opf                        NUMBER,
    new_opt                        NUMBER,
    new_order_for_signing          NUMBER,
    new_order_for_signingname      VARCHAR2(1000),
    new_place                      NUMBER,
    new_podproduct                 VARCHAR2(36),
    new_podproductname             VARCHAR2(1000),
    new_productcost                NUMBER,
    new_productid                  VARCHAR2(36),
    new_productidname              VARCHAR2(1000),
    new_propertyrisk               NUMBER,
    new_quantitylo                 NUMBER,
    new_recommendationsdone        NUMBER,
    new_redemptionpayment          NUMBER,
    new_registrationdate           NUMBER,
    new_routingbymodel             NUMBER,
    new_sentforapproval            VARCHAR2(36),
    new_sentforapprovalname        VARCHAR2(1000),
    new_statuscodeid               VARCHAR2(36),
    new_statuscodeidname           VARCHAR2(1000),
    new_stopfactorsagreementerid   VARCHAR2(36),
    new_stopfacagreementeridname   VARCHAR2(1000),
    new_summ                       NUMBER,
    new_supplier                   NUMBER,
    new_suspensiveconditions       VARCHAR2(4000),
    new_taxationsystem             NUMBER,
    new_territory                  VARCHAR2(36),
    new_territoryname              VARCHAR2(1000),
    new_totalfinanceopportunitysum NUMBER,
    new_totalfinancingsum          NUMBER,
    new_totalfinancingsum_express  NUMBER,
    new_totalsumdealperiod         NUMBER,
    new_typelo                     NUMBER,
    new_yearmarga                  NUMBER,
    opportunityid                  VARCHAR2(36),
    originatingleadid              VARCHAR2(36),
    originatingleadidname          VARCHAR2(1000),
    ownerid                        VARCHAR2(36),
    owneridname                    VARCHAR2(1000),
    statuscode                     NUMBER,
    statuscodename                 VARCHAR2(1000),
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
comment on column DWH.OPPORTUNITY.createdon
  is ' Дата создания ';
comment on column DWH.OPPORTUNITY.customerid
  is ' Лизингополучатель ';
comment on column DWH.OPPORTUNITY.customeridname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.modifiedon
  is ' Дата изменения ';
comment on column DWH.OPPORTUNITY.name
  is ' Номер Лизинговой сделки (вн. CRM) ';
comment on column DWH.OPPORTUNITY.new_4reliability_group
  is ' Четвёртая группа надежности ';
comment on column DWH.OPPORTUNITY.new_4rel_group_opportunity
  is ' Четвёртая группа надежности по текущей сделке ';
comment on column DWH.OPPORTUNITY.new_4reliability_groupname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_additionalconditions
  is ' Дополнительные условия ';
comment on column DWH.OPPORTUNITY.new_agencycontractid
  is ' Агентский договор (справочник) ';
comment on column DWH.OPPORTUNITY.new_agencycontractidname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_agentid
  is ' Агент (справочник) ';
comment on column DWH.OPPORTUNITY.new_agentidname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_allexpretisetasksclosed
  is ' Закрыты все задачи на экспертизу ';
comment on column DWH.OPPORTUNITY.new_approvalresult
  is ' Решение ';
comment on column DWH.OPPORTUNITY.new_approvalresultname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_approvalroute
  is ' Маршрут одобрения ';
comment on column DWH.OPPORTUNITY.new_approvalroutename
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_confirmlitemtomidmvalue
  is ' Соответствие среднерыночной стоимости ';
comment on column DWH.OPPORTUNITY.new_contractsum
  is ' Общая сумма заключаемых ДЛ (с НДС). не более, руб: ';
comment on column DWH.OPPORTUNITY.new_coremanagerualid
  is ' Основной менеджер продаж ';
comment on column DWH.OPPORTUNITY.new_coremanagerualidname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_creditriskdefaultearlier
  is ' Наличие дефолта кредитного риска ранее ';
comment on column DWH.OPPORTUNITY.new_currency
  is ' Валюта договора ';
comment on column DWH.OPPORTUNITY.new_document
  is ' Документы для экспертиз ';
comment on column DWH.OPPORTUNITY.new_factadress
  is ' Фактический адрес бизнеса ЛП ';
comment on column DWH.OPPORTUNITY.new_factsum
  is ' Общая сумма заключенных сделок и рассматриваемой ';
comment on column DWH.OPPORTUNITY.new_financesum
  is ' Совокупная сумма фин-я по ЛС (с НДС), руб ';
comment on column DWH.OPPORTUNITY.new_financesum_investrest_gk
  is ' Совокупная сумма фин-я по по ГК с учетом инв. ';
comment on column DWH.OPPORTUNITY.new_franchise
  is ' Франшиза ';
comment on column DWH.OPPORTUNITY.new_fraudriskdefaultearlier
  is ' Наличие дефолта фрод-риска ранее ';
comment on column DWH.OPPORTUNITY.new_headercoremanagerual
  is ' Руководитель основного менеджера продаж ';
comment on column DWH.OPPORTUNITY.new_headercoremanagerualname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_headermanagerualid
  is ' Руководитель текущего ответственного по проекту ';
comment on column DWH.OPPORTUNITY.new_headermanagerualidname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_incidentsource
  is ' Источник обращения ';
comment on column DWH.OPPORTUNITY.new_incidentsourcename
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_includeagent
  is ' Включить в сделку агента ';
comment on column DWH.OPPORTUNITY.new_inspectionuakr
  is ' Проверка УАКР ';
comment on column DWH.OPPORTUNITY.new_inspectionuakrname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_insurancerisk
  is ' Страхов. от рисков хищение (угон) и констр. гибель ';
comment on column DWH.OPPORTUNITY.new_leasagreementcondconfirmed
  is ' УЗДЛ/ЛИ УЗДЛ получено ';
comment on column DWH.OPPORTUNITY.new_leasedealstopfactors
  is ' ЛС со СТОП-факторами ';
comment on column DWH.OPPORTUNITY.new_leasedealstopfactorsname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_leaseobject
  is ' Год выпуска ТС ';
comment on column DWH.OPPORTUNITY.new_leasesrok
  is ' Срок лизинга ';
comment on column DWH.OPPORTUNITY.new_middlemanager
  is ' Миддл-менеджер ';
comment on column DWH.OPPORTUNITY.new_middlemanagername
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_nonfinancial
  is ' Низколиквидная техника с рассмотрением на КУФР ';
comment on column DWH.OPPORTUNITY.new_opf
  is ' ОПФ ЛП ';
comment on column DWH.OPPORTUNITY.new_opt
  is ' Перенаем ';
comment on column DWH.OPPORTUNITY.new_order_for_signing
  is ' Порядок подписания ';
comment on column DWH.OPPORTUNITY.new_order_for_signingname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_place
  is ' Место поставки/передачи ПЛ ';
comment on column DWH.OPPORTUNITY.new_podproduct
  is ' Подпродукт ';
comment on column DWH.OPPORTUNITY.new_podproductname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_productcost
  is ' Стоимость предмета лизинга по Продукту ';
comment on column DWH.OPPORTUNITY.new_productid
  is ' Продукт ';
comment on column DWH.OPPORTUNITY.new_productidname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_propertyrisk
  is ' Выявлен имущественный риск ';
comment on column DWH.OPPORTUNITY.new_quantitylo
  is ' Количество ПЛ в рамках Продукта ';
comment on column DWH.OPPORTUNITY.new_recommendationsdone
  is ' Рекомендации выполнены ';
comment on column DWH.OPPORTUNITY.new_redemptionpayment
  is ' Выкупной платеж ';
comment on column DWH.OPPORTUNITY.new_registrationdate
  is ' Срок с даты регистрации ЛП ';
comment on column DWH.OPPORTUNITY.new_routingbymodel
  is ' Маршрутизация по модели ';
comment on column DWH.OPPORTUNITY.new_sentforapproval
  is ' Отправивший на одобрение ';
comment on column DWH.OPPORTUNITY.new_sentforapprovalname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_statuscodeid
  is ' Этап ';
comment on column DWH.OPPORTUNITY.new_statuscodeidname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_stopfactorsagreementerid
  is ' Кем проводилось согласование СТОП-факторов ';
comment on column DWH.OPPORTUNITY.new_stopfacagreementeridname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_summ
  is ' Превышение суммы финансирования по Продукту ';
comment on column DWH.OPPORTUNITY.new_supplier
  is ' Поставщик ПЛ ';
comment on column DWH.OPPORTUNITY.new_suspensiveconditions
  is ' Отлагательные условия ';
comment on column DWH.OPPORTUNITY.new_taxationsystem
  is ' Система налогообложения ';
comment on column DWH.OPPORTUNITY.new_territory
  is ' Подразделение ';
comment on column DWH.OPPORTUNITY.new_territoryname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_totalfinanceopportunitysum
  is ' Общая сумма финансирования за период, с учетом рас ';
comment on column DWH.OPPORTUNITY.new_totalfinancingsum
  is ' Совокупная сумма ф-ия по ЛП с ГК с учетом инв ';
comment on column DWH.OPPORTUNITY.new_totalfinancingsum_express
  is ' Совокупная сумма финансирования по ЛП с ГК Express ';
comment on column DWH.OPPORTUNITY.new_totalsumdealperiod
  is ' Общая сумма заключенных сделок, за период ';
comment on column DWH.OPPORTUNITY.new_typelo
  is ' Тип ТС ';
comment on column DWH.OPPORTUNITY.new_yearmarga
  is ' Годовая выручка (ОСН)/Поступления на р/с. ';
comment on column DWH.OPPORTUNITY.opportunityid
  is ' Возможная сделка ';
comment on column DWH.OPPORTUNITY.originatingleadid
  is ' Источник интереса ';
comment on column DWH.OPPORTUNITY.originatingleadidname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.ownerid
  is ' Текущий ответственный по проекту ';
comment on column DWH.OPPORTUNITY.owneridname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.statuscode
  is ' Статус ';
comment on column DWH.OPPORTUNITY.statuscodename
  is ' NULL ';
-- Create/Recreate indexes
create unique index DWH.OPPORTUNITY_I on DWH.OPPORTUNITY (OPPORTUNITYID, TIMESLOTSTART, VALID_TO_DTTM);

