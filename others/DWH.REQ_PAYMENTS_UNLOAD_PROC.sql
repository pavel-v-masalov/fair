create table DWH.REQ_PAYMENTS_UNLOAD_PROC
(
  row_number          NUMBER,
  branch_nam          VARCHAR2(1000),
  selection_method    VARCHAR2(1000),
  contract_id_cd      VARCHAR2(1000),
  contract_num        VARCHAR2(1000),
  contract_num_full   VARCHAR2(1000),
  client_id           VARCHAR2(1000),
  short_client_ru_nam VARCHAR2(1000)
);
