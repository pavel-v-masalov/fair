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
