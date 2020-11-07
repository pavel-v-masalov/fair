select t.*, rowid from DWH.DIRECT_COST_RATES t;


select t.*, rowid from DWH.ROE t;


select t.*, rowid from DWH.MAINTENENCE_COST_RATES t;



            select *
            from DWH.CURRATES
            where DENJ <= sysdate
              and RATEPERIOD > 720
              and RATENAME = 'arsfix'
              and CURR = 'RUB'
              and VALID_TO_DTTM = date '2400-01-01' and date '2020-06-03' between START_DT and END_DT
            order by denj desc, RATEPERIOD asc;


select *
    from DWH.REF_LGD
   where /*LEASING_SUBJECT_TYPE_CD = p_fair_value.leasing_subject_type_cd 
     and*/ LGD_TYPE_CD = 'RES'
     and VALID_TO_DTTM = date '2400-01-01' and date '2020-06-03' between BEGIN_DT and END_DT;
     
     
select *
  from DWH.PD_CORP
 where RANK_MODEL_KEY = 3
   and RAT_ON_DATE = 'A1'
   and VALID_TO_DTTM = date '2400-01-01' and date '2020-06-03' between ST_DATE and END_DATE;
     
