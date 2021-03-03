create table DWH.EXCHANGE_RATES
(
    ex_rate_dt        DATE,
    base_currency_key NUMBER not null,
    valid_from_dttm   DATE,
    valid_to_dttm     DATE,
    currency_key      NUMBER not null,
    exchange_rate     NUMBER,
    process_key       NUMBER,
    file_id           NUMBER
);
