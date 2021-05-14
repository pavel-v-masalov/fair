create table DM.FAIR_VALUE
(
    calculation_id             NUMBER not null,
    report_dt                  DATE,
    currency_letter_cd         VARCHAR2(100),
    fixfloat                   VARCHAR2(100),
    snapshot_dt                DATE,
    client_name                VARCHAR2(4000),
    term_amt                   NUMBER,
    rating_model_key           NUMBER,
    rating_nam                 VARCHAR2(16),
    leasing_subject_type_cd    VARCHAR2(200),
    currate_type_key           NUMBER,
    contracts_terms_key        NUMBER,
    ftp_calculation_method_key NUMBER,
    early_spread_type_key      NUMBER,
    moratory_term_amt          NUMBER,
    fix_period_amt             NUMBER,
    use_period_amt             NUMBER,
    ind_cncl_term_amt          NUMBER,
    balance_debt_amt           NUMBER,
    market_value_amt           NUMBER,
    proceed_amt                NUMBER,
    barrier                    NUMBER,
    "COMMENT"                    VARCHAR2(200),
    ftp_v                      NUMBER,
    pkr_v                      NUMBER,
    pec_v                      NUMBER,
    direct_costs_v             NUMBER,
    maintenence_costs_v        NUMBER,
    early_spread_v             NUMBER,
    revenue_comission_v        NUMBER,
    fix_spread_v               NUMBER,
    cncl_spread_v              NUMBER,
    full_cncl_spread_v         NUMBER,
    term_cncl_spread_v         NUMBER,
    one_cncl_spread_v          NUMBER,
    other_spread               NUMBER,
    other_spread_comment       VARCHAR2(4000),
    msfo_balance_debt_amt      NUMBER,
    comission_amt              NUMBER,
    fv_msfo_v                  NUMBER,
    market_currency_letter_cd  VARCHAR2(100),
    proceed_currency_letter_cd VARCHAR2(100),
    contract_exchange_rate     NUMBER,
    market_exchange_rate       NUMBER,
    proceed_exchange_rate      NUMBER,
    contract_exchange_rate_dt  DATE,
    market_exchange_rate_dt    DATE,
    proceed_exchange_rate_dt   DATE
);
comment on table DM.FAIR_VALUE
    is 'Таблица расчетов (параметры запуска+результат)';
-- Add comments to the columns
comment on column DM.FAIR_VALUE.calculation_id
    is 'ID расчета';
comment on column DM.FAIR_VALUE.report_dt
    is 'Дата запуска расчета';
comment on column DM.FAIR_VALUE.currency_letter_cd
    is 'Валюта типа ставки';
comment on column DM.FAIR_VALUE.fixfloat
    is 'Признак фиксированной плавающей ставки';
comment on column DM.FAIR_VALUE.snapshot_dt
    is 'Дата расчета (на какую дату запускается расчет)';
comment on column DM.FAIR_VALUE.client_name
    is 'Лизингополучатель';
comment on column DM.FAIR_VALUE.term_amt
    is 'Срок сделки';
comment on column DM.FAIR_VALUE.rating_model_key
    is 'Ключ рейтинговой модели';
comment on column DM.FAIR_VALUE.rating_nam
    is 'Рейтинг';
comment on column DM.FAIR_VALUE.leasing_subject_type_cd
    is 'Типа лизингового имущества';
comment on column DM.FAIR_VALUE.currate_type_key
    is 'Ключ типа ставки';
comment on column DM.FAIR_VALUE.contracts_terms_key
    is 'Ключ условий контракта';
comment on column DM.FAIR_VALUE.ftp_calculation_method_key
    is 'Ключи Методики расчета ставки FTP';
comment on column DM.FAIR_VALUE.early_spread_type_key
    is 'Ключ вида спреда на досрочное погашение';
comment on column DM.FAIR_VALUE.moratory_term_amt
    is 'Срок моратория';
