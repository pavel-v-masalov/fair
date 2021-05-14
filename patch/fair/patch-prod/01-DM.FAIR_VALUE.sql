create sequence DM.FAIR_VALUE_SEQ;
create table DM.FAIR_VALUE (
  CALCULATION_ID	NUMBER	not null primary key,
  REPORT_DT	DATE,
  -- �������������� ������������ ���������� �������
  currency_letter_cd varchar2(100), -- ������ ���� ������
  fixfloat varchar2(100), -- ������� ������������� ��������� ������
  -- ��������� ������� �������
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
  -- ��������� �������������� ����
  BARRIER NUMBER,
  "COMMENT" VARCHAR2(200),
  -- ���������� �������
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
COMMENT ON table DM.FAIR_VALUE IS '������� �������� (��������� �������+���������)';
COMMENT ON COLUMN DM.FAIR_VALUE.CALCULATION_ID is 'ID �������';
COMMENT ON COLUMN DM.FAIR_VALUE.REPORT_DT is '���� ������� �������';
-- �������������� ������������ ���������� �������
COMMENT ON COLUMN DM.FAIR_VALUE.currency_letter_cd is '������ ���� ������';
COMMENT ON COLUMN DM.FAIR_VALUE.fixfloat is '������� ������������� ��������� ������';
-- ��������� ������� �������
COMMENT ON COLUMN DM.FAIR_VALUE.SNAPSHOT_DT is '���� ������� (�� ����� ���� ����������� ������)';
COMMENT ON COLUMN DM.FAIR_VALUE.CLIENT_NAME is '�����������������';
COMMENT ON COLUMN DM.FAIR_VALUE.TERM_AMT is '���� ������';
COMMENT ON COLUMN DM.FAIR_VALUE.TOTAL_SUM is '����� ������';
COMMENT ON COLUMN DM.FAIR_VALUE.RATING_MODEL_KEY is '���� ����������� ������';
COMMENT ON COLUMN DM.FAIR_VALUE.RATING_NAM is '�������';
COMMENT ON COLUMN DM.FAIR_VALUE.LEASING_SUBJECT_TYPE_CD is '���� ����������� ���������';
COMMENT ON COLUMN DM.FAIR_VALUE.CURRATE_TYPE_KEY is '���� ���� ������';
COMMENT ON COLUMN DM.FAIR_VALUE.CONTRACTS_TERMS_KEY is '���� ������� ���������';
COMMENT ON COLUMN DM.FAIR_VALUE.FTP_CALCULATION_METHOD_KEY is '����� �������� ������� ������ FTP';
COMMENT ON COLUMN DM.FAIR_VALUE.EARLY_SPREAD_TYPE_KEY is '���� ���� ������ �� ��������� ���������';
COMMENT ON COLUMN DM.FAIR_VALUE.MORATORY_TERM_AMT is '���� ���������';
COMMENT ON COLUMN DM.FAIR_VALUE.FIX_PERIOD_AMT is '������ ��������';
COMMENT ON COLUMN DM.FAIR_VALUE.USE_PERIOD_AMT is '������ �������������';
COMMENT ON COLUMN DM.FAIR_VALUE.IND_CNCL_TERM_AMT is '���� ������ ������������';
COMMENT ON COLUMN DM.FAIR_VALUE.BALANCE_DEBT_AMT is '���������� �������� �������������, ���.';
COMMENT ON COLUMN DM.FAIR_VALUE.MARKET_VALUE_AMT is '�������� ��������� ���������';
COMMENT ON COLUMN DM.FAIR_VALUE.PROCEED_AMT is '�������, ���. RUB ��� ��� �� ��������� ����������� ���';
--��������� �������������� ����
COMMENT ON COLUMN DM.FAIR_VALUE.BARRIER is '����� ���������� ������';
COMMENT ON COLUMN DM.FAIR_VALUE."COMMENT" is '����� ����������� � �������';
--���������� �������
COMMENT ON COLUMN DM.FAIR_VALUE.FTP_V is '������ FTP (������������ ������)';
COMMENT ON COLUMN DM.FAIR_VALUE.PKR_V is '������ �� ��������� ����';
COMMENT ON COLUMN DM.FAIR_VALUE.PEC_V is '����� �� ������������� �������';
COMMENT ON COLUMN DM.FAIR_VALUE.DIRECT_COSTS_V is '������ ������� �����';
COMMENT ON COLUMN DM.FAIR_VALUE.MAINTENENCE_COSTS_V is '��� ����';
COMMENT ON COLUMN DM.FAIR_VALUE.EARLY_SPREAD_V is '����� �� ��������� ���������';
COMMENT ON COLUMN DM.FAIR_VALUE.REVENUE_COMISSION_V is '�������� �� �������������';
COMMENT ON COLUMN DM.FAIR_VALUE.FIX_SPREAD_V is '����� �� �������� ������';
COMMENT ON COLUMN DM.FAIR_VALUE.CNCL_SPREAD_V is '����� �� ����������/������ �����������';
COMMENT ON COLUMN DM.FAIR_VALUE.FULL_CNCL_SPREAD_V is '����� �� ����������/������ ������ �����������';
COMMENT ON COLUMN DM.FAIR_VALUE.TERM_CNCL_SPREAD_V is '����� �� ������ ����������� �� �������� ����';
COMMENT ON COLUMN DM.FAIR_VALUE.ONE_CNCL_SPREAD_V is '������ �� ������ ������ ����������';

ALTER TABLE DM.FAIR_VALUE ADD Market_currency_letter_cd varchar2(100);
ALTER TABLE DM.FAIR_VALUE ADD Proceed_currency_letter_cd varchar2(100);
ALTER TABLE DM.FAIR_VALUE ADD Contract_Exchange_rate number;
ALTER TABLE DM.FAIR_VALUE ADD market_Exchange_rate number;
ALTER TABLE DM.FAIR_VALUE ADD proceed_Exchange_rate number;
ALTER TABLE DM.FAIR_VALUE ADD Contract_Exchange_rate_dt date;
ALTER TABLE DM.FAIR_VALUE ADD market_Exchange_rate_dt date;
ALTER TABLE DM.FAIR_VALUE ADD proceed_Exchange_rate_dt date;

COMMENT ON COLUMN DM.FAIR_VALUE.Market_currency_letter_cd is '������ �������� ���������';
COMMENT ON COLUMN DM.FAIR_VALUE.Proceed_currency_letter_cd is '������ �������';

COMMENT ON COLUMN DM.FAIR_VALUE.Contract_Exchange_rate is '���� ������ �������� (���� �����, �� 1)';
COMMENT ON COLUMN DM.FAIR_VALUE.market_Exchange_rate is '���� ������ �������� ��������� (���� �����, �� 1)';
COMMENT ON COLUMN DM.FAIR_VALUE.proceed_Exchange_rate is '���� ������ ������� (���� �����, �� 1)';

COMMENT ON COLUMN DM.FAIR_VALUE.Contract_Exchange_rate_dt is '���� ����� ������ �������� (���� �����, �� null)';
COMMENT ON COLUMN DM.FAIR_VALUE.market_Exchange_rate_dt is '���� ����� ������ �������� ��������� (���� �����, �� null)';
COMMENT ON COLUMN DM.FAIR_VALUE.proceed_Exchange_rate_dt is '���� ����� ������ ������� (���� �����, �� null)';
