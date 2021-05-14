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
    is '������� �������� (��������� �������+���������)';
-- Add comments to the columns
comment on column DM.FAIR_VALUE.calculation_id
    is 'ID �������';
comment on column DM.FAIR_VALUE.report_dt
    is '���� ������� �������';
comment on column DM.FAIR_VALUE.currency_letter_cd
    is '������ ���� ������';
comment on column DM.FAIR_VALUE.fixfloat
    is '������� ������������� ��������� ������';
comment on column DM.FAIR_VALUE.snapshot_dt
    is '���� ������� (�� ����� ���� ����������� ������)';
comment on column DM.FAIR_VALUE.client_name
    is '�����������������';
comment on column DM.FAIR_VALUE.term_amt
    is '���� ������';
comment on column DM.FAIR_VALUE.rating_model_key
    is '���� ����������� ������';
comment on column DM.FAIR_VALUE.rating_nam
    is '�������';
comment on column DM.FAIR_VALUE.leasing_subject_type_cd
    is '���� ����������� ���������';
comment on column DM.FAIR_VALUE.currate_type_key
    is '���� ���� ������';
comment on column DM.FAIR_VALUE.contracts_terms_key
    is '���� ������� ���������';
comment on column DM.FAIR_VALUE.ftp_calculation_method_key
    is '����� �������� ������� ������ FTP';
comment on column DM.FAIR_VALUE.early_spread_type_key
    is '���� ���� ������ �� ��������� ���������';
comment on column DM.FAIR_VALUE.moratory_term_amt
    is '���� ���������';
comment on column DM.FAIR_VALUE.fix_period_amt
    is '������ ��������';
comment on column DM.FAIR_VALUE.use_period_amt
    is '������ �������������';
comment on column DM.FAIR_VALUE.ind_cncl_term_amt
    is '���� ������ ������������';
comment on column DM.FAIR_VALUE.balance_debt_amt
    is '���������� �������� �������������, ���.';
comment on column DM.FAIR_VALUE.market_value_amt
    is '�������� ��������� ���������';
comment on column DM.FAIR_VALUE.proceed_amt
    is '�������, ���. RUB ��� ��� �� ��������� ����������� ���';
comment on column DM.FAIR_VALUE.barrier
    is '����� ���������� ������';
comment on column DM.FAIR_VALUE."COMMENT"
    is '����� ����������� � �������';
comment on column DM.FAIR_VALUE.ftp_v
    is '������ FTP (������������ ������)';
comment on column DM.FAIR_VALUE.pkr_v
    is '������ �� ��������� ����';
comment on column DM.FAIR_VALUE.pec_v
    is '����� �� ������������� �������';
comment on column DM.FAIR_VALUE.direct_costs_v
    is '������ ������� �����';
comment on column DM.FAIR_VALUE.maintenence_costs_v
    is '��� ����';
comment on column DM.FAIR_VALUE.early_spread_v
    is '����� �� ��������� ���������';
comment on column DM.FAIR_VALUE.revenue_comission_v
    is '�������� �� �������������';
comment on column DM.FAIR_VALUE.fix_spread_v
    is '����� �� �������� ������';
comment on column DM.FAIR_VALUE.cncl_spread_v
    is '����� �� ����������/������ �����������';
comment on column DM.FAIR_VALUE.full_cncl_spread_v
    is '����� �� ����������/������ ������ �����������';
comment on column DM.FAIR_VALUE.term_cncl_spread_v
    is '����� �� ������ ����������� �� �������� ����';
comment on column DM.FAIR_VALUE.one_cncl_spread_v
    is '������ �� ������ ������ ����������';
comment on column DM.FAIR_VALUE.other_spread
    is '������ ������';
comment on column DM.FAIR_VALUE.other_spread_comment
    is '����������� � ������ �������';
comment on column DM.FAIR_VALUE.msfo_balance_debt_amt
    is '������������� �� ������� ����';
comment on column DM.FAIR_VALUE.comission_amt
    is '�������� �� ����������� ������';
comment on column DM.FAIR_VALUE.fv_msfo_v
    is '������������ ������ ����';
comment on column DM.FAIR_VALUE.market_currency_letter_cd
    is '������ �������� ���������';
comment on column DM.FAIR_VALUE.proceed_currency_letter_cd
    is '������ �������';
comment on column DM.FAIR_VALUE.contract_exchange_rate
    is '���� ������ �������� (���� �����, �� 1)';
comment on column DM.FAIR_VALUE.market_exchange_rate
    is '���� ������ �������� ��������� (���� �����, �� 1)';
comment on column DM.FAIR_VALUE.proceed_exchange_rate
    is '���� ������ ������� (���� �����, �� 1)';
comment on column DM.FAIR_VALUE.contract_exchange_rate_dt
    is '���� ����� ������ �������� (���� �����, �� null)';
comment on column DM.FAIR_VALUE.market_exchange_rate_dt
    is '���� ����� ������ �������� ��������� (���� �����, �� null)';
comment on column DM.FAIR_VALUE.proceed_exchange_rate_dt
    is '���� ����� ������ ������� (���� �����, �� null)';

alter table DM.FAIR_VALUE
    add primary key (CALCULATION_ID)
        using index;

