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
����	�������� ����
TREASURY_SPREAD_TYPE	��� ������
CURRENCY_LETTER_CD	������
FIXFLOAT	��� ������ ������
FEDERAL_LOW_TYPE_KEY	���� �������� � ������ (��)
INTERVAL1_DAYS_FROM	������ ��������� ��� ����� 1
INTERVAL1_DAYS_TO	����� ��������� ��� ����� 1
INTERVAL2_DAYS_FROM	������ ��������� ��� ����� 2
INTERVAL2_DAY_TO	����� ��������� ��� ����� 2
VALUE	��������
START_DT	���� ������ �������� ������ (����������������)
END_DT	���� ��������� �������� ������ (����������������)
VALID_FROM_DTTM	���� ������ �������� ������ (�����������)
VALID_TO_DTTM	���� ��������� �������� ������ (�����������)
*/