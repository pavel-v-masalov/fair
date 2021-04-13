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
select r.COUNTEDON, l.rn
,t45.rn, t45.rn_m, t09.rn, t09.rn_m
from DWH.LEASROUTING_RMD_TMP r
full outer join l on 1=1
left outer join DWH.LEASROUT_TASKNEW_100000045_TMP t45 on r.opportunityid = t45.opportunityid and r.COUNTEDON = t45.countedon and t45.rn = l.rn and t45.rn <= t45.rn_m
left outer join DWH.LEASROUT_TASKNEW_10009_TMP t09 on r.opportunityid = t09.opportunityid and r.COUNTEDON = t09.countedon and t09.rn = l.rn and t09.rn <= t09.rn_m
where r.opportunityid = 'AD44822B-9189-EA11-80FC-02BF0A010246'
--where r.opportunityid = '85EED2C0-631A-E911-80F3-02BF0A010246'
--where r.opportunityid = 'AABC7A2C-F319-EB11-8105-02BF0A010246'
--where r.opportunityid = 'AA2F70C4-AEF1-EA11-80FE-02BF0A010246'
and l.rn <= nvl(greatest(t45.rn_m, t09.rn_m), 1)
order by r.COUNTEDON
