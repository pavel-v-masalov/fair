with t(n) as
 (select dbms_random.normal() from dual connect by level <= 500000)
select cume_dist(0) within group(order by n) as cumul_norm_s_distfrom t;
--CUMUL_NORM_S_DIST

select 
--power(0,2)
DM.PKG_FV_CALC.normal_inv_cumulative_distrib(0.908789) inv
,DM.PKG_FV_CALC.normal_distribution(1.333333) norm
,DM.PKG_FV_CALC.normal_cumulative_distribution(1.333333) cum_norm
from dual;


DM.FAIR_VALUE

create sequence sq_input_file

GRANT ALL PRIVILEGES TO DM;
