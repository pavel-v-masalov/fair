create or replace package DM.PKG_FV_CALC as

 procedure main(
                p_snapshot_dt date default trunc(sysdate) -- Дата расчета (на какую дату запускается расчет)
                ,p_client_name varchar2 --Лизингополучатель
                ,p_term_amt number -- Срок сделки
                ,p_total_sum number -- Сумма сделки
                ,p_rating_model_key number -- Ключ рейтинговой модели
                ,p_rating_nam varchar2 -- Рейтинг
                ,p_leasing_subject_type_cd varchar2 -- Типа лизингового имущества
                ,p_currency_letter_cd varchar2 -- Валюта типа ставки
                ,p_fixfloat varchar2 -- Признак фиксированной плавающей ставки
                ,p_contracts_terms_key number -- Ключ условий контракта
                ,p_ftp_calculation_method_key number -- Ключи Методики расчета ставки FTP
                ,p_schedule_file_name varchar2 -- График погашения ОД
                ,p_early_spread_type_key number -- Ключ вида спреда на досрочное погашение
                ,p_moratory_term_amt number -- Срок моратория
                ,p_fix_period_amt number -- Период фиксации
                ,p_use_period_amt number -- Период использования
                ,p_ind_cncl_term_amt number -- Срок отмены тестирования
                ,p_balance_debt_amt number -- Балансовая величина задолженности, руб.
                ,p_market_value_amt number --  Рыночная стоимость имущества
                ,p_proceed_amt number -- Выручка, млн. RUB без НДС за последний календарный год
    );

