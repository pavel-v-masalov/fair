create sequence DM.FAIR_VALUE_SEQ;
create table DM.FAIR_VALUE (
  CALCULATION_ID	NUMBER	not null primary key,
  REPORT_DT	DATE,
  -- Дополнительные определители параметров запуска
  currency_letter_cd varchar2(100), -- Валюта типа ставки
  fixfloat varchar2(100), -- Признак фиксированной плавающей ставки
  -- Параметры запуска расчета
  SNAPSHOT_DT DATE,
  CLIENT_NAME VARCHAR2(4000),
  TERM_AMT NUMBER,
  TOTAL_SUM NUMBER,
  RATING_MODEL_KEY NUMBER,
  RATING_NAM VARCHAR2(16),
  LEASING_SUBJECT_TYPE_CD VARCHAR2(200),
  CURRATE_TYPE_KEY NUMBER,
  CONTRACTS_TERMS_KEY NUMBER,
  FTP_CALCULATION_METHOD_KEY NUMBER,
  EARLY_SPREAD_TYPE_KEY NUMBER,
  MORATORY_TERM_AMT NUMBER,
  FIX_PERIOD_AMT NUMBER,
  USE_PERIOD_AMT NUMBER,
  IND_CNCL_TERM_AMT NUMBER,
  BALANCE_DEBT_AMT NUMBER,
  MARKET_VALUE_AMT NUMBER,
  PROCEED_AMT NUMBER,
  -- Расчетные информационные поля
  BARRIER NUMBER,
  "COMMENT" VARCHAR2(200),
  -- Результаты расчета
  FTP_V NUMBER,
  PKR_V NUMBER,
  PEC_V NUMBER,
  DIRECT_COSTS_V NUMBER,
  MAINTENENCE_COSTS_V NUMBER,
  EARLY_SPREAD_V NUMBER,
  REVENUE_COMISSION_V NUMBER,
  FIX_SPREAD_V NUMBER,
  CNCL_SPREAD_V NUMBER,
  FULL_CNCL_SPREAD_V NUMBER,
  TERM_CNCL_SPREAD_V NUMBER,
  ONE_CNCL_SPREAD_V NUMBER
)
/
COMMENT ON table DM.FAIR_VALUE IS 'Таблица расчетов (параметры запуска+результат)';
COMMENT ON COLUMN DM.FAIR_VALUE.CALCULATION_ID is 'ID расчета';
COMMENT ON COLUMN DM.FAIR_VALUE.REPORT_DT is 'Дата запуска расчета';
-- Дополнительные определители параметров запуска
COMMENT ON COLUMN DM.FAIR_VALUE.currency_letter_cd is 'Валюта типа ставки';
COMMENT ON COLUMN DM.FAIR_VALUE.fixfloat is 'Признак фиксированной плавающей ставки';
-- Параметры запуска расчета
COMMENT ON COLUMN DM.FAIR_VALUE.SNAPSHOT_DT is 'Дата расчета (на какую дату запускается расчет)';
COMMENT ON COLUMN DM.FAIR_VALUE.CLIENT_NAME is 'Лизингополучатель';
COMMENT ON COLUMN DM.FAIR_VALUE.TERM_AMT is 'Срок сделки';
COMMENT ON COLUMN DM.FAIR_VALUE.TOTAL_SUM is 'Сумма сделки';
COMMENT ON COLUMN DM.FAIR_VALUE.RATING_MODEL_KEY is 'Ключ рейтинговой модели';
COMMENT ON COLUMN DM.FAIR_VALUE.RATING_NAM is 'Рейтинг';
COMMENT ON COLUMN DM.FAIR_VALUE.LEASING_SUBJECT_TYPE_CD is 'Типа лизингового имущества';
COMMENT ON COLUMN DM.FAIR_VALUE.CURRATE_TYPE_KEY is 'Ключ типа ставки';
COMMENT ON COLUMN DM.FAIR_VALUE.CONTRACTS_TERMS_KEY is 'Ключ условий контракта';
COMMENT ON COLUMN DM.FAIR_VALUE.FTP_CALCULATION_METHOD_KEY is 'Ключи Методики расчета ставки FTP';
COMMENT ON COLUMN DM.FAIR_VALUE.EARLY_SPREAD_TYPE_KEY is 'Ключ вида спреда на досрочное погашение';
COMMENT ON COLUMN DM.FAIR_VALUE.MORATORY_TERM_AMT is 'Срок моратория';
COMMENT ON COLUMN DM.FAIR_VALUE.FIX_PERIOD_AMT is 'Период фиксации';
COMMENT ON COLUMN DM.FAIR_VALUE.USE_PERIOD_AMT is 'Период использования';
COMMENT ON COLUMN DM.FAIR_VALUE.IND_CNCL_TERM_AMT is 'Срок отмены тестирования';
COMMENT ON COLUMN DM.FAIR_VALUE.BALANCE_DEBT_AMT is 'Балансовая величина задолженности, руб.';
COMMENT ON COLUMN DM.FAIR_VALUE.MARKET_VALUE_AMT is 'Рыночная стоимость имущества';
COMMENT ON COLUMN DM.FAIR_VALUE.PROCEED_AMT is 'Выручка, млн. RUB без НДС за последний календарный год';
--Расчетные информационные поля
COMMENT ON COLUMN DM.FAIR_VALUE.BARRIER is 'Порог пересмотра ставки';
COMMENT ON COLUMN DM.FAIR_VALUE."COMMENT" is 'Текст комментария к расчету';
--Результаты расчета
COMMENT ON COLUMN DM.FAIR_VALUE.FTP_V is 'Кривая FTP (Трансфертная ставка)';
COMMENT ON COLUMN DM.FAIR_VALUE.PKR_V is 'Премия за кредитный риск';
COMMENT ON COLUMN DM.FAIR_VALUE.PEC_V is 'Плата за экономический капитал';
COMMENT ON COLUMN DM.FAIR_VALUE.DIRECT_COSTS_V is 'Прямые расходы Банка';
COMMENT ON COLUMN DM.FAIR_VALUE.MAINTENENCE_COSTS_V is 'АХР ВТБЛ';
COMMENT ON COLUMN DM.FAIR_VALUE.EARLY_SPREAD_V is 'Спред за досрочное погашение';
COMMENT ON COLUMN DM.FAIR_VALUE.REVENUE_COMISSION_V is 'Комиссия за обязательство';
COMMENT ON COLUMN DM.FAIR_VALUE.FIX_SPREAD_V is 'Спред за фиксацию ставки';
COMMENT ON COLUMN DM.FAIR_VALUE.CNCL_SPREAD_V is 'Спред за отсутствие/отмену индикаторов';
COMMENT ON COLUMN DM.FAIR_VALUE.FULL_CNCL_SPREAD_V is 'Спред за отсутствие/полную отмену индикаторов';
COMMENT ON COLUMN DM.FAIR_VALUE.TERM_CNCL_SPREAD_V is 'Спред за отмену индикаторов на неполный срок';
COMMENT ON COLUMN DM.FAIR_VALUE.ONE_CNCL_SPREAD_V is 'Спреды за отмену одного индикатора';

