create table DWH.TREASURY_SPREAD (
    TREASURY_SPREAD_TYPE VARCHAR2(1000),
    CURRENCY_LETTER_CD VARCHAR2(100),
    FIXFLOAT VARCHAR2(100),
    FEDERAL_LOW_TYPE_KEY NUMBER,
    INTERVAL1_DAYS_FROM NUMBER,
    INTERVAL1_DAYS_TO NUMBER,
    INTERVAL2_DAYS_FROM NUMBER,
    INTERVAL2_DAY_TO NUMBER,
    VALUE NUMBER,
    START_DT DATE,
    END_DT DATE,
    VALID_FROM_DTTM DATE,
    VALID_TO_DTTM DATE
);
/*
Поле	Описание поля
TREASURY_SPREAD_TYPE	Тип спреда
CURRENCY_LETTER_CD	Валюта
FIXFLOAT	Тип ставки ставки
FEDERAL_LOW_TYPE_KEY	Ключ варианта В рамках (ФЗ)
INTERVAL1_DAYS_FROM	Начало интервала для срока 1
INTERVAL1_DAYS_TO	Конец интервала для срока 1
INTERVAL2_DAYS_FROM	Начало интервала для срока 2
INTERVAL2_DAY_TO	Конец интервала для срока 2
VALUE	Значение
START_DT	Дата начала действия записи (пользовательская)
END_DT	Дата окончания действия записи (пользовательская)
VALID_FROM_DTTM	Дата начала действия записи (техническая)
VALID_TO_DTTM	Дата окончания действия записи (техническая)
*/