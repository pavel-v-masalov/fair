-- Create table
create table DWH.OPPORTUNITY
(
    createdon                      DATE,
    customerid                     VARCHAR2(36),
    customeridname                 VARCHAR2(4000),
    modifiedon                     DATE,
    name                           VARCHAR2(2000),
    new_4reliability_group         NUMBER,
    new_4rel_group_opportunity     NUMBER,
    new_4reliability_groupname     VARCHAR2(1000),
    new_additionalconditions       VARCHAR2(4000),
    new_agencycontractid           VARCHAR2(36),
    new_agencycontractidname       VARCHAR2(1000),
    new_agentid                    VARCHAR2(36),
    new_agentidname                VARCHAR2(2000),
    new_allexpretisetasksclosed    NUMBER,
    new_approvalresult             NUMBER,
    new_approvalresultname         VARCHAR2(1000),
    new_approvalroute              NUMBER,
    new_approvalroutename          VARCHAR2(1000),
    new_confirmlitemtomidmvalue    NUMBER,
    new_contractsum                NUMBER,
    new_coremanagerualid           VARCHAR2(36),
    new_coremanagerualidname       VARCHAR2(1000),
    new_creditriskdefaultearlier   NUMBER,
    new_currency                   NUMBER,
    new_document                   NUMBER,
    new_factadress                 NUMBER,
    new_factsum                    NUMBER,
    new_financesum                 NUMBER,
    new_financesum_investrest_gk   NUMBER,
    new_franchise                  NUMBER,
    new_fraudriskdefaultearlier    NUMBER,
    new_headercoremanagerual       VARCHAR2(36),
    new_headercoremanagerualname   VARCHAR2(1000),
    new_headermanagerualid         VARCHAR2(36),
    new_headermanagerualidname     VARCHAR2(1000),
    new_incidentsource             NUMBER,
    new_incidentsourcename         VARCHAR2(1000),
    new_includeagent               NUMBER,
    new_inspectionuakr             NUMBER,
    new_inspectionuakrname         VARCHAR2(1000),
    new_insurancerisk              NUMBER,
    new_leasagreementcondconfirmed NUMBER,
    new_leasedealstopfactors       NUMBER,
    new_leasedealstopfactorsname   VARCHAR2(1000),
    new_leaseobject                NUMBER,
    new_leasesrok                  NUMBER,
    new_middlemanager              VARCHAR2(36),
    new_middlemanagername          VARCHAR2(1000),
    new_nonfinancial               NUMBER,
    new_opf                        NUMBER,
    new_opt                        NUMBER,
    new_order_for_signing          NUMBER,
    new_order_for_signingname      VARCHAR2(1000),
    new_place                      NUMBER,
    new_podproduct                 VARCHAR2(36),
    new_podproductname             VARCHAR2(1000),
    new_productcost                NUMBER,
    new_productid                  VARCHAR2(36),
    new_productidname              VARCHAR2(1000),
    new_propertyrisk               NUMBER,
    new_quantitylo                 NUMBER,
    new_recommendationsdone        NUMBER,
    new_redemptionpayment          NUMBER,
    new_registrationdate           NUMBER,
    new_routingbymodel             NUMBER,
    new_sentforapproval            VARCHAR2(36),
    new_sentforapprovalname        VARCHAR2(1000),
    new_statuscodeid               VARCHAR2(36),
    new_statuscodeidname           VARCHAR2(1000),
    new_stopfactorsagreementerid   VARCHAR2(36),
    new_stopfacagreementeridname   VARCHAR2(1000),
    new_summ                       NUMBER,
    new_supplier                   NUMBER,
    new_suspensiveconditions       VARCHAR2(4000),
    new_taxationsystem             NUMBER,
    new_territory                  VARCHAR2(36),
    new_territoryname              VARCHAR2(1000),
    new_totalfinanceopportunitysum NUMBER,
    new_totalfinancingsum          NUMBER,
    new_totalfinancingsum_express  NUMBER,
    new_totalsumdealperiod         NUMBER,
    new_typelo                     NUMBER,
    new_yearmarga                  NUMBER,
    opportunityid                  VARCHAR2(36),
    originatingleadid              VARCHAR2(36),
    originatingleadidname          VARCHAR2(1000),
    ownerid                        VARCHAR2(36),
    owneridname                    VARCHAR2(1000),
    statuscode                     NUMBER,
    statuscodename                 VARCHAR2(1000),
    timeslotstart                  DATE,
    timeslotend                    DATE,
    sessionkey                     NUMBER,
    valid_from_dttm                DATE,
    valid_to_dttm                  DATE not null,
    dml_type                       VARCHAR2(1),
    dml_time                       DATE,
    sessionname                    VARCHAR2(100)
);
-- Add comments to the columns
comment on column DWH.OPPORTUNITY.createdon
  is ' ���� �������� ';
