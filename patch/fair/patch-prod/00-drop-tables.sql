begin
    for r in (select * from all_sequences where sequence_owner = 'DM' and sequence_name = 'FAIR_VALUE_SEQ') loop
        execute immediate 'drop sequence DM.FAIR_VALUE_SEQ';
    end loop;
end;
/
begin
  for r in (select table_name, owner from all_tables 
                                             where owner = 'DM' and table_name in ('FV_COMISSIONS', 'FAIR_VALUE')
                                                 or owner = 'DWH' and table_name in ('SHCEDULES_FOR_FV',
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
                                                                                      'SCHEDULES_FV',
                                                                                      'FV_CONTRACTS_TERMS',
                                                                                      'TREASURY_SPREAD'))
  loop
    execute immediate 'drop table '||r.owner||'.'||r.table_name;
  end loop;
end;
/
