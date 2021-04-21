drop table DWH.LEASROUTING_RMD_TMP;

create table DWH.LEASROUTING_RMD_TMP NOLOGGING as
select /*+ PARALLEL(4) */ r.opportunityname, r.opportunityid, r.countedon,
       nvl(lead(r.countedon, 1) over(partition by r.opportunityid order by r.countedon),to_date('2400-01-01', 'yyyy-mm-dd')) countedon2,
    MIN(CREDITMODELISCOUNTABLE) KEEP (DENSE_RANK FIRST ORDER BY CREDITMODELISCOUNTABLE nulls last) CREDITMODELISCOUNTABLE,--����� ���������� ��������� ������
    MIN(FINANCESUM) KEEP (DENSE_RANK FIRST ORDER BY FINANCESUM nulls last) FINANCESUM,--���������� ����� �-�� �� �� � �� � ������ ��� (���������� ������)
    MIN(CREDITMODELRESULT) KEEP (DENSE_RANK FIRST ORDER BY CREDITMODELRESULT nulls last) CREDITMODELRESULT,--������ ���������� ����� (���������� ������)
    MIN(NEW_FINANCESUM) KEEP (DENSE_RANK FIRST ORDER BY NEW_FINANCESUM nulls last) NEW_FINANCESUM,--��� �� ������ ��� ��
    MIN(FRAUDMODELRESULT) KEEP (DENSE_RANK FIRST ORDER BY FRAUDMODELRESULT nulls last) FRAUDMODELRESULT,--������ ���� ����� (���������� ������)
    MIN(OPPORTUNITYCREDITRESULT) KEEP (DENSE_RANK FIRST ORDER BY OPPORTUNITYCREDITRESULT nulls last) OPPORTUNITYCREDITRESULT,--������� ���� ������� �� ������
    MIN(OPPORTUNITYFRAUDRESULT) KEEP (DENSE_RANK FIRST ORDER BY OPPORTUNITYFRAUDRESULT nulls last) OPPORTUNITYFRAUDRESULT,--������� ���� ������� �� ������
    MIN(PRODUCTOP) KEEP (DENSE_RANK FIRST ORDER BY PRODUCTOP nulls last) PRODUCTOP,--������� �� ���������� ������
    MIN(SCORINGSCORE) KEEP (DENSE_RANK FIRST ORDER BY SCORINGSCORE nulls last) SCORINGSCORE,--���� ����
    MIN(MODEL_TYPE) KEEP (DENSE_RANK FIRST ORDER BY MODEL_TYPE nulls last) MODEL_TYPE,--��� ������
    MIN(calc_conditions) KEEP (DENSE_RANK FIRST ORDER BY calc_conditions nulls last) calc_conditions,--������� ��������� � ���������
    MIN(ISPRESCORINGCALL) KEEP (DENSE_RANK FIRST ORDER BY ISPRESCORINGCALL nulls last) ISPRESCORINGCALL,--������ � ������ �����������
    MIN(model_settings) KEEP (DENSE_RANK FIRST ORDER BY model_settings nulls last) model_settings--������ ���������� ������� �� ������ �������
  from DWH.RMD r
 group by r.opportunityname, r.opportunityid, r.countedon;
 
create index DWH.LEASROUTING_RMD_TMP_i01 on DWH.LEASROUTING_RMD_TMP(opportunityid) compress;

begin
    DBMS_STATS.GATHER_TABLE_STATS(ownname => 'DWH', tabname => 'LEASROUTING_RMD_TMP', degree=>4);
end;
/