end;
/
create or replace package body DM.PKG_FV_CALC as

    GC_PACKAGE constant varchar2(30) := 'DM.PKG_FV_CALC';
    GC_EOW constant date := date '2400-01-01'; -- end of world

    GC_EXP_50 constant number := exp(-50);

    gv_exc_flag char(1) := 'Y'; --Исключение не обработано?

    subtype t_fair_value is DM.FAIR_VALUE%rowtype;
    
    function pl_max(p_n1 number, p_n2 number) return number is
    begin
      if p_n1 is null then
        return p_n2;
      end if;
      if p_n2 is null then
        return p_n1;
      end if;
      return case when p_n1 > p_n2 then p_n1 else p_n2 end;
    end;

    function inverse_normal_distribution(p_n number, p_averege number default 0, p_deviation number default 1) return number is
    begin
        -- http://statistica.ru/theory/obratnoe-normalnoe-raspredelenie-zadacha-o-konkurentsii/
        --
        --https://commons.apache.org/proper/commons-math/javadocs/api-3.6/org/apache/commons/math3/distribution/NormalDistribution.html
        --https://www.programcreek.com/java-api-examples/?api=org.apache.commons.math3.distribution.NormalDistribution
        return 2;
    end;

    function normal_distribution(p_n number, p_averege number default 0, p_deviation number default 1) return number is
    begin
        return .1;
    end;

    procedure insert_fair(p_fair_value in out nocopy t_fair_value) is
    begin
        insert into DM.FAIR_VALUE (
            CALCULATION_ID,
            report_dt,
            snapshot_dt,
            client_name,
            term_amt,
            total_sum,
            rating_model_key,
            rating_nam,
            leasing_subject_type_cd,
            currency_letter_cd,
            fixfloat,
            currate_type_key,
            contracts_terms_key,
            ftp_calculation_method_key,
            early_spread_type_key,
            moratory_term_amt,
            fix_period_amt,
            use_period_amt,
            ind_cncl_term_amt,
            balance_debt_amt,
            market_value_amt,
            proceed_amt
        )
        values (
            DM.FAIR_VALUE_SEQ.nextval,
            sysdate,
            p_fair_value.snapshot_dt,
            p_fair_value.client_name,
            p_fair_value.term_amt,
            p_fair_value.total_sum,
            p_fair_value.rating_model_key,
            p_fair_value.rating_nam,
            p_fair_value.leasing_subject_type_cd,
            p_fair_value.currency_letter_cd,
            p_fair_value.fixfloat,
            p_fair_value.currate_type_key,
            p_fair_value.contracts_terms_key,
            p_fair_value.ftp_calculation_method_key,
            p_fair_value.early_spread_type_key,
            p_fair_value.moratory_term_amt,
            p_fair_value.fix_period_amt,
            p_fair_value.use_period_amt,
            p_fair_value.ind_cncl_term_amt,
            p_fair_value.balance_debt_amt,
            p_fair_value.market_value_amt,
            p_fair_value.proceed_amt
        )
        return CALCULATION_ID into p_fair_value.calculation_id;
    exception
        when others then
            dm.u_log(GC_PACKAGE, 'insert_fair/error', 'Ошибка при создании DM.FAIR_VALUE '||sqlerrm);
            gv_exc_flag := 'N';
            raise;
    end;

    procedure update_fair_result(p_fair_value in out nocopy t_fair_value) is
    begin
        update DM.FAIR_VALUE
           set BARRIER = p_fair_value.BARRIER,
               "COMMENT" = p_fair_value."COMMENT",
               FTP_V = p_fair_value.FTP_V,
               PKR_V = p_fair_value.PKR_V,
               PEC_V = p_fair_value.PEC_V,
               DIRECT_COSTS_V = p_fair_value.DIRECT_COSTS_V,
               MAINTENENCE_COSTS_V = p_fair_value.MAINTENENCE_COSTS_V,
               EARLY_SPREAD_V = p_fair_value.EARLY_SPREAD_V,
               REVENUE_COMISSION_V = p_fair_value.REVENUE_COMISSION_V,
               FIX_SPREAD_V = p_fair_value.FIX_SPREAD_V,
               CNCL_SREAD_V = p_fair_value.CNCL_SREAD_V,
               FULL_CNCL_SREAD_V = p_fair_value.FULL_CNCL_SREAD_V,
               TERM_CNCL_SREAD_V = p_fair_value.TERM_CNCL_SREAD_V,
               ONE_CNCL_SREAD_V = p_fair_value.ONE_CNCL_SREAD_V
        where CALCULATION_ID = p_fair_value.calculation_id;
    exception
        when others then
            dm.u_log(GC_PACKAGE, 'update_fair_result/error',
                     'Ошибка при сохранении результатов DM.FAIR_VALUE CALCULATION_ID='||p_fair_value.calculation_id||' '||sqlerrm);
            gv_exc_flag := 'N';
            raise;
    end;

    function get_rate_type(p_currency_letter_cd varchar2,
                           p_fixfloat varchar2) return number is
        v_currate_type_key number;
    begin
        dbms_application_info.set_action(action_name => 'get_rate_type');
        select currate_type_key
          into v_currate_type_key
          from DWH.CURRATE_TYPES
         where CURRENCY_LETTER_CD = p_currency_letter_cd
           and FIXFLOAT = p_fixfloat;
        return v_currate_type_key;
    exception
        when others then
            dm.u_log(GC_PACKAGE,'get_rate_type/error',
                     'Ошибка при получении DWH.CURRATE_TYPES по CURRENCY_LETTER_CD='''||p_currency_letter_cd||''', FIXFLOAT='''||p_fixfloat||''' '
                     ||sqlerrm);
            gv_exc_flag := 'N';
            raise;
    end;
/*
    function get_treasury_spread(p_fair_value t_fair_value, p_treasury_spread_type varchar2, p_with_ind_cancel boolean default false) return number is
        v_value number;
    begin
        dbms_application_info.set_action(action_name => 'get_treasury_spread');
        begin
            if p_with_ind_cancel then
                select VALUE
                  into v_value
                  from DWH.TREASURY_SPREAD
                 where TREASURY_SPREAD_TYPE = p_treasury_spread_type
                    and CURRENCY_LETTER_CD = p_fair_value.currency_letter_cd
                    and FIXFLOAT = p_fair_value.fixfloat
                    and FEDERAL_LOW_TYPE_KEY = p_fair_value.federal_low_type_key
                    and p_fair_value.term_amt between INTERVAL1_DAYS_FROM and INTERVAL1_DAYS_TO
                    and p_fair_value.ind_cncl_term_amt between INTERVAL2_DAYS_FROM and INTERVAL2_DAY_TO
                    and VALID_TO_DTTM = GC_EOW and p_fair_value.SNAPSHOT_DT between START_DT and END_DT;
            else
                select VALUE
                  into v_value
                  from DWH.TREASURY_SPREAD
                 where TREASURY_SPREAD_TYPE = p_treasury_spread_type
                   and CURRENCY_LETTER_CD = p_fair_value.currency_letter_cd
                   and FIXFLOAT = p_fair_value.fixfloat
                   and FEDERAL_LOW_TYPE_KEY = p_fair_value.federal_low_type_key
                   and p_fair_value.term_amt between INTERVAL1_DAYS_FROM and INTERVAL1_DAYS_TO
                   and VALID_TO_DTTM = GC_EOW and p_fair_value.SNAPSHOT_DT between START_DT and END_DT;
            end if;
        exception when no_data_found then null; -- no value
        end;
        return v_value;
    exception
        when others then
            dm.u_log(GC_PACKAGE,'get_treasury_spread/error',
                     'Ошибка при получении DWH.TREASURY_SPREAD для TREASURY_SPREAD_TYPE='''||p_treasury_spread_type||''' '
                     ||sqlerrm);
            gv_exc_flag := 'N';
            raise;
    end;

    function get_treasury_spread_by_currency(p_fair_value t_fair_value, p_treasury_spread_type varchar2) return number is
        v_value number;
    begin
        dbms_application_info.set_action(action_name => 'get_treasury_spread');
        begin
            select VALUE
            into v_value
            from DWH.TREASURY_SPREAD
            where TREASURY_SPREAD_TYPE = p_treasury_spread_type
                and CURRENCY_LETTER_CD = p_fair_value.currency_letter_cd
                and VALID_TO_DTTM = GC_EOW and p_fair_value.SNAPSHOT_DT between START_DT and END_DT;
        exception when no_data_found then null; -- no value
        end;
        return v_value;
    exception
        when others then
            dm.u_log(GC_PACKAGE,'get_treasury_spread/error',
                     'Ошибка при получении DWH.TREASURY_SPREAD для TREASURY_SPREAD_TYPE='''||p_treasury_spread_type||''' '
                         ||sqlerrm);
            gv_exc_flag := 'N';
            raise;
    end;
*/
    function get_over_fv_max_term(p_fair_value t_fair_value, p_rate_type_cd varchar2 default null) return number is
        cursor cur_max_term is
            select max_term from DWH.FV_MAX_TERM
             where p_fair_value.term_amt > max_term
               and (p_rate_type_cd is null or rate_type_cd = p_rate_type_cd)
             order by max_term;
        v_max_term number;
    begin
        dbms_application_info.set_action(action_name => 'get_over_fv_max_term');
        open cur_max_term;
        fetch cur_max_term into v_max_term;
        close cur_max_term;
        return v_max_term;
    exception
        when others then
            if cur_max_term%isopen then close cur_max_term; end if;
            dm.u_log(GC_PACKAGE,'get_over_fv_max_term/error',
                     'Ошибка при получении DWH.FV_MAX_TERM по TERM_AMT='||p_fair_value.term_amt
                         ||case when not p_rate_type_cd is null then ' RATE_TYPE_CD='||p_rate_type_cd end||' '||sqlerrm);
            gv_exc_flag := 'N';
            raise;
    end;

    -- Расчет кривой FTP (Трансфертной ставки)
    procedure calc_ftp(p_fair_value in out nocopy t_fair_value) is
    begin
        dbms_application_info.set_action(action_name => 'calc_ftp');
        dm.u_log(GC_PACKAGE,'calc_ftp/BEGIN','Расчет кривой FTP');

        --v_fv_max_term get_max_term Трансфертная ставка  or    Трансфертная ставка (fix);
        --get CURRRATES;

        p_fair_value.ftp_v := 0.123456789;

        dm.u_log(GC_PACKAGE,'calc_ftp/END','Расчет кривой FTP');
    exception
        when others then dm.u_log(GC_PACKAGE,'calc_ftp/error','Ошибка в "Расчёт кривой FTP" '||sqlerrm); gv_exc_flag := 'N'; raise;
    end;

    -- Компенсирующий спред и комиссия за досрочное погашение
    procedure calc_treasury_spread_advanced_repayment(p_fair_value in out nocopy t_fair_value) is
    begin
        dbms_application_info.set_action(action_name => 'calc_treasury_spread_advanced_repayment');
        dm.u_log(GC_PACKAGE,'calc_treasury_spread_advanced_repayment/BEGIN','Компенсирующий спред и комиссия за досрочное погашение');
        dm.u_log(GC_PACKAGE,'calc_treasury_spread_advanced_repayment/END','Компенсирующий спред и комиссия за досрочное погашение');
    exception
        when others then dm.u_log(GC_PACKAGE,'calc_treasury_spread_advanced_repayment/error','Ошибка в "Компенсирующий спред и комиссия за досрочное погашение" '||sqlerrm); gv_exc_flag := 'N'; raise;
    end;

    -- Расчет варианта Спред+комиссия
    procedure calc_treasury_spread_commission(p_fair_value in out nocopy t_fair_value) is
    begin
        dbms_application_info.set_action(action_name => 'calc_treasury_spread_commission');
        dm.u_log(GC_PACKAGE,'calc_treasury_spread_commission/BEGIN','Расчет варианта Спред+комиссия');
        dm.u_log(GC_PACKAGE,'calc_treasury_spread_commission/END','Расчет варианта Спред+комиссия');
    exception
        when others then dm.u_log(GC_PACKAGE,'calc_treasury_spread_commission/error','Ошибка в "Расчет варианта Спред+комиссия" '||sqlerrm); gv_exc_flag := 'N'; raise;
    end;

    -- Расчет варианта Мораторий+спред
    procedure calc_treasury_spread_moratorium(p_fair_value in out nocopy t_fair_value) is
    begin
        dbms_application_info.set_action(action_name => 'calc_treasury_spread_moratorium');
        dm.u_log(GC_PACKAGE,'calc_treasury_spread_moratorium/BEGIN','Расчет варианта Мораторий+спред');
        dm.u_log(GC_PACKAGE,'calc_treasury_spread_moratorium/END','Расчет варианта Мораторий+спред');
    exception
        when others then dm.u_log(GC_PACKAGE,'calc_treasury_spread_moratorium/error','Ошибка в "Расчет варианта Мораторий+спред" '||sqlerrm); gv_exc_flag := 'N'; raise;
    end;

    -- Комиссия за обязательство
    procedure calc_treasury_spread_commission_liability(p_fair_value in out nocopy t_fair_value) is
    begin
        dbms_application_info.set_action(action_name => 'calc_treasury_spread_commission_liability');
        dm.u_log(GC_PACKAGE,'calc_treasury_spread_commission_liability/BEGIN','Комиссия за обязательство');
        dm.u_log(GC_PACKAGE,'calc_treasury_spread_commission_liability/END','Комиссия за обязательство');
    exception
        when others then dm.u_log(GC_PACKAGE,'calc_ftp/error','Ошибка в "Комиссия за обязательство" '||sqlerrm); gv_exc_flag := 'N'; raise;
    end;

    -- Компенсирующий спред за фиксацию ставки
    procedure calc_treasury_spread_fixation_rate(p_fair_value in out nocopy t_fair_value) is
        v_fv_max_term number;
        procedure i_do_calc is
        begin
            if p_fair_value.fix_period_amt is null then
                null; --FIX_SPREAD
            end if;
        end;
    begin
        dbms_application_info.set_action(action_name => 'calc_treasury_spread_fixation_rate');
        dm.u_log(GC_PACKAGE,'calc_treasury_spread_fixation_rate/BEGIN','Компенсирующий спред за фиксацию ставки');
        i_do_calc();
        dm.u_log(GC_PACKAGE,'calc_treasury_spread_fixation_rate/END','Компенсирующий спред за фиксацию ставки');
    exception
        when others then dm.u_log(GC_PACKAGE,'calc_treasury_spread_fixation_rate/error','Ошибка в "Компенсирующий спред за фиксацию ставки" '||sqlerrm); gv_exc_flag := 'N'; raise;
    end;

    -- Компенсирующий спред за отмену/отсутствие индикаторов
    procedure calc_treasury_spread_compensate_indicator(p_fair_value in out nocopy t_fair_value) is
        v_fv_max_term number;
        procedure i_do_calc is
        begin
            /*
            if (p_fair_value.federal_low_type_key = 1 -- Не в рамках ФЗ
                and p_fair_value.formulation_ind_cncl_key != 3) --Формулировка 3
                or
               (p_fair_value.federal_low_type_key != 1
                and p_fair_value.ind_cncl_term_amt is null) then
                p_fair_value.cncl_sread_v := 0;
                return;
            end if;
            v_fv_max_term := get_over_fv_max_term(p_fair_value, 'CNCL_SREAD'); -- Спред за отмену индикаторов
            if not v_fv_max_term is null then
                p_fair_value.cncl_sread_v := v_fv_max_term;
                return;
            end if;

            if p_fair_value.federal_low_type_key in (2,3) -- 44-ФЗ  223-ФЗ
               and p_fair_value.formulation_ind_cncl_key = 3 then -- Формулировка 3
                p_fair_value.full_cncl_sread_v := get_treasury_spread(p_fair_value, 'FULL_CNCL_INDC');
            end if;

            if p_fair_value.federal_low_type_key = 1 -- Не в рамках ФЗ
                and p_fair_value.formulation_ind_cncl_key = 3 then -- Формулировка 3
                p_fair_value.term_cncl_sread_v := get_treasury_spread(p_fair_value, 'TERM_CNCL_INDC', true);
            end if;

            if p_fair_value.federal_low_type_key != 3 -- Формулировка 3
               and p_fair_value.formulation_ind_cncl_key in (1, 4) then -- Формулировка 1, Формулировка 4
                p_fair_value.one_cncl_sread_v := get_treasury_spread(p_fair_value, 'ONE_CNCL_INDC');
                p_fair_value.barrier := get_treasury_spread_by_currency(p_fair_value, 'BARRIER');
            end if;
            */
            p_fair_value.cncl_sread_v := nvl(p_fair_value.cncl_sread_v, 0) + nvl(p_fair_value.full_cncl_sread_v, 0)
                                         + nvl(p_fair_value.term_cncl_sread_v, 0) + nvl(p_fair_value.one_cncl_sread_v, 0);
        end;
    begin
        dbms_application_info.set_action(action_name => 'calc_treasury_spread_compensate_indicator');
        dm.u_log(GC_PACKAGE,'calc_treasury_spread_compensate_indicator/BEGIN','Компенсирующий спред за отмену/отсутствие индикаторов');
        i_do_calc;
        dm.u_log(GC_PACKAGE,'calc_treasury_spread_compensate_indicator/END','Компенсирующий спред за отмену/отсутствие индикаторов');
    exception
        when others then dm.u_log(GC_PACKAGE,'calc_treasury_spread_compensate_indicator/error','Ошибка в "Компенсирующий спред за отмену/отсутствие индикаторов" '||sqlerrm); gv_exc_flag := 'N'; raise;
    end;

    -- Казначейские спреды (надбавки за право досрочного погашения, отмену индикаторов и фиксацию ставки на период выборки)
    procedure calc_treasury_spread(p_fair_value in out nocopy t_fair_value) is
    begin
        dbms_application_info.set_action(action_name => 'calc_treasury_spread');
        dm.u_log(GC_PACKAGE,'calc_treasury_spread/BEGIN','Казначейские спреды');

        -- Компенсирующий спред и комиссия за досрочное погашение
        calc_treasury_spread_advanced_repayment(p_fair_value);

        -- Расчет варианта Спред+комиссия
        calc_treasury_spread_commission(p_fair_value);

        -- Расчет варианта Мораторий+спред
        calc_treasury_spread_moratorium(p_fair_value);

        -- Комиссия за обязательство
        calc_treasury_spread_commission_liability(p_fair_value);

        -- Компенсирующий спред за фиксацию ставки
        calc_treasury_spread_fixation_rate(p_fair_value);

        -- Компенсирующий спред за отмену/отсутствие индикаторов
        calc_treasury_spread_compensate_indicator(p_fair_value);

        dm.u_log(GC_PACKAGE,'calc_treasury_spread/END','Казначейские спреды');
    exception
        when others then dm.u_log(GC_PACKAGE,'calc_treasury_spread/error','Ошибка в расчёте "Казначейские спреды" '||sqlerrm); gv_exc_flag := 'N'; raise;
    end;

    -- Премия за кредитный риск (надбавка на покрытие риска дефолта клиента)
    procedure calc_credit_risk_premium(p_fair_value in out nocopy t_fair_value) is
        v_lgd number;
        v_PD1_MACRO number;
    begin
        dbms_application_info.set_action(action_name => 'calc_credit_risk_premium');
        dm.u_log(GC_PACKAGE,'calc_credit_risk_premium/BEGIN','Премия за кредитный риск');

        begin
            select LGD
              into v_lgd
              from DWH.REF_LGD
             where LEASING_SUBJECT_TYPE_CD = p_fair_value.leasing_subject_type_cd and LGD_TYPE_CD = 'RES';
        exception when no_data_found then
            dm.u_log(GC_PACKAGE,'calc_credit_risk_premium','no_data_found at DWH.REF_LGD for LEASING_SUBJECT_TYPE_CD='||p_fair_value.leasing_subject_type_cd
                                ||' LGD_TYPE_CD=''RES''');
            raise;
        end;
        begin
            select PD1_MACRO
              into v_PD1_MACRO
              from DWH.PD_CORP
             where RANK_MODEL_KEY = p_fair_value.rating_model_key and RAT_ON_DATE = p_fair_value.rating_nam
               and VALID_TO_DTTM = GC_EOW and p_fair_value.SNAPSHOT_DT between ST_DATE and END_DATE;
        exception when no_data_found then
            dm.u_log(GC_PACKAGE,'calc_credit_risk_premium','no_data_found at DWH.PD_CORP for RANK_MODEL_KEY(as rating)='||p_fair_value.rating_model_key
                                ||'RAT_ON_DATE='||p_fair_value.rating_nam);
            raise;
        end;

        p_fair_value.PKR_V := v_pd1_macro + v_lgd;

        dm.u_log(GC_PACKAGE,'calc_credit_risk_premium/END','Премия за кредитный риск');
    exception
        when others then dm.u_log(GC_PACKAGE,'calc_credit_risk_premium/error','Ошибка в расчёте "Премия за кредитный риск" '||sqlerrm); gv_exc_flag := 'N'; raise;
    end;

    -- Плата за экономический капитал (надбавка на покрытие других операционных и бизнес-рисков)
    procedure calc_pay_economic_capital(p_fair_value in out nocopy t_fair_value) is
        v_C_E number;
        v_E1 number;
        v_E2 number;
        v_LGD number;
        v_PD number;
        v_correction_R number;
        v_R number;
        v_n_reverse number;
        v_n_reverse_999 number;
        v_x number;
        v_n number;
        v_s number;
        v_a number;
        v_b number;
        v_effective_term number;
        v_k number;
        v_roe number;
    begin
        dbms_application_info.set_action(action_name => 'calc_pay_economic_capital');
        dm.u_log(GC_PACKAGE,'calc_pay_economic_capital/BEGIN','Плата за экономический капитал');

        v_C_E := case p_fair_value.balance_debt_amt when 0 then 0 else p_fair_value.market_value_amt / p_fair_value.balance_debt_amt end;
        v_E1 := case when v_C_E < .3 then 0
                     when v_C_E > 1.4 then p_fair_value.balance_debt_amt
                     else p_fair_value.market_value_amt end;
        v_E2 := p_fair_value.balance_debt_amt - v_E1;
        v_LGD := case p_fair_value.balance_debt_amt when 0 then .045
                 else (.35 * v_E1 + .045 * v_E2) / p_fair_value.balance_debt_amt end;

        begin
            select PD
              into v_PD
              from DWH.PD_CORP_EC
             where VALID_TO_DTTM = GC_EOW and p_fair_value.SNAPSHOT_DT between START_DT and END_DT
               and RATING_MODEL_KEY = p_fair_value.rating_model_key and RAT_ON_DATE = p_fair_value.rating_nam;
        exception when no_data_found then
            dm.u_log(GC_PACKAGE,'calc_pay_economic_capital','no_data_found at DWH.PD_CORP_EC for RATING_MODEL_KEY='
                                                            ||p_fair_value.rating_model_key||' and RAT_ON_DATE='||p_fair_value.rating_nam);
            raise;
        end;

        v_correction_R := case when p_fair_value.rating_model_key = 3 -- Крупные (корпоративные)
                                 or p_fair_value.proceed_amt = 0
                                 or p_fair_value.proceed_amt > 2000
                                 or v_PD = 1 -- 100%
                                 then 0
                               else
                                 .04 * (1 - pl_max(100, p_fair_value.proceed_amt - 1) / 900) end;
        v_R := .12 * ((1 - exp(-50*v_pd))/(1 - GC_EXP_50)) + .24 * (1 - (1 - exp(-50*v_pd)) / (1 - GC_EXP_50));

        v_n_reverse := inverse_normal_distribution(v_pd, 0, 1);
        v_n_reverse_999 := inverse_normal_distribution(.999);
        v_x := 1/sqrt(1 - v_r) * v_n_reverse + sqrt(v_r/(1 - v_r)) * v_n_reverse_999;
        v_n := normal_distribution(v_x);
        v_s := power(.11852 - .05478 * ln(v_pd), 2);
        v_a := 1 / (1 - 1.5 * v_s);
        v_effective_term := pl_max(2.5, p_fair_value.term_amt/365);
        v_b := 1 + (v_effective_term - 2.5) * v_s;
        v_k := v_lgd * (v_n - v_pd) * v_a * v_b;

        begin
            select ROE
              into v_roe
              from DWH.ROE
             where valid_to_dttm = GC_EOW;
        exception when no_data_found then
            dm.u_log(GC_PACKAGE,'calc_pay_economic_capital','no_data_found at DWH.ROE');
            raise;
        end;

        p_fair_value.PEC_V := v_k * v_roe * p_fair_value.FTP_V;

        dm.u_log(GC_PACKAGE,'calc_pay_economic_capital/END','Плата за экономический капитал');
    exception
        when others then dm.u_log(GC_PACKAGE,'calc_pay_economic_capital/error','Ошибка в расчёте "Плата за экономический капитал" '||sqlerrm); gv_exc_flag := 'N'; raise;
    end;

    -- Прямые расходы бизнес-подразделения
    procedure calc_direct_expenses(p_fair_value in out nocopy t_fair_value) is
    begin
        dbms_application_info.set_action(action_name => 'calc_direct_expenses');
        dm.u_log(GC_PACKAGE,'calc_direct_expenses/BEGIN','Прямые расходы бизнес-подразделения');
        begin
            select DIRECT_COST_RATE
              into p_fair_value.direct_costs_v
              from DWH.DIRECT_COST_RATES
             where VALID_TO_DTTM = GC_EOW and p_fair_value.SNAPSHOT_DT between START_DT and END_DT;
        exception when no_data_found then null; -- no data extracted
        end;
        dm.u_log(GC_PACKAGE,'calc_direct_expenses/END','Прямые расходы бизнес-подразделения');
    exception
        when others then dm.u_log(GC_PACKAGE,'calc_treasury_spread/error','Ошибка в расчёте "Прямые расходы бизнес-подразделения" '||sqlerrm); gv_exc_flag := 'N'; raise;
    end;

    -- Административно-хозяйственные расходы
    procedure calc_administrative_expense(p_fair_value in out nocopy t_fair_value) is
    begin
        dbms_application_info.set_action(action_name => 'calc_administrative_expense');
        dm.u_log(GC_PACKAGE,'calc_administrative_expense/BEGIN','Административно-хозяйственные расходы');
        begin
            select MAINTENENCE_COST_RATE
              into p_fair_value.maintenence_costs_v
              from DWH.MAINTENENCE_COST_RATES
             where VALID_TO_DTTM = GC_EOW and p_fair_value.SNAPSHOT_DT between START_DT and END_DT;
        exception when no_data_found then null; -- no data extracted
        end;
        dm.u_log(GC_PACKAGE,'calc_administrative_expense/END','Административно-хозяйственные расходы');
    exception
        when others then dm.u_log(GC_PACKAGE,'calc_administrative_expense/error','Ошибка в расчёте "Административно-хозяйственные расходы" '||sqlerrm); gv_exc_flag := 'N'; raise;
    end;

    procedure main(
        p_snapshot_dt date default trunc(sysdate) -- Дата расчета (на какую дату запускается расчет)
        ,p_client_name varchar2 --Лизингополучатель
        ,p_term_amt number -- Срок сделки
        ,p_total_sum number -- Сумма сделки
        ,p_rating_model_key number -- Ключ рейтинговой модели
        ,p_rating_nam varchar2 -- Рейтинг
        ,p_leasing_subject_type_cd varchar2 -- Типа лизингового имущества
        ,p_currency_letter_cd varchar2 -- Валюта типа ставки
        ,p_fixfloat varchar2 -- Признак фиксированной плавающей ставки
        ,p_contracts_terms_key number -- Ключ условий контракта
        ,p_ftp_calculation_method_key number -- Ключи Методики расчета ставки FTP
        ,p_schedule_file_name varchar2 -- График погашения ОД
        ,p_early_spread_type_key number -- Ключ вида спреда на досрочное погашение
        ,p_moratory_term_amt number -- Срок моратория
        ,p_fix_period_amt number -- Период фиксации
        ,p_use_period_amt number -- Период использования
        ,p_ind_cncl_term_amt number -- Срок отмены тестирования
        ,p_balance_debt_amt number -- Балансовая величина задолженности, руб.
        ,p_market_value_amt number --  Рыночная стоимость имущества
        ,p_proceed_amt number -- Выручка, млн. RUB без НДС за последний календарный год
    ) is
        v_fair_value t_Fair_Value;
        v_fv_max_term number;

        procedure init_fair_record is
        begin
            v_fair_value.snapshot_dt := p_snapshot_dt;
            v_fair_value.client_name := p_client_name;
            v_fair_value.term_amt := p_term_amt;
            v_fair_value.total_sum := p_total_sum;
            v_fair_value.rating_model_key := p_rating_model_key;
            v_fair_value.rating_nam := p_rating_nam;
            v_fair_value.leasing_subject_type_cd := p_leasing_subject_type_cd;
            v_fair_value.currency_letter_cd := p_currency_letter_cd;
            v_fair_value.fixfloat := p_fixfloat;
            v_fair_value.currate_type_key := get_rate_type(p_currency_letter_cd, p_fixfloat);
            v_fair_value.contracts_terms_key := p_contracts_terms_key;
            v_fair_value.ftp_calculation_method_key := p_ftp_calculation_method_key;
            v_fair_value.early_spread_type_key := p_early_spread_type_key;
            v_fair_value.moratory_term_amt := p_moratory_term_amt;
            v_fair_value.fix_period_amt := p_fix_period_amt;
            v_fair_value.use_period_amt := p_use_period_amt;
            v_fair_value.ind_cncl_term_amt := p_ind_cncl_term_amt;
            v_fair_value.balance_debt_amt := p_balance_debt_amt;
            v_fair_value.market_value_amt := p_market_value_amt;
            v_fair_value.proceed_amt := p_proceed_amt;
            insert_fair(v_fair_value);
        end;
    begin
        gv_exc_flag := 'Y'; -- initial value for single run
        dm.u_log(GC_PACKAGE, 'main/BEGIN','Начало расчёта справедливой ставки. Дата расчёта '||to_char(p_snapshot_dt,'YYYY-MM-DD')
                                                                               ||' пользователь '||user);
        dbms_application_info.set_module(module_name => GC_PACKAGE, action_name => 'main');
        dbms_application_info.set_client_info(client_info => to_char(p_snapshot_dt,'yyyy-mm-dd'));

        --validate_mandatory;
        init_fair_record;
        -------log Запуск расчета id date params;
        -------load repayment schedule;

        -- Если [Срок сделки] превышает хотя бы один максимальный срок
        v_fv_max_term := get_over_fv_max_term(v_fair_value);
        if not v_fv_max_term is null then
            v_fair_value.comment := 'Для сделок более '||v_fv_max_term||' дн. необходимо индивидуально согласование с Казначейством';
        end if;

        -- Расчет кривой FTP (Трансфертной ставки)
        calc_ftp(v_fair_value);
        -- Казначейские спреды (надбавки за право досрочного погашения, отмену индикаторов и фиксацию ставки на период выборки)
        calc_treasury_spread(v_fair_value);
        -- Премия за кредитный риск (надбавка на покрытие риска дефолта клиента)
        calc_credit_risk_premium(v_fair_value);
        -- Плата за экономический капитал (надбавка на покрытие других операционных и бизнес-рисков)
        calc_pay_economic_capital(v_fair_value);
        -- Прямые расходы бизнес-подразделения
        calc_direct_expenses(v_fair_value);
        -- Административно-хозяйственные расходы
        calc_administrative_expense(v_fair_value);

        update_fair_result(v_fair_value);

        dm.u_log(GC_PACKAGE,'main/END','Расчет сформирован CALCULATION_ID='||v_fair_value.calculation_id);
    exception
        when others then
            if gv_exc_flag = 'Y' then
                dm.u_log('DM.PKG_DM_PAYMENTS_NARR','MAIN/error' ,sqlerrm);
            end if;
            raise;
     end main;

end;
/