comment on column DWH.OPPORTUNITY.customerid
  is ' ����������������� ';
comment on column DWH.OPPORTUNITY.customeridname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.modifiedon
  is ' ���� ��������� ';
comment on column DWH.OPPORTUNITY.name
  is ' ����� ���������� ������ (��. CRM) ';
comment on column DWH.OPPORTUNITY.new_4reliability_group
  is ' �������� ������ ���������� ';
comment on column DWH.OPPORTUNITY.new_4rel_group_opportunity
  is ' �������� ������ ���������� �� ������� ������ ';
comment on column DWH.OPPORTUNITY.new_4reliability_groupname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_additionalconditions
  is ' �������������� ������� ';
comment on column DWH.OPPORTUNITY.new_agencycontractid
  is ' ��������� ������� (����������) ';
comment on column DWH.OPPORTUNITY.new_agencycontractidname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_agentid
  is ' ����� (����������) ';
comment on column DWH.OPPORTUNITY.new_agentidname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_allexpretisetasksclosed
  is ' ������� ��� ������ �� ���������� ';
comment on column DWH.OPPORTUNITY.new_approvalresult
  is ' ������� ';
comment on column DWH.OPPORTUNITY.new_approvalresultname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_approvalroute
  is ' ������� ��������� ';
comment on column DWH.OPPORTUNITY.new_approvalroutename
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_confirmlitemtomidmvalue
  is ' ������������ �������������� ��������� ';
comment on column DWH.OPPORTUNITY.new_contractsum
  is ' ����� ����� ����������� �� (� ���). �� �����, ���: ';
comment on column DWH.OPPORTUNITY.new_coremanagerualid
  is ' �������� �������� ������ ';
comment on column DWH.OPPORTUNITY.new_coremanagerualidname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_creditriskdefaultearlier
  is ' ������� ������� ���������� ����� ����� ';
comment on column DWH.OPPORTUNITY.new_currency
  is ' ������ �������� ';
comment on column DWH.OPPORTUNITY.new_document
  is ' ��������� ��� ��������� ';
comment on column DWH.OPPORTUNITY.new_factadress
  is ' ����������� ����� ������� �� ';
comment on column DWH.OPPORTUNITY.new_factsum
  is ' ����� ����� ����������� ������ � ��������������� ';
comment on column DWH.OPPORTUNITY.new_financesum
  is ' ���������� ����� ���-� �� �� (� ���), ��� ';
comment on column DWH.OPPORTUNITY.new_financesum_investrest_gk
  is ' ���������� ����� ���-� �� �� �� � ������ ���. ';
comment on column DWH.OPPORTUNITY.new_franchise
  is ' �������� ';
comment on column DWH.OPPORTUNITY.new_fraudriskdefaultearlier
  is ' ������� ������� ����-����� ����� ';
comment on column DWH.OPPORTUNITY.new_headercoremanagerual
  is ' ������������ ��������� ��������� ������ ';
comment on column DWH.OPPORTUNITY.new_headercoremanagerualname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_headermanagerualid
  is ' ������������ �������� �������������� �� ������� ';
comment on column DWH.OPPORTUNITY.new_headermanagerualidname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_incidentsource
  is ' �������� ��������� ';
comment on column DWH.OPPORTUNITY.new_incidentsourcename
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_includeagent
  is ' �������� � ������ ������ ';
comment on column DWH.OPPORTUNITY.new_inspectionuakr
  is ' �������� ���� ';
comment on column DWH.OPPORTUNITY.new_inspectionuakrname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_insurancerisk
  is ' �������. �� ������ ������� (����) � ������. ������ ';
comment on column DWH.OPPORTUNITY.new_leasagreementcondconfirmed
  is ' ����/�� ���� �������� ';
comment on column DWH.OPPORTUNITY.new_leasedealstopfactors
  is ' �� �� ����-��������� ';
