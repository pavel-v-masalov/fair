-- Create table
create table DWH.TASKNEW
(
    activityid                   VARCHAR2(36),
    actualend                    DATE,
    actualstart                  DATE,
    createdon                    DATE,
    description                  VARCHAR2(4000),
    modifiedon                   DATE,
    new_agreement                NUMBER,
    new_agreementname            VARCHAR2(1000),
    new_approvalresult           NUMBER,
    new_approvalresultname       VARCHAR2(1000),
    new_comments                 VARCHAR2(4000),
    new_counter_controltime      NUMBER,
    new_counter_fulltime         NUMBER,
    new_counter_scheduledtime    NUMBER,
    new_counter_worktime         NUMBER,
    new_decision_date            DATE,
    new_history                  VARCHAR2(4000),
    new_maintask                 VARCHAR2(36),
    new_maintaskname             VARCHAR2(1000),
    new_preliminarycheck_uob     NUMBER,
    new_preliminarycheck_uobname VARCHAR2(1000),
    new_recommendations          NUMBER,
    new_recommendationstext      VARCHAR2(4000),
    new_status                   NUMBER,
    new_statusname               VARCHAR2(1000),
    new_type                     NUMBER,
    new_typename                 VARCHAR2(1000),
    new_uzdl                     NUMBER,
    new_withdeparture            NUMBER,
    new_withdeparturename        VARCHAR2(1000),
    ownerid                      VARCHAR2(36),
    owningteam                   VARCHAR2(36),
    owninguser                   VARCHAR2(36),
    regardingobjectid            VARCHAR2(36),
    regardingobjecttypecode      NUMBER,
    statecode                    NUMBER,
    statecodename                VARCHAR2(1000),
    subject                      VARCHAR2(1000),
    deletion_flag                NUMBER,
    valid_from                   DATE,
    sessionkey                   NUMBER,
    valid_from_dttm              DATE,
    valid_to_dttm                DATE not null,
    dml_type                     VARCHAR2(1),
    dml_time                     DATE,
    owningteamname               VARCHAR2(1000),
    owningusername               VARCHAR2(1000),
    regardingobjecttypecodename  VARCHAR2(1000)
);
-- Add comments to the columns
comment on column DWH.TASKNEW.activityid
  is ' ������ ';
comment on column DWH.TASKNEW.actualend
  is ' ����������� ��������� ';
comment on column DWH.TASKNEW.actualstart
  is ' ����������� ������ ';
comment on column DWH.TASKNEW.createdon
  is ' ���� �������� ';
comment on column DWH.TASKNEW.description
  is ' �������� ';
comment on column DWH.TASKNEW.modifiedon
  is ' ���� ��������� ';
comment on column DWH.TASKNEW.new_agreement
  is ' ��������� ������������ ';
comment on column DWH.TASKNEW.new_agreementname
  is ' NULL ';
comment on column DWH.TASKNEW.new_approvalresult
  is ' ������� ';
comment on column DWH.TASKNEW.new_approvalresultname
  is ' NULL ';
comment on column DWH.TASKNEW.new_comments
  is ' ��������� ���������� ������ ';
comment on column DWH.TASKNEW.new_counter_controltime
  is ' ����������� ����� (���.) ';
comment on column DWH.TASKNEW.new_counter_fulltime
  is ' ������ ����� (���.) ';
comment on column DWH.TASKNEW.new_counter_scheduledtime
  is ' ����������� ����� (���.) ';
comment on column DWH.TASKNEW.new_counter_worktime
  is ' ����� ������ � ������� (���.) ';
comment on column DWH.TASKNEW.new_decision_date
  is ' ���� ������� ';
comment on column DWH.TASKNEW.new_history
  is ' ������� ���������� ������ ';
comment on column DWH.TASKNEW.new_maintask
  is ' �������� ������ ';
comment on column DWH.TASKNEW.new_maintaskname
  is ' NULL ';
comment on column DWH.TASKNEW.new_preliminarycheck_uob
  is ' ��������������� �������� ��� ��� ';
comment on column DWH.TASKNEW.new_preliminarycheck_uobname
  is ' NULL ';
comment on column DWH.TASKNEW.new_recommendations
  is ' ������������ ';
comment on column DWH.TASKNEW.new_recommendationstext
  is ' ������������ (�����) ';
comment on column DWH.TASKNEW.new_status
  is ' ������ ';
comment on column DWH.TASKNEW.new_statusname
  is ' NULL ';
comment on column DWH.TASKNEW.new_type
  is ' ��� ������ ';
comment on column DWH.TASKNEW.new_typename
  is ' NULL ';
comment on column DWH.TASKNEW.new_uzdl
  is ' ������ � ������ ���� ';
comment on column DWH.TASKNEW.new_withdeparture
  is ' � ������� ';
comment on column DWH.TASKNEW.new_withdeparturename
  is ' NULL ';
comment on column DWH.TASKNEW.ownerid
  is ' ������������� ';
comment on column DWH.TASKNEW.owningteam
  is ' ������������� ������� ������ ';
comment on column DWH.TASKNEW.owninguser
  is ' ������������� ������������ ';
comment on column DWH.TASKNEW.regardingobjectid
  is ' � ��������� ';
comment on column DWH.TASKNEW.regardingobjecttypecode
  is ' � ��������� (��� �������) ';
comment on column DWH.TASKNEW.statecode
  is ' ��������� �������� ';
comment on column DWH.TASKNEW.statecodename
  is ' NULL ';
comment on column DWH.TASKNEW.subject
  is ' ���� ';
comment on column DWH.TASKNEW.deletion_flag
  is ' ���� �������� ';
comment on column DWH.TASKNEW.valid_from
  is ' ������ ������� �� ';
comment on column DWH.TASKNEW.regardingobjecttypecodename
  is '� ��������� (�������� ���� �������)';
