create table dwh.treasury_spread (
    treasury_spread_type varchar2(1000),
    currency_letter_cd   varchar2(100),
    fixfloat             varchar2(100),
    contracts_terms_key  number,
    interval1_days_from  number,
    interval1_days_to    number,
    interval2_days_from  number,
    interval2_days_to    number,
    value                number,
    start_dt             date,
    end_dt               date,
    valid_from_dttm      date,
    valid_to_dttm        date,
    file_id              number
);
-- Add comments to the table
comment on table dwh.treasury_spread
    is ''�������������� ����� � ��������'';
-- Add comments to the columns
comment on column dwh.treasury_spread.treasury_spread_type
    is ''��� ������'';
comment on column dwh.treasury_spread.currency_letter_cd
    is ''������'';
comment on column dwh.treasury_spread.fixfloat
    is ''��� ������ ������'';
comment on column dwh.treasury_spread.contracts_terms_key
    is ''���� �������� � ������ (��)'';
comment on column dwh.treasury_spread.interval1_days_from
    is ''������ ��������� ��� ����� 1'';
comment on column dwh.treasury_spread.interval1_days_to
    is ''����� ��������� ��� ����� 1'';
comment on column dwh.treasury_spread.interval2_days_from
    is ''������ ��������� ��� ����� 2'';
comment on column dwh.treasury_spread.interval2_days_to
    is ''����� ��������� ��� ����� 2'';
comment on column dwh.treasury_spread.value
    is ''��������'';
comment on column dwh.treasury_spread.start_dt
    is ''���� ������ �������� ������ (����������������)'';
comment on column dwh.treasury_spread.end_dt
    is ''���� ��������� �������� ������ (����������������)'';
comment on column dwh.treasury_spread.valid_from_dttm
    is ''���� ������ �������� ������ (�����������)'';
comment on column dwh.treasury_spread.valid_to_dttm
    is ''���� ��������� �������� ������ (�����������)'';

