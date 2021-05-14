update etl.CTL_APEX_USER_MATRIX m
set m.DWH_DIRECT_COST_INS_flg = case when m.apex_user_group in ('DEVELOPERS','ADMINISTRATORS')
                          then 1
                          else 0
                     end
where 10=10;
update etl.CTL_APEX_USER_MATRIX m
set m.DWH_MAINTENENCE_COST_INS_flg  = case when m.apex_user_group in ('DEVELOPERS','ADMINISTRATORS')
                          then 1
                          else 0
                     end
where 10=10;
update etl.CTL_APEX_USER_MATRIX m
set m.DWH_ROE_INS_flg = case when m.apex_user_group in ('DEVELOPERS','ADMINISTRATORS')
                          then 1
                          else 0
                     end
where 10=10;
commit;
