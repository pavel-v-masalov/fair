begin
    execute immediate 'drop table DWH.CURRATE_TYPES';
exception when others then
    null; -- no error
end;
/

create table DWH.CURRATE_TYPES
(
    currate_type_key    NUMBER not null,
    currency_key        NUMBER,
    currency_letter_cd  VARCHAR2(3),
    fixfloat            VARCHAR2(5),
    fixfloat_cd         VARCHAR2(100),
    contracts_terms_key NUMBER
);

comment on table DWH.CURRATE_TYPES
    is '���������� ����� ������';
comment on column DWH.CURRATE_TYPES.currate_type_key
    is '���� ���� ������';
comment on column DWH.CURRATE_TYPES.currency_letter_cd
    is '�������� ������';
comment on column DWH.CURRATE_TYPES.fixfloat
    is '������� ������������� ��������� ������';

alter table DWH.CURRATE_TYPES
    add primary key (CURRATE_TYPE_KEY)
        using index;
