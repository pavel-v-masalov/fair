create table DWH.REQ_PAYMENTS_UNLOAD
(
  snapshot_dt         DATE,
  row_number          NUMBER,
  branch_nam          VARCHAR2(1000),
  selection_method    VARCHAR2(1000),
  contract_id_cd      VARCHAR2(100 CHAR),
  contract_num        VARCHAR2(1000),
  contract_num_full   VARCHAR2(1000),
  client_id           VARCHAR2(100 CHAR),
  short_client_ru_nam VARCHAR2(100 CHAR),
  contract_key        NUMBER,
  client_key          NUMBER
);