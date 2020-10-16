drop sequence DM.FAIR_VALUE_SEQ;

begin
  for r in (select table_name from all_tables where (owner = 'DM' and table_name in ('FV_COMISSIONS', 'FAIR_VALUE'))
                                                 or (owner = 'DWH' and table_name in ('SHCEDULES_FOR_FV',
                                                                                      'CURRATE_TYPES',
                                                                                      'CURRATES',
                                                                                      'DIRECT_COST_RATES',
                                                                                      'EARLY_SPREAD_TYPES',
                                                                                      'FTP_CALCULATION_METHODS',
                                                                                      'FV_MAX_TERM',
                                                                                      'MAINTENENCE_COST_RATES',
                                                                                      'PD_CORP_EC',
                                                                                      'ROE',
                                                                                      'SHCEDULES_FOR_FV',
                                                                                      'FV_CONTRACTS_TERMS'))  
  ) loop
    execute immediate 'drop table '||r.owner||'.'||table_name;
  end loop;
end;
/
