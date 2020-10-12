PL/SQL Developer Test script 3.0
24
begin
  dm.PKG_FV_CALC.main(
                sysdate --:P401_REPORT_DT
                ,'TEST' --:P401_CLIENT_NAME
                ,1095 --:P401_TERM
                ,1000000 --:P401_AMT
                ,4 --:P401_RATING_MODEL
                ,'A1' --:P401_RATING
                ,'Воздушные суда' --:P401_ASSET_TYPE
                ,'RUB' --:P401_CURRENCY
                ,'fix' --:P401_RATE_TYPE
                , 1--:P401_TERMS
                ,1 --:P401_METHOD_FTP
                ,'' --:P401_F_SCHEDULE
                ,1 --:P401_SPREAD_TYPE
                ,10 --:P401_MORATORY_TERM
                ,10 --:P401_TERM_FIX
                ,10 --:P401_TERM_USE
                ,0 --:P401_TERM_CNCL
                ,1000000 --:P401_AMT
                ,1000000 --:P401_MARKET_AMT
                ,1000000 --:P401_PROCEED
);
end;
0
0