comment on column DM.FAIR_VALUE.fix_period_amt
    is 'Период фиксации';
comment on column DM.FAIR_VALUE.use_period_amt
    is 'Период использования';
comment on column DM.FAIR_VALUE.ind_cncl_term_amt
    is 'Срок отмены тестирования';
comment on column DM.FAIR_VALUE.balance_debt_amt
    is 'Балансовая величина задолженности, руб.';
comment on column DM.FAIR_VALUE.market_value_amt
    is 'Рыночная стоимость имущества';
comment on column DM.FAIR_VALUE.proceed_amt
    is 'Выручка, млн. RUB без НДС за последний календарный год';
comment on column DM.FAIR_VALUE.barrier
    is 'Порог пересмотра ставки';
comment on column DM.FAIR_VALUE."COMMENT"
    is 'Текст комментария к расчету';
comment on column DM.FAIR_VALUE.ftp_v
    is 'Кривая FTP (Трансфертная ставка)';
comment on column DM.FAIR_VALUE.pkr_v
    is 'Премия за кредитный риск';
comment on column DM.FAIR_VALUE.pec_v
    is 'Плата за экономический капитал';
comment on column DM.FAIR_VALUE.direct_costs_v
    is 'Прямые расходы Банка';
comment on column DM.FAIR_VALUE.maintenence_costs_v
    is 'АХР ВТБЛ';
comment on column DM.FAIR_VALUE.early_spread_v
    is 'Спред за досрочное погашение';
comment on column DM.FAIR_VALUE.revenue_comission_v
    is 'Комиссия за обязательство';
comment on column DM.FAIR_VALUE.fix_spread_v
    is 'Спред за фиксацию ставки';
comment on column DM.FAIR_VALUE.cncl_spread_v
    is 'Спред за отсутствие/отмену индикаторов';
comment on column DM.FAIR_VALUE.full_cncl_spread_v
    is 'Спред за отсутствие/полную отмену индикаторов';
comment on column DM.FAIR_VALUE.term_cncl_spread_v
    is 'Спред за отмену индикаторов на неполный срок';
comment on column DM.FAIR_VALUE.one_cncl_spread_v
    is 'Спреды за отмену одного индикатора';
comment on column DM.FAIR_VALUE.other_spread
    is 'Прочие спреды';
comment on column DM.FAIR_VALUE.other_spread_comment
    is 'Комментарий к прочим спредам';
comment on column DM.FAIR_VALUE.msfo_balance_debt_amt
    is 'Задолженность по графику МСФО';
comment on column DM.FAIR_VALUE.comission_amt
    is 'Комиссия за организацию сделки';
comment on column DM.FAIR_VALUE.fv_msfo_v
    is 'Справедливая ставка МСФО';
comment on column DM.FAIR_VALUE.market_currency_letter_cd
    is 'Валюта рыночной стоимости';
comment on column DM.FAIR_VALUE.proceed_currency_letter_cd
    is 'Валюта выручки';
comment on column DM.FAIR_VALUE.contract_exchange_rate
    is 'Курс валюты договора (если рубль, то 1)';
comment on column DM.FAIR_VALUE.market_exchange_rate
    is 'Курс валюты рыночной стоимости (если рубль, то 1)';
comment on column DM.FAIR_VALUE.proceed_exchange_rate
    is 'Курс валюты выручки (если рубль, то 1)';
comment on column DM.FAIR_VALUE.contract_exchange_rate_dt
    is 'Дата Курса валюты договора (если рубль, то null)';
comment on column DM.FAIR_VALUE.market_exchange_rate_dt
    is 'Дата Курса валюты рыночной стоимости (если рубль, то null)';
comment on column DM.FAIR_VALUE.proceed_exchange_rate_dt
    is 'Дата Курса валюты выручки (если рубль, то null)';

alter table DM.FAIR_VALUE
    add primary key (CALCULATION_ID)
        using index;

