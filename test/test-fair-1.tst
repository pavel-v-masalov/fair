PL/SQL Developer Test script 3.0
29
begin
  dm.PKG_FV_CALC.main(
                p_snapshot_dt => sysdate -- Дата расчета (на какую дату запускается расчет)
                ,p_client_name => 'TEST' --Лизингополучатель
                ,p_term_amt => 1095 -- Срок сделки
                ,p_rating_model_key => 4 -- Ключ рейтинговой модели
                ,p_rating_nam => 'A1' -- Рейтинг
                ,p_leasing_subject_type_cd => 'Воздушные суда' -- Типа лизингового имущества
                ,p_currency_letter_cd => 'RUB' -- Валюта типа ставки / валюта договора
                ,p_fixfloat => 'fix' -- Признак фиксированной плавающей ставки
                ,p_contracts_terms_key => 1  -- Ключ стандартных условий договора
                ,p_ftp_calculation_method_key => 1 -- Ключи Методики расчета ставки FTP
                ,p_schedule_file_name => '' -- График погашения ОД
                ,p_early_spread_type_key => 1 -- Ключ вида спреда на досрочное погашение
                ,p_moratory_term_amt => 10 -- Срок моратория
                ,p_fix_period_amt => 10 -- Период фиксации
                ,p_use_period_amt => 10 -- Период использования
                ,p_ind_cncl_term_amt => 0 -- Срок отмены тестирования
                ,p_balance_debt_amt => 1000000 -- Балансовая величина задолженности, валюта
                ,p_market_value_amt => 1000000 --  Рыночная стоимость имущества, валюта (!)
                ,p_proceed_amt => 1000000 -- Выручка, млн. RUB без НДС за последний календарный год, валюта (!)
                ,p_other_spread => 1 -- Прочие спреды
                ,p_other_spread_comment => 'comm' -- Комментарий к прочим спредам
                ,p_msfo_balance_debt_amt => 101.  -- Задолженность по графику МСФО, валюта
                ,p_comission_amt => 1. -- Комиссия за организацию сделки, валюта
                ,p_Market_currency_letter_cd => 'USD'  -- Валюта рыночной стоимости
                ,p_Proceed_currency_letter_cd => 'USD' -- Валюта выручки
  );
end;
0
0