comment on column DWH.OPPORTUNITY.new_leasedealstopfactorsname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_leaseobject
  is ' ��� ������� �� ';
comment on column DWH.OPPORTUNITY.new_leasesrok
  is ' ���� ������� ';
comment on column DWH.OPPORTUNITY.new_middlemanager
  is ' �����-�������� ';
comment on column DWH.OPPORTUNITY.new_middlemanagername
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_nonfinancial
  is ' �������������� ������� � ������������� �� ���� ';
comment on column DWH.OPPORTUNITY.new_opf
  is ' ��� �� ';
comment on column DWH.OPPORTUNITY.new_opt
  is ' �������� ';
comment on column DWH.OPPORTUNITY.new_order_for_signing
  is ' ������� ���������� ';
comment on column DWH.OPPORTUNITY.new_order_for_signingname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_place
  is ' ����� ��������/�������� �� ';
comment on column DWH.OPPORTUNITY.new_podproduct
  is ' ���������� ';
comment on column DWH.OPPORTUNITY.new_podproductname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_productcost
  is ' ��������� �������� ������� �� �������� ';
comment on column DWH.OPPORTUNITY.new_productid
  is ' ������� ';
comment on column DWH.OPPORTUNITY.new_productidname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_propertyrisk
  is ' ������� ������������� ���� ';
comment on column DWH.OPPORTUNITY.new_quantitylo
  is ' ���������� �� � ������ �������� ';
comment on column DWH.OPPORTUNITY.new_recommendationsdone
  is ' ������������ ��������� ';
comment on column DWH.OPPORTUNITY.new_redemptionpayment
  is ' �������� ������ ';
comment on column DWH.OPPORTUNITY.new_registrationdate
  is ' ���� � ���� ����������� �� ';
comment on column DWH.OPPORTUNITY.new_routingbymodel
  is ' ������������� �� ������ ';
comment on column DWH.OPPORTUNITY.new_sentforapproval
  is ' ����������� �� ��������� ';
comment on column DWH.OPPORTUNITY.new_sentforapprovalname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_statuscodeid
  is ' ���� ';
comment on column DWH.OPPORTUNITY.new_statuscodeidname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_stopfactorsagreementerid
  is ' ��� ����������� ������������ ����-�������� ';
comment on column DWH.OPPORTUNITY.new_stopfacagreementeridname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_summ
  is ' ���������� ����� �������������� �� �������� ';
comment on column DWH.OPPORTUNITY.new_supplier
  is ' ��������� �� ';
comment on column DWH.OPPORTUNITY.new_suspensiveconditions
  is ' ������������� ������� ';
comment on column DWH.OPPORTUNITY.new_taxationsystem
  is ' ������� ��������������� ';
comment on column DWH.OPPORTUNITY.new_territory
  is ' ������������� ';
comment on column DWH.OPPORTUNITY.new_territoryname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.new_totalfinanceopportunitysum
  is ' ����� ����� �������������� �� ������, � ������ ��� ';
comment on column DWH.OPPORTUNITY.new_totalfinancingsum
  is ' ���������� ����� �-�� �� �� � �� � ������ ��� ';
comment on column DWH.OPPORTUNITY.new_totalfinancingsum_express
  is ' ���������� ����� �������������� �� �� � �� Express ';
comment on column DWH.OPPORTUNITY.new_totalsumdealperiod
  is ' ����� ����� ����������� ������, �� ������ ';
comment on column DWH.OPPORTUNITY.new_typelo
  is ' ��� �� ';
comment on column DWH.OPPORTUNITY.new_yearmarga
  is ' ������� ������� (���)/����������� �� �/�. ';
comment on column DWH.OPPORTUNITY.opportunityid
  is ' ��������� ������ ';
comment on column DWH.OPPORTUNITY.originatingleadid
  is ' �������� �������� ';
comment on column DWH.OPPORTUNITY.originatingleadidname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.ownerid
  is ' ������� ������������� �� ������� ';
comment on column DWH.OPPORTUNITY.owneridname
  is ' NULL ';
comment on column DWH.OPPORTUNITY.statuscode
  is ' ������ ';
comment on column DWH.OPPORTUNITY.statuscodename
  is ' NULL ';
-- Create/Recreate indexes
create unique index DWH.OPPORTUNITY_I on DWH.OPPORTUNITY (OPPORTUNITYID, TIMESLOTSTART, VALID_TO_DTTM);

