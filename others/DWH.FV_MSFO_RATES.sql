create table DWH.FV_MSFO_RATES
(
  comission_rate  NUMBER not null,
  term_year       NUMBER not null,
  fv_msfo_rate    NUMBER not null,
  start_dt        DATE not null,
  end_dt          DATE not null,
  valid_from_dttm DATE not null,
  valid_to_dttm   DATE not null,
  file_id         NUMBER not null
);
