-- Create table
create table DWH.NEW_HUMANDOCS
(
    new_humandocsid     VARCHAR2(36),
    new_birthday        DATE,
    new_birthplace      VARCHAR2(1000),
    new_code            VARCHAR2(1000),
    new_contact         VARCHAR2(36),
    new_contactname     VARCHAR2(1000),
    new_docnumber       VARCHAR2(1000),
    new_doctype         NUMBER,
    new_doctypename     VARCHAR2(1000),
    new_seria           VARCHAR2(1000),
    new_startdate       DATE,
    new_whengive        DATE,
    new_whogive         VARCHAR2(2000),
    vtbl_address2_line1 VARCHAR2(4000),
    timeslotstart       DATE,
    timeslotend         DATE,
    sessionkey          NUMBER,
    valid_from_dttm     DATE,
    valid_to_dttm       DATE not null,
    dml_type            VARCHAR2(1),
    dml_time            TIMESTAMP(6),
    sessionname         VARCHAR2(100)
);
-- Add comments to the columns
comment on column DWH.NEW_HUMANDOCS.new_humandocsid
  is 'Первичный ключ';
comment on column DWH.NEW_HUMANDOCS.new_birthday
  is 'Дата рождения';
comment on column DWH.NEW_HUMANDOCS.new_birthplace
  is 'Место рождения';
comment on column DWH.NEW_HUMANDOCS.new_code
  is 'Код подразделения';
comment on column DWH.NEW_HUMANDOCS.new_contact
  is 'Контактное лицо';
comment on column DWH.NEW_HUMANDOCS.new_docnumber
  is 'Номер';
comment on column DWH.NEW_HUMANDOCS.new_doctype
  is 'Тип документа';
comment on column DWH.NEW_HUMANDOCS.new_seria
  is 'Серия';
comment on column DWH.NEW_HUMANDOCS.new_startdate
  is 'Действует с';
comment on column DWH.NEW_HUMANDOCS.new_whengive
  is 'Когда выдан';
comment on column DWH.NEW_HUMANDOCS.new_whogive
  is 'Кем выдан';
comment on column DWH.NEW_HUMANDOCS.vtbl_address2_line1
  is 'vtbl_address2_line1';
comment on column DWH.NEW_HUMANDOCS.timeslotstart
  is 'Время начала TimeSlot-а ';
comment on column DWH.NEW_HUMANDOCS.timeslotend
  is 'Время конца TimeSlot-а ';
comment on column DWH.NEW_HUMANDOCS.sessionkey
  is 'Ключ сессии ';
-- Create/Recreate indexes
create unique index DWH.U_NEW_HUMANDOCS on DWH.NEW_HUMANDOCS (NEW_HUMANDOCSID, VALID_TO_DTTM, TIMESLOTSTART);
