with l as (SELECT LEVEL as rn FROM DUAL CONNECT BY LEVEL <= (select greatest((select nvl(max(rn),0) from DWH.LEASROUT_TASKNEW_100000045_TMP),
                                                              (select nvl(max(rn),0) from DWH.LEASROUT_TASKNEW_10009_TMP),
                                                              (select nvl(max(rn),0) from DWH.LEASROUT_TASKNEW_10009KUF_TMP),
                                                              (select nvl(max(rn),0) from DWH.LEASROUT_TASKNEW_10011_TMP),
                                                              (select nvl(max(rn),0) from DWH.LEASROUT_TASKNEW_10015_TMP),
                                                              (select nvl(max(rn),0) from DWH.LEASROUT_TASKNEW_10016_TMP),
                                                              (select nvl(max(rn),0) from DWH.LEASROUT_TASKNEW_10029_TMP),
                                                              (select nvl(max(rn),0) from DWH.LEASROUT_TASKNEW_10031_TMP),
                                                              (select nvl(max(rn),0) from DWH.LEASROUT_TASKNEW_100032_TMP),
                                                              (select nvl(max(rn),0) from DWH.LEASROUT_TASKNEW_100032OD_TMP)) from dual)
)
select * from (
select r.opportunityid, r.COUNTEDON, l.rn l_rn, greatest(nvl(t45.rn_m,1), nvl(t09.rn_m,1), nvl(t09kuf.rn_m,1), nvl(t15.rn_m,1), nvl(t11.rn_m,1), nvl(t16.rn_m,1), nvl(t29.rn_m,1), nvl(t31.rn_m,1), nvl(t32.rn_m,1), nvl(t32od.rn_m,1)) gr
, '|T45|', t45.rn t45_rn
,'|T09|', t09.rn t09_rn
,'|T09kuf|', t09kuf.rn t09kuf_rn
,'|T15|', t15.rn t15_rn
,'|T11|', t11.rn t11_rn
,'|T16|', t16.rn t16_rn
,'|T29|', t29.rn t29_rn
,'|T31|', t31.rn t31_rn
,'|T32|', t32.rn t32_rn
,'|T32od|', t32od.rn t32od_rn
from DWH.LEASROUTING_RMD_TMP r
full outer join l on 1=1
left outer join DWH.LEASROUT_TASKNEW_100000045_TMP t45   on r.opportunityid = t45.opportunityid and r.COUNTEDON = t45.countedon and t45.rn = l.rn and t45.rn <= t45.rn_m
left outer join DWH.LEASROUT_TASKNEW_10009_TMP t09       on r.opportunityid = t09.opportunityid and r.COUNTEDON = t09.countedon and t09.rn = l.rn and t09.rn <= t09.rn_m
left outer join DWH.LEASROUT_TASKNEW_10009KUF_TMP t09kuf on r.opportunityid = t09kuf.opportunityid and r.COUNTEDON = t09kuf.countedon and t09kuf.rn = l.rn and t09kuf.rn <= t09kuf.rn_m
left outer join DWH.LEASROUT_TASKNEW_10015_TMP t15 on r.opportunityid = t15.opportunityid and r.COUNTEDON = t15.countedon and t15.rn = l.rn and t15.rn <= t15.rn_m
left outer join DWH.LEASROUT_TASKNEW_10011_TMP t11 on r.opportunityid = t11.opportunityid and r.COUNTEDON = t11.countedon and t11.rn = l.rn and t11.rn <= t11.rn_m
left outer join DWH.LEASROUT_TASKNEW_10016_TMP t16 on r.opportunityid = t16.opportunityid and r.COUNTEDON = t16.countedon and t16.rn = l.rn and t16.rn <= t16.rn_m
left outer join DWH.LEASROUT_TASKNEW_10029_TMP t29 on r.opportunityid = t29.opportunityid and r.COUNTEDON = t29.countedon and t29.rn = l.rn and t29.rn <= t29.rn_m
left outer join DWH.LEASROUT_TASKNEW_10031_TMP t31 on r.opportunityid = t31.opportunityid and r.COUNTEDON = t31.countedon and t31.rn = l.rn and t31.rn <= t31.rn_m
left outer join DWH.LEASROUT_TASKNEW_100032_TMP t32 on r.opportunityid = t32.opportunityid and r.COUNTEDON = t32.countedon and t32.rn = l.rn and t32.rn <= t32.rn_m
left outer join DWH.LEASROUT_TASKNEW_100032OD_TMP t32od on r.opportunityid = t32od.opportunityid and r.COUNTEDON = t32od.countedon and t32od.rn = l.rn and t32od.rn <= t32od.rn_m
--where r.opportunityid = 'AD44822B-9189-EA11-80FC-02BF0A010246'
--where r.opportunityid = 'AAAA03DA-6754-E911-80F3-02BF0A010246'
--where r.opportunityid = 'AABC7A2C-F319-EB11-8105-02BF0A010246'
--where r.opportunityid = 'AA2F70C4-AEF1-EA11-80FE-02BF0A010246'
--and l.rn <= greatest(nvl(t45.rn_m,1), nvl(t09.rn_m,1), nvl(t09kuf.rn_m,1), nvl(t15.rn_m,1), nvl(t11.rn_m,1), nvl(t16.rn_m,1), nvl(t29.rn_m,1), nvl(t31.rn_m,1), nvl(t32.rn_m,1), nvl(t32od.rn_m,1))
order by r.opportunityid, r.COUNTEDON, l.rn
) where l_rn <= gr

