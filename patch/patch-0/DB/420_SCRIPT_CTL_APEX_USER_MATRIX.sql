update etl.CTL_APEX_USER_MATRIX m
set m.DM_FAIR_VALUE_flg = case when m.apex_user_group in ('DEVELOPERS','ADMINISTRATORS')
                          then 1
                          when m.apex_user in ('ESELYUKOV','VOSIPENKOV','MALEKSANDROVA','DEGOROV')
                          then 1    
                          else 0
                     end
where 10=10;
commit;
