--select * from (
select count(1) over (partition by r.opportunityid) c,
(select count(1) from DWH.LEASROUT_TASKNEW_100000045_TMP t where r.opportunityid = t.opportunityid and r.COUNTEDON = t.countedon) t100000045,
(select count(1) from DWH.LEASROUT_TASKNEW_10009_TMP t where r.opportunityid = t.opportunityid and r.COUNTEDON = t.countedon) t10009,
(select count(1) from DWH.LEASROUT_TASKNEW_10009KUF_TMP t where r.opportunityid = t.opportunityid and r.COUNTEDON = t.countedon) t10009KUF,
(select count(1) from DWH.LEASROUT_TASKNEW_10011_TMP t where r.opportunityid = t.opportunityid and r.COUNTEDON = t.countedon) t10011,
(select count(1) from DWH.LEASROUT_TASKNEW_10015_TMP t where r.opportunityid = t.opportunityid and r.COUNTEDON = t.countedon) t10015,
(select count(1) from DWH.LEASROUT_TASKNEW_10016_TMP t where r.opportunityid = t.opportunityid and r.COUNTEDON = t.countedon) t10016,
(select count(1) from DWH.LEASROUT_TASKNEW_10029_TMP t where r.opportunityid = t.opportunityid and r.COUNTEDON = t.countedon) t10029,
(select count(1) from DWH.LEASROUT_TASKNEW_10031_TMP t where r.opportunityid = t.opportunityid and r.COUNTEDON = t.countedon) t10031,
(select count(1) from DWH.LEASROUT_TASKNEW_100032_TMP t where r.opportunityid = t.opportunityid and r.COUNTEDON = t.countedon) t100032,
(select count(1) from DWH.LEASROUT_TASKNEW_100032OD_TMP t where r.opportunityid = t.opportunityid and r.COUNTEDON = t.countedon) t100032OD
,r.* 
from DWH.LEASROUTING_RMD_TMP r
--where r.opportunityid = 'AD44822B-9189-EA11-80FC-02BF0A010246'
where r.opportunityid = 'AAAA03DA-6754-E911-80F3-02BF0A010246'
--where r.opportunityid = 'AABC7A2C-F319-EB11-8105-02BF0A010246'
--where r.opportunityid = 'AA2F70C4-AEF1-EA11-80FE-02BF0A010246'
order by r.opportunityid, r.COUNTEDON
--) where t100000045 >1 or t10009 > 1 or t10009KUF > 1 or t10011 > 1 or t10015 > 1 or t10016 > 1 or t10029 > 1 or t10031 > 1 or t100032 > 1 or t100032OD > 1
--) where t100000045 > 0 and t10009 > 0 and t10009KUF > 0 and t10011 > 0 and t10015 > 0 and t10016 > 0 and t10029 > 0 and t10031 > 0 and t100032 > 0 and t100032OD > 0
--) where t100000045 = 0 and (t10009 > 1 or t10009KUF > 1 or t10011 > 1 or t10015 > 1 or t10016 > 1 or t10029 > 1 or t10031 > 1 or t100032 > 1 or t100032OD > 1)
;

--select * from DWH.LEASROUT_TASKNEW_100000045_TMP where opportunityid = 'AABC7A2C-F319-EB11-8105-02BF0A010246';
--select * from DWH.LEASROUT_TASKNEW_10029_TMP where opportunityid = 'AD44822B-9189-EA11-80FC-02BF0A010246';
