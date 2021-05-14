create table DWH.FV_CONTRACTS_TERMS
(
    contracts_terms_key  NUMBER not null,
    contracts_terms_name VARCHAR2(1000),
    description          VARCHAR2(4000)
);

comment on table DWH.FV_CONTRACTS_TERMS
    is 'Справочник условий контрактов (для расчета справедливой ставки)';
comment on column DWH.FV_CONTRACTS_TERMS.contracts_terms_key
    is 'Ключ условий контракта';
comment on column DWH.FV_CONTRACTS_TERMS.contracts_terms_name
    is 'Название условий контракта';
comment on column DWH.FV_CONTRACTS_TERMS.description
    is 'Описание';

alter table DWH.FV_CONTRACTS_TERMS
    add primary key (CONTRACTS_TERMS_KEY)
        using index;
