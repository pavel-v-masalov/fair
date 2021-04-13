select r.opportunityname, r.opportunityid, r.countedon, count(1)
from DWH.RMD r 
where r.opportunityname = 'AE419250' 
group by r.opportunityname, r.opportunityid, r.countedon
order by r.opportunityid, r.countedon;


--create index DWH.TASKNEW_i01 on DWH.TASKNEW(regardingobjectid) compress;
row_number() over (partition by opportunityid order by timeslotend desc nulls last) rn$;
select * from DWH.TASKNEW t where (t.actualend is null and t.createdon is null) and t.new_status = 100000002;

select row_number() over (partition by opportunityid order by timeslotend desc nulls last) rn$;
select t.* from DWH.TASKNEW t where t.regardingobjectid = 'DC8E1D58-6915-E911-80F3-02BF0A010246'
--and t.new_status = 100000002 and t.statecode = 1
order by nvl(t.actualend, t.createdon)
;

select r.*,
       row_number() over (partition by r.opportunityid order by r.countedon asc) rn,
       t.*
   from DWH.TASKNEW t 
  join (
    select r.opportunityname, r.opportunityid, r.countedon, nvl(lead(r.countedon, 1) over(partition by r.opportunityid order by r.countedon),to_date('2400-01-01', 'yyyy-mm-dd')) countedon2
    from DWH.RMD r 
    --where r.opportunityname = 'ÀË419250' 
    group by r.opportunityname, r.opportunityid, r.countedon
  ) r on r.opportunityid = t.regardingobjectid 
     and ((t.ACTUALEND >= r.COUNTEDON and t.ACTUALEND < r.COUNTEDON2) or (t.CREATEDON >= r.COUNTEDON and t.CREATEDON < r.COUNTEDON2)) 
  where t.new_status = 100000002 and t.statecode = 1 and t.new_type = 100000045
;  


select * from DWH.TASKNEW t where t.new_status = 100000002 and t.statecode = 1 and (t.new_type = 100000015 or t.new_type = 100000026) and t.regardingobjectid = 'AA2F70C4-AEF1-EA11-80FE-02BF0A010246';