ALTER TABLE DM.FAIR_VALUE ADD Market_currency_letter_cd varchar2(100);
ALTER TABLE DM.FAIR_VALUE ADD Proceed_currency_letter_cd varchar2(100);
ALTER TABLE DM.FAIR_VALUE ADD Contract_Exchange_rate number;
ALTER TABLE DM.FAIR_VALUE ADD market_Exchange_rate number;
ALTER TABLE DM.FAIR_VALUE ADD proceed_Exchange_rate number;
ALTER TABLE DM.FAIR_VALUE ADD Contract_Exchange_rate_dt date;
ALTER TABLE DM.FAIR_VALUE ADD market_Exchange_rate_dt date;
ALTER TABLE DM.FAIR_VALUE ADD proceed_Exchange_rate_dt date;

COMMENT ON COLUMN DM.FAIR_VALUE.Market_currency_letter_cd is 'Валюта рыночной стоимости';
COMMENT ON COLUMN DM.FAIR_VALUE.Proceed_currency_letter_cd is 'Валюта выручки';

COMMENT ON COLUMN DM.FAIR_VALUE.Contract_Exchange_rate is 'Курс валюты договора (если рубль, то 1)';
COMMENT ON COLUMN DM.FAIR_VALUE.market_Exchange_rate is 'Курс валюты рыночной стоимости (если рубль, то 1)';
COMMENT ON COLUMN DM.FAIR_VALUE.proceed_Exchange_rate is 'Курс валюты выручки (если рубль, то 1)';

COMMENT ON COLUMN DM.FAIR_VALUE.Contract_Exchange_rate_dt is 'Дата Курса валюты договора (если рубль, то null)';
COMMENT ON COLUMN DM.FAIR_VALUE.market_Exchange_rate_dt is 'Дата Курса валюты рыночной стоимости (если рубль, то null)';
COMMENT ON COLUMN DM.FAIR_VALUE.proceed_Exchange_rate_dt is 'Дата Курса валюты выручки (если рубль, то null)';
