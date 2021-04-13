--create index DWH.RMD_I01 on DWH.RMD (opportunityname) compress;
-- drop index DWH.RMD
select count(1) from DWH.RMD r ;
select count(1) from (select r.opportunityname, r.countedon from DWH.RMD r group by r.opportunityname, r.countedon having  count(1) > 1);

select r.opportunityname, r.opportunityid, r.countedon, lead(r.countedon, 1) over(partition by r.opportunityid order by r.countedon), count(1)
from DWH.RMD r 
where r.opportunityname = '¿À419250' 
group by r.opportunityname, r.opportunityid, r.countedon order by r.countedon;

select * from DWH.RMD r where r.opportunityname = '¿À419250' order by r.countedon;



row_number() over (partition by opportunityid order by timeslotend desc nulls last) rn$;

select row_number() over (partition by opportunityid order by timeslotstart desc nulls last) rn$, o.* 
from DWH.OPPORTUNITY o where o.opportunityid = 'DC8E1D58-6915-E911-80F3-02BF0A010246'
order by timeslotstart
;


select * from 
(select row_number() over (partition by o.opportunityid, r.countedon order by timeslotstart desc) rn$, 
        timeslotstart, r.countedon, o.opportunityid, o.new_agentid
  from DWH.OPPORTUNITY o 
  join (
    select r.opportunityname, r.opportunityid, r.countedon, count(1) c
    from DWH.RMD r 
    where r.opportunityname = '¿À419250' 
    group by r.opportunityname, r.opportunityid, r.countedon
  ) r on r.opportunityid = o.opportunityid and o.timeslotstart < r.countedon
where not o.timeslotstart is null
) o where rn$ = 1
;
