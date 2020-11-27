create or replace package DM.PKG_FV_CALC as

    function normal_inv_cumulative_distrib(p_n number, p_mean number default 0, p_deviation number default 1) return number;
    function normal_distribution(p_n number) return number;
    function normal_cumulative_distribution(p_n number, p_mean number default 0, p_deviation number default 1) return number;

    procedure main(
                p_snapshot_dt date default trunc(sysdate) -- Дата расчета (на какую дату запускается расчет)
                ,p_client_name varchar2 --Лизингополучатель
                ,p_term_amt number -- Срок сделки
                ,p_rating_model_key number -- Ключ рейтинговой модели
                ,p_rating_nam varchar2 -- Рейтинг
                ,p_leasing_subject_type_cd varchar2 -- Типа лизингового имущества
                ,p_currency_letter_cd varchar2 -- Валюта типа ставки
                ,p_fixfloat varchar2 -- Признак фиксированной плавающей ставки
                ,p_contracts_terms_key number -- Ключ стандартных условий договора
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
                ,p_other_spread number -- Прочие спреды
                ,p_other_spread_comment varchar2 -- Комментарий к прочим спредам
                ,p_msfo_balance_debt_amt number -- Задолженность по графику МСФО
                ,p_comission_amt number -- Комиссия за организацию сделки

    );

end;
/
create or replace package body DM.PKG_FV_CALC as

    GC_ERROR constant int := -20222;

    GC_PACKAGE constant varchar2(30) := 'DM.PKG_FV_CALC';
    GC_EOW constant date := date '2400-01-01'; -- end of world

    GC_EXP_50 constant number := exp(-50);
    GC_PI constant number := 3.1415926;
    GC_E  constant number := 2.71828;
    GC_INFINITY constant number := 9999999999999999999999999999999999999999999999999999999999999; -- 1.0 / 0.0

    gv_exc_flag char(1) := 'Y'; --Исключение не обработано?

    -- org.apache.commons.math3.special.Gamma
    INV_GAMMA1P_M1_A0 constant number := .611609510448141581788E-08;
    INV_GAMMA1P_M1_A1 constant number := .624730830116465516210E-08;
    INV_GAMMA1P_M1_B1 constant number := .203610414066806987300E+00;
    INV_GAMMA1P_M1_B2 constant number := .266205348428949217746E-01;
    INV_GAMMA1P_M1_B3 constant number := .493944979382446875238E-03;
    INV_GAMMA1P_M1_B4 constant number := -.851419432440314906588E-05;
    INV_GAMMA1P_M1_B5 constant number := -.643045481779353022248E-05;
    INV_GAMMA1P_M1_B6 constant number := .992641840672773722196E-06;
    INV_GAMMA1P_M1_B7 constant number := -.607761895722825260739E-07;
    INV_GAMMA1P_M1_B8 constant number := .195755836614639731882E-09;
    INV_GAMMA1P_M1_P0 constant number := .6116095104481415817861E-08;
    INV_GAMMA1P_M1_P1 constant number := .6871674113067198736152E-08;
    INV_GAMMA1P_M1_P2 constant number := .6820161668496170657918E-09;
    INV_GAMMA1P_M1_P3 constant number := .4686843322948848031080E-10;
    INV_GAMMA1P_M1_P4 constant number := .1572833027710446286995E-11;
    INV_GAMMA1P_M1_P5 constant number := -.1249441572276366213222E-12;
    INV_GAMMA1P_M1_P6 constant number := .4343529937408594255178E-14;
    INV_GAMMA1P_M1_Q1 constant number := .3056961078365221025009E+00;
    INV_GAMMA1P_M1_Q2 constant number := .5464213086042296536016E-01;
    INV_GAMMA1P_M1_Q3 constant number := .4956830093825887312020E-02;
    INV_GAMMA1P_M1_Q4 constant number := .2692369466186361192876E-03;
    INV_GAMMA1P_M1_C constant number := -.422784335098467139393487909917598E+00;
    INV_GAMMA1P_M1_C0 constant number := .577215664901532860606512090082402E+00;
    INV_GAMMA1P_M1_C1 constant number := -.655878071520253881077019515145390E+00;
    INV_GAMMA1P_M1_C2 constant number := -.420026350340952355290039348754298E-01;
    INV_GAMMA1P_M1_C3 constant number := .166538611382291489501700795102105E+00;
    INV_GAMMA1P_M1_C4 constant number := -.421977345555443367482083012891874E-01;
    INV_GAMMA1P_M1_C5 constant number := -.962197152787697356211492167234820E-02;
    INV_GAMMA1P_M1_C6 constant number := .721894324666309954239501034044657E-02;
    INV_GAMMA1P_M1_C7 constant number := -.116516759185906511211397108401839E-02;
    INV_GAMMA1P_M1_C8 constant number := -.215241674114950972815729963053648E-03;
    INV_GAMMA1P_M1_C9 constant number := .128050282388116186153198626328164E-03;
    INV_GAMMA1P_M1_C10 constant number := -.201348547807882386556893914210218E-04;
    INV_GAMMA1P_M1_C11 constant number := -.125049348214267065734535947383309E-05;
    INV_GAMMA1P_M1_C12 constant number := .113302723198169588237412962033074E-05;
    INV_GAMMA1P_M1_C13 constant number := -.205633841697760710345015413002057E-06;

    subtype t_fair_value is DM.FAIR_VALUE%rowtype;
    subtype t_currate is DWH.CURRATES%rowtype;

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

    function pl_abs(n number) return number is
    begin
        return case when n < 0 then - n else n end;
    end;

    --https://www.boost.org/doc/libs/1_47_0/libs/math/doc/sf_and_dist/html/math_toolkit/dist/dist_ref/dists/inverse_gaussian_dist.html
    --http://statistica.ru/theory/obratnoe-normalnoe-raspredelenie-zadacha-o-konkurentsii/
    --https://commons.apache.org/proper/commons-math/javadocs/api-3.6/org/apache/commons/math3/distribution/NormalDistribution.html
    --https://www.programcreek.com/java-api-examples/?api=org.apache.commons.math3.distribution.NormalDistribution
    --http://torofimofu.blogspot.com/2018/02/oracle-11g-ii.html?m=1
    --https://community.oracle.com/tech/developers/discussion/4009671/how-to-implement-excel-norm-s-dist-function

    -- org.apache.commons.math3.special.Gamma#invGamma1pm1
    function invGamma1pm1(x number) return number is
        ret number;
        t number;
        a number;
        b number;
        c number;
        p number;
        q number;
    begin
        t := case when x <= 0.5 then x else (x - 0.5) - 0.5 end;
        if (t < 0.0) then
            a := INV_GAMMA1P_M1_A0 + t * INV_GAMMA1P_M1_A1;
            b := INV_GAMMA1P_M1_B8;
            b := INV_GAMMA1P_M1_B7 + t * b;
            b := INV_GAMMA1P_M1_B6 + t * b;
            b := INV_GAMMA1P_M1_B5 + t * b;
            b := INV_GAMMA1P_M1_B4 + t * b;
            b := INV_GAMMA1P_M1_B3 + t * b;
            b := INV_GAMMA1P_M1_B2 + t * b;
            b := INV_GAMMA1P_M1_B1 + t * b;
            b := 1.0 + t * b;

            c := INV_GAMMA1P_M1_C13 + t * (a / b);
            c := INV_GAMMA1P_M1_C12 + t * c;
            c := INV_GAMMA1P_M1_C11 + t * c;
            c := INV_GAMMA1P_M1_C10 + t * c;
            c := INV_GAMMA1P_M1_C9 + t * c;
            c := INV_GAMMA1P_M1_C8 + t * c;
            c := INV_GAMMA1P_M1_C7 + t * c;
            c := INV_GAMMA1P_M1_C6 + t * c;
            c := INV_GAMMA1P_M1_C5 + t * c;
            c := INV_GAMMA1P_M1_C4 + t * c;
            c := INV_GAMMA1P_M1_C3 + t * c;
            c := INV_GAMMA1P_M1_C2 + t * c;
            c := INV_GAMMA1P_M1_C1 + t * c;
            c := INV_GAMMA1P_M1_C + t * c;
            if (x > 0.5) then
                ret := t * c / x;
            else
                ret := x * ((c + 0.5) + 0.5);
            end if;
        else
            p := INV_GAMMA1P_M1_P6;
            p := INV_GAMMA1P_M1_P5 + t * p;
            p := INV_GAMMA1P_M1_P4 + t * p;
            p := INV_GAMMA1P_M1_P3 + t * p;
            p := INV_GAMMA1P_M1_P2 + t * p;
            p := INV_GAMMA1P_M1_P1 + t * p;
            p := INV_GAMMA1P_M1_P0 + t * p;

            q := INV_GAMMA1P_M1_Q4;
            q := INV_GAMMA1P_M1_Q3 + t * q;
            q := INV_GAMMA1P_M1_Q2 + t * q;
            q := INV_GAMMA1P_M1_Q1 + t * q;
            q := 1.0 + t * q;

            c := INV_GAMMA1P_M1_C13 + (p / q) * t;
            c := INV_GAMMA1P_M1_C12 + t * c;
            c := INV_GAMMA1P_M1_C11 + t * c;
            c := INV_GAMMA1P_M1_C10 + t * c;
            c := INV_GAMMA1P_M1_C9 + t * c;
            c := INV_GAMMA1P_M1_C8 + t * c;
            c := INV_GAMMA1P_M1_C7 + t * c;
            c := INV_GAMMA1P_M1_C6 + t * c;
            c := INV_GAMMA1P_M1_C5 + t * c;
            c := INV_GAMMA1P_M1_C4 + t * c;
            c := INV_GAMMA1P_M1_C3 + t * c;
            c := INV_GAMMA1P_M1_C2 + t * c;
            c := INV_GAMMA1P_M1_C1 + t * c;
            c := INV_GAMMA1P_M1_C0 + t * c;
            if (x > 0.5) then
                ret := (t / x) * ((c - 0.5) - 0.5);
            else
                ret := x * c;
            end if;
        end if;
        return ret;
    end;


    function logGamma1p(x number) return number is
        function log1p(xx number) return number is
        begin
            return ln(1 + xx);
        end;
    begin
        if (x < -0.5) then
            raise_application_error(GC_ERROR, 'NumberIsTooSmall '||x);
        elsif (x > 1.5) then
            raise_application_error(GC_ERROR, 'NumberIsTooLarge '||x);
        end if;

        return -log1p(invGamma1pm1(x));
    end;

    -- org.apache.commons.math3.special.Gamma#logGamma
    function logGamma(x number) return number is
        n int;
        prod number;
    begin
        if (x < 0.5) then
            return logGamma1p(x) - ln(x);
        elsif (x <= 2.5) then
            return logGamma1p((x - 0.5) - 0.5);
        else
            n := floor(x - 1.5);
            prod := 1.0;
            for i in 1 .. n loop
                prod := prod * x - i;
            end loop;
            return logGamma1p(x - (n + 1)) + ln(prod);
        end if;
    end;

    -- org.apache.commons.math3.special.Gamma#regularizedGammaP(double, double, double, int)
    function regularizedGammaP(a number, x number, epsilon number, maxIterations int) return number is
        ret number;
        n number := 0.0; -- current element index
        an number := 1.0 / a; -- n-th element in the series
        v_sum number := an; -- partial sum
    begin
        -- calculate series
        while pl_abs(an/v_sum) > epsilon and n < maxIterations and v_sum < GC_INFINITY loop
            -- compute next element in the series
            n := n + 1.0;
            an := an * x / (a + n);
            -- update partial sum
            v_sum := v_sum + an;
        end loop;
        if (n >= maxIterations) then
            raise_application_error(GC_ERROR, 'MaxCountExceeded '||maxIterations);
        elsif v_sum < -gc_infinity or v_sum > gc_infinity then
            ret := 1.0;
        else
            ret := exp(-x + (a * ln(x)) - logGamma(a)) * v_sum;
        end if;
        return ret;
    end;

    -- org.apache.commons.math3.special.Erf#erfInv
    function erfInv(x number) return number is
        w number;
        p number;
    begin
        w := -ln((1.0 - x) * (1.0 + x));
        if (w < 6.25) then
            w := w - 3.125;
            p :=  -3.6444120640178196996e-21;
            p :=   -1.685059138182016589e-19 + p * w;
            p :=   1.2858480715256400167e-18 + p * w;
            p :=    1.115787767802518096e-17 + p * w;
            p :=   -1.333171662854620906e-16 + p * w;
            p :=   2.0972767875968561637e-17 + p * w;
            p :=   6.6376381343583238325e-15 + p * w;
            p :=  -4.0545662729752068639e-14 + p * w;
            p :=  -8.1519341976054721522e-14 + p * w;
            p :=   2.6335093153082322977e-12 + p * w;
            p :=  -1.2975133253453532498e-11 + p * w;
            p :=  -5.4154120542946279317e-11 + p * w;
            p :=    1.051212273321532285e-09 + p * w;
            p :=  -4.1126339803469836976e-09 + p * w;
            p :=  -2.9070369957882005086e-08 + p * w;
            p :=   4.2347877827932403518e-07 + p * w;
            p :=  -1.3654692000834678645e-06 + p * w;
            p :=  -1.3882523362786468719e-05 + p * w;
            p :=    0.0001867342080340571352 + p * w;
            p :=  -0.00074070253416626697512 + p * w;
            p :=   -0.0060336708714301490533 + p * w;
            p :=      0.24015818242558961693 + p * w;
            p :=       1.6536545626831027356 + p * w;
        elsif (w < 16.0) then
            w := sqrt(w) - 3.25;
            p :=   2.2137376921775787049e-09;
            p :=   9.0756561938885390979e-08 + p * w;
            p :=  -2.7517406297064545428e-07 + p * w;
            p :=   1.8239629214389227755e-08 + p * w;
            p :=   1.5027403968909827627e-06 + p * w;
            p :=   -4.013867526981545969e-06 + p * w;
            p :=   2.9234449089955446044e-06 + p * w;
            p :=   1.2475304481671778723e-05 + p * w;
            p :=  -4.7318229009055733981e-05 + p * w;
            p :=   6.8284851459573175448e-05 + p * w;
            p :=   2.4031110387097893999e-05 + p * w;
            p :=   -0.0003550375203628474796 + p * w;
            p :=   0.00095328937973738049703 + p * w;
            p :=   -0.0016882755560235047313 + p * w;
            p :=    0.0024914420961078508066 + p * w;
            p :=   -0.0037512085075692412107 + p * w;
            p :=     0.005370914553590063617 + p * w;
            p :=       1.0052589676941592334 + p * w;
            p :=       3.0838856104922207635 + p * w;
        else
            w := sqrt(w) - 5.0;
            p :=  -2.7109920616438573243e-11;
            p :=  -2.5556418169965252055e-10 + p * w;
            p :=   1.5076572693500548083e-09 + p * w;
            p :=  -3.7894654401267369937e-09 + p * w;
            p :=   7.6157012080783393804e-09 + p * w;
            p :=  -1.4960026627149240478e-08 + p * w;
            p :=   2.9147953450901080826e-08 + p * w;
            p :=  -6.7711997758452339498e-08 + p * w;
            p :=   2.2900482228026654717e-07 + p * w;
            p :=  -9.9298272942317002539e-07 + p * w;
            p :=   4.5260625972231537039e-06 + p * w;
            p :=  -1.9681778105531670567e-05 + p * w;
            p :=   7.5995277030017761139e-05 + p * w;
            p :=  -0.00021503011930044477347 + p * w;
            p :=  -0.00013871931833623122026 + p * w;
            p :=       1.0103004648645343977 + p * w;
            p :=       4.8499064014085844221 + p * w;
        end if;
        return p * x;
    end;

    -- org.apache.commons.math3.special.Erf#erf(double)
    function erf(x number) return number is
        ret number;
    begin
        if (abs(x) > 40) then
            return case when x > 0 then 1 else -1 end;
        end if;
        ret := regularizedGammaP(0.5, x * x, 1.0e-15, 10000);
        return case when x < 0 then -ret else ret end;
    end;


    -- org.apache.commons.math3.distribution.NormalDistribution#inverseCumulativeProbability
    function normal_inv_cumulative_distrib(p_n number, p_mean number default 0, p_deviation number default 1) return number is
    begin
        return p_mean + p_deviation * SQRT(2) * erfInv(2 * p_n - 1);
    end;

    -- implement as EXCEL NORM.S.DIST
    --by https://community.oracle.com/tech/developers/discussion/4009671/how-to-implement-excel-norm-s-dist-function
    function normal_distribution(p_n number) return number is
    begin
        return (1/sqrt(2*GC_PI)) * power(GC_E, -1*(power(p_n,2))/2);
    end;

    --org.apache.commons.math3.distribution.NormalDistribution#cumulativeProbability(double)
    function normal_cumulative_distribution(p_n number, p_mean number default 0, p_deviation number default 1) return number is
        dev number := p_n - p_mean;
    begin
        return 0.5 * (1 + erf(dev / (p_deviation * SQRT(2))));
    end;

    procedure insert_fair(p_fair_value in out nocopy t_fair_value) is
    begin
        insert into DM.FAIR_VALUE (
            CALCULATION_ID,
            report_dt,
            snapshot_dt,
            client_name,
            term_amt,
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
            proceed_amt,
            other_spread,
            other_spread_comment,
            msfo_balance_debt_amt,
            comission_amt
        )
        values (
            p_fair_value.calculation_id,
            sysdate,
            p_fair_value.snapshot_dt,
            p_fair_value.client_name,
            p_fair_value.term_amt,
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
            p_fair_value.proceed_amt,
            p_fair_value.other_spread,
            p_fair_value.other_spread_comment,
            p_fair_value.msfo_balance_debt_amt,
            p_fair_value.comission_amt
        )
        return CALCULATION_ID, report_dt into p_fair_value.calculation_id, p_fair_value.report_dt;
        commit;
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
               CNCL_SPREAD_V = p_fair_value.CNCL_SPREAD_V,
               FULL_CNCL_SPREAD_V = p_fair_value.FULL_CNCL_SPREAD_V,
               TERM_CNCL_SPREAD_V = p_fair_value.TERM_CNCL_SPREAD_V,
               ONE_CNCL_SPREAD_V = p_fair_value.ONE_CNCL_SPREAD_V,
               FV_MSFO_V = p_fair_value.fv_msfo_v
        where CALCULATION_ID = p_fair_value.calculation_id;
    exception
        when others then
            dm.u_log(GC_PACKAGE, 'update_fair_result/error',
                     'Ошибка при сохранении результатов DM.FAIR_VALUE CALCULATION_ID='||p_fair_value.calculation_id||' '||sqlerrm);
            gv_exc_flag := 'N';
            raise;
    end;

    function get_rate_type(p_currency_letter_cd varchar2,
                           p_fixfloat varchar2,
                           p_contracts_terms_key number) return number is
        v_currate_type_key number;
    begin
        dbms_application_info.set_action(action_name => 'get_rate_type');
        select currate_type_key
          into v_currate_type_key
          from DWH.CURRATE_TYPES
         where CURRENCY_LETTER_CD = p_currency_letter_cd
           and FIXFLOAT = p_fixfloat
           and CONTRACTS_TERMS_KEY = p_contracts_terms_key;
        return v_currate_type_key;
    exception
        when others then
            dm.u_log(GC_PACKAGE,'get_rate_type/error',
                     'Ошибка при получении DWH.CURRATE_TYPES по CURRENCY_LETTER_CD='''||p_currency_letter_cd
                     ||''', FIXFLOAT='''||p_fixfloat||''' CONTRACTS_TERMS_KEY='||p_contracts_terms_key
                     ||sqlerrm);
            gv_exc_flag := 'N';
            raise;
    end;

    function get_treasury_spread(p_fair_value t_fair_value, p_treasury_spread_type varchar2, p_interval2 number default null) return number is
        v_value number;
    begin
        dbms_application_info.set_action(action_name => 'get_treasury_spread');
        begin
            select VALUE
              into v_value
              from DWH.TREASURY_SPREAD
             where TREASURY_SPREAD_TYPE = p_treasury_spread_type
                and CURRENCY_LETTER_CD = p_fair_value.currency_letter_cd
                and FIXFLOAT = p_fair_value.fixfloat
                and CONTRACTS_TERMS_KEY = p_fair_value.contracts_terms_key
                and p_fair_value.term_amt between INTERVAL1_DAYS_FROM and INTERVAL1_DAYS_TO
                and (p_interval2 is null or p_interval2 between INTERVAL2_DAYS_FROM and INTERVAL2_DAYS_TO)
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

    procedure get_currates(p_fair_value t_fair_value, p_rate_period number, p_currate1 out t_currate, p_currate2 out t_currate) is
        cursor cur_rate1 is
            select *
              from DWH.CURRATES
             where report_dt <= p_fair_value.snapshot_dt
               and day_cnt <= p_rate_period
               and fixfloat = p_fair_value.fixfloat
               and currency_letter_cd = p_fair_value.currency_letter_cd
               and VALID_TO_DTTM = GC_EOW
            order by report_dt desc, day_cnt desc;

        cursor cur_rate2 is
            select *
            from DWH.CURRATES
            where report_dt <= p_fair_value.snapshot_dt
              and day_cnt > p_rate_period
              and fixfloat = p_fair_value.fixfloat
              and currency_letter_cd = p_fair_value.currency_letter_cd
              and VALID_TO_DTTM = GC_EOW
            order by report_dt desc, day_cnt asc;

    begin
        dbms_application_info.set_action(action_name => 'get_currates');
        open cur_rate1;
        fetch cur_rate1 into p_currate1;
        if p_currate1.report_dt is null then
            raise_application_error(gc_error, 'No data fount for first currate');
        end if;
        close cur_rate1;

        open cur_rate2;
        fetch cur_rate2 into p_currate2;
        if p_currate2.report_dt is null then
            raise_application_error(gc_error, 'No data fount for second currate');
        end if;
        close cur_rate2;

    exception
        when others then
            if cur_rate1%isopen then close cur_rate1; end if;
            if cur_rate2%isopen then close cur_rate2; end if;
            dm.u_log(GC_PACKAGE,'get_currates/error',
                     'Ошибка при получении DWH.CURRATES по day_cnt='||p_rate_period
                         ||' report_dt<='||p_fair_value.snapshot_dt
                         ||' fixfloat='||p_fair_value.fixfloat
                         ||' currency_letter_cd='||p_fair_value.currency_letter_cd
                         ||' '||sqlerrm);
            gv_exc_flag := 'N';
            raise;
    end;

    -- Расчет кривой FTP (Трансфертной ставки)
    procedure calc_ftp(p_fair_value in out nocopy t_fair_value) is
        v_fv_max_term number;
        v_medium_term number;
        v_rate_period number; -- Срок
        v_currate1 t_currate;
        v_currate2 t_currate;
    begin
        dbms_application_info.set_action(action_name => 'calc_ftp');
        dm.u_log(GC_PACKAGE,'calc_ftp/BEGIN','Расчет кривой FTP');

        v_fv_max_term := get_over_fv_max_term(p_fair_value, case p_fair_value.fixfloat when 'fix' then 'FTP_FIX' else 'FTP' end);
        if not v_fv_max_term is null then
            p_fair_value.ftp_v := v_fv_max_term;
        else
            if p_fair_value.ftp_calculation_method_key = 2 then -- WAL
                with init_date as
                (
                    select min(DATE_FROM) init_date_from from DWH.SCHEDULES_FV where CALCULATION_ID = p_fair_value.calculation_id
                )
                select sum(LOAN_AMT * (DATE_TO - init_date.init_date_from)) / sum(LOAN_AMT)
                  into v_medium_term
                  from DWH.SCHEDULES_FV join init_date on 1=1
                 where CALCULATION_ID = p_fair_value.calculation_id;
            end if;
            v_rate_period := case when v_medium_term is null then p_fair_value.term_amt else v_medium_term end;
            get_currates(p_fair_value, v_rate_period, v_currate1, v_currate2);
            p_fair_value.ftp_v := (v_currate1.rate * (v_currate2.day_cnt-v_rate_period) + v_currate2.rate * (v_rate_period - v_currate1.day_cnt))
                                   / (v_currate2.day_cnt - v_currate1.day_cnt);
        end if;

        dm.u_log(GC_PACKAGE,'calc_ftp/END','Расчет кривой FTP');
    exception
        when others then dm.u_log(GC_PACKAGE,'calc_ftp/error','Ошибка в "Расчёт кривой FTP" '||sqlerrm); gv_exc_flag := 'N'; raise;
    end;

    -- Расчет варианта Спред+комиссия
    procedure c_t_s_arp_commission(p_fair_value in out nocopy t_fair_value) is
    begin
        dbms_application_info.set_action(action_name => 'c_t_s_arp_commission');
        dm.u_log(GC_PACKAGE,'c_t_s_arp_commission/BEGIN','Расчет варианта Спред+комиссия');
        p_fair_value.early_spread_v := nvl(get_treasury_spread(p_fair_value, 'EARLY_REPAYMENT'), p_fair_value.early_spread_v);

        insert into DM.FV_COMISSIONS (calculation_id, period_name, comission_amt)
        select p_fair_value.calculation_id, to_char(INTERVAL2_DAYS_TO)||'-'||to_char(INTERVAL2_DAYS_FROM), VALUE
          from DWH.TREASURY_SPREAD
         where TREASURY_SPREAD_TYPE = 'EARLY_REPAYMENT_COMISSION'
           and CURRENCY_LETTER_CD = p_fair_value.currency_letter_cd
           and FIXFLOAT = p_fair_value.fixfloat
           and CONTRACTS_TERMS_KEY = p_fair_value.contracts_terms_key
           and p_fair_value.term_amt between INTERVAL1_DAYS_FROM and INTERVAL1_DAYS_TO
           and VALID_TO_DTTM = GC_EOW and p_fair_value.SNAPSHOT_DT between START_DT and END_DT;

        dm.u_log(GC_PACKAGE,'c_t_s_arp_commission/END','Расчет варианта Спред+комиссия');
    exception
        when others then dm.u_log(GC_PACKAGE,'c_t_s_arp_commission/error','Ошибка в "Расчет варианта Спред+комиссия" '||sqlerrm); gv_exc_flag := 'N';
            raise;
    end;

    -- Расчет варианта Мораторий+спред
    procedure c_t_s_arp_moratorium(p_fair_value in out nocopy t_fair_value) is
    begin
        dbms_application_info.set_action(action_name => 'c_t_s_arp_moratorium');
        dm.u_log(GC_PACKAGE,'c_t_s_arp_moratorium/BEGIN','Расчет варианта Мораторий+спред');
        p_fair_value.early_spread_v :=
            nvl(get_treasury_spread(p_fair_value, 'EARLY_REPAYMENT_MORATORY', p_fair_value.moratory_term_amt), p_fair_value.early_spread_v);
        dm.u_log(GC_PACKAGE,'c_t_s_arp_moratorium/END','Расчет варианта Мораторий+спред');
    exception
        when others then dm.u_log(GC_PACKAGE,'c_t_s_arp_moratorium/error','Ошибка в "Расчет варианта Мораторий+спред" '||sqlerrm); gv_exc_flag := 'N';
            raise;
    end;

    -- Компенсирующий спред и комиссия за досрочное погашение
    procedure c_t_s_advanced_repayment(p_fair_value in out nocopy t_fair_value) is
        v_fv_max_term number;
        procedure i_do_calc is
        begin
            if p_fair_value.early_spread_type_key is null then
                p_fair_value.early_spread_v := 0;
            else
                v_fv_max_term := get_over_fv_max_term(p_fair_value, 'EARLY_SPREAD'); -- Спред за досрочное погашение
                if not v_fv_max_term is null then
                    p_fair_value.early_spread_v := v_fv_max_term;
                    return;
                end if;
                if p_fair_value.early_spread_type_key = 1 then -- Спред + комиссия
                    -- Расчет варианта Спред+комиссия
                    c_t_s_arp_commission(p_fair_value);
                elsif p_fair_value.early_spread_type_key = 2 then -- Мораторий + спред
                    -- Расчет варианта Мораторий+спред
                    c_t_s_arp_moratorium(p_fair_value);
                end if;
            end if;
        end;
    begin
        dbms_application_info.set_action(action_name => 'c_t_s_advanced_repayment');
        dm.u_log(GC_PACKAGE,'c_t_s_advanced_repayment/BEGIN','Компенсирующий спред и комиссия за досрочное погашение');
        i_do_calc;
        dm.u_log(GC_PACKAGE,'c_t_s_advanced_repayment/END','Компенсирующий спред и комиссия за досрочное погашение');
    exception
        when others then dm.u_log(GC_PACKAGE,'c_t_s_advanced_repayment/error','Ошибка в "Компенсирующий спред и комиссия за досрочное погашение" '||sqlerrm); gv_exc_flag := 'N'; raise;
    end;

    -- Комиссия за обязательство
    procedure c_t_s_commission_liability(p_fair_value in out nocopy t_fair_value) is
    begin
        dbms_application_info.set_action(action_name => 'c_t_s_commission_liability');
        dm.u_log(GC_PACKAGE,'c_t_s_commission_liability/BEGIN','Комиссия за обязательство');
        p_fair_value.revenue_comission_v := get_treasury_spread(p_fair_value, 'REVENUE_COMISSIONS', p_fair_value.use_period_amt);
        dm.u_log(GC_PACKAGE,'c_t_s_commission_liability/END','Комиссия за обязательство');
    exception
        when others then dm.u_log(GC_PACKAGE,'c_t_s_commission_liability/error','Ошибка в "Комиссия за обязательство" '||sqlerrm); gv_exc_flag := 'N'; raise;
    end;

    -- Компенсирующий спред за фиксацию ставки
    procedure c_t_s_fixation_rate(p_fair_value in out nocopy t_fair_value) is
        v_fv_max_term number;
        procedure i_do_calc is
        begin
            if p_fair_value.fix_period_amt is null then
                p_fair_value.fix_spread_v := 0;
                return;
            end if;
            v_fv_max_term := get_over_fv_max_term(p_fair_value, 'FIX_SPREAD'); -- Спред за фиксацию
            if not v_fv_max_term is null then
                p_fair_value.fix_spread_v := v_fv_max_term;
                return;
            end if;
            p_fair_value.fix_spread_v := get_treasury_spread(p_fair_value, 'FIX_RATE', p_fair_value.fix_period_amt);
        end;
    begin
        dbms_application_info.set_action(action_name => 'c_t_s_fixation_rate');
        dm.u_log(GC_PACKAGE,'c_t_s_fixation_rate/BEGIN','Компенсирующий спред за фиксацию ставки');
        i_do_calc();
        dm.u_log(GC_PACKAGE,'c_t_s_fixation_rate/END','Компенсирующий спред за фиксацию ставки');
    exception
        when others then dm.u_log(GC_PACKAGE,'c_t_s_fixation_rate/error','Ошибка в "Компенсирующий спред за фиксацию ставки" '||sqlerrm);
            gv_exc_flag := 'N'; raise;
    end;

    -- Компенсирующий спред за отмену/отсутствие индикаторов
    procedure c_t_s_compensate_indicator(p_fair_value in out nocopy t_fair_value) is
        v_fv_max_term number;
        procedure i_do_calc is
        begin
            v_fv_max_term := get_over_fv_max_term(p_fair_value, 'CNCL_SREAD'); -- Спред за отмену индикаторов
            if not v_fv_max_term is null then
                p_fair_value.cncl_spread_v := v_fv_max_term;
                return;
            end if;

            p_fair_value.full_cncl_SPREAD_v := get_treasury_spread(p_fair_value, 'FULL_CNCL_INDC');
            p_fair_value.term_cncl_SPREAD_v := get_treasury_spread(p_fair_value, 'TERM_CNCL_INDC', p_fair_value.ind_cncl_term_amt);
            p_fair_value.one_cncl_SPREAD_v := get_treasury_spread(p_fair_value, 'ONE_CNCL_INDC');
            p_fair_value.barrier := get_treasury_spread(p_fair_value, 'BARRIER');
            p_fair_value.cncl_SPREAD_v := nvl(p_fair_value.cncl_SPREAD_v, 0) + nvl(p_fair_value.full_cncl_SPREAD_v, 0)
                                          + nvl(p_fair_value.term_cncl_SPREAD_v, 0) + nvl(p_fair_value.one_cncl_SPREAD_v, 0);
        end;
    begin
        dbms_application_info.set_action(action_name => 'c_t_s_compensate_indicator');
        dm.u_log(GC_PACKAGE,'c_t_s_compensate_indicator/BEGIN','Компенсирующий спред за отмену/отсутствие индикаторов');
        i_do_calc;
        dm.u_log(GC_PACKAGE,'c_t_s_compensate_indicator/END','Компенсирующий спред за отмену/отсутствие индикаторов');
    exception
        when others then dm.u_log(GC_PACKAGE,'c_t_s_compensate_indicator/error','Ошибка в "Компенсирующий спред за отмену/отсутствие индикаторов" '||sqlerrm); gv_exc_flag := 'N'; raise;
    end;

    -- Казначейские спреды (надбавки за право досрочного погашения, отмену индикаторов и фиксацию ставки на период выборки)
    procedure calc_treasury_spread(p_fair_value in out nocopy t_fair_value) is
    begin
        dbms_application_info.set_action(action_name => 'calc_treasury_spread');
        dm.u_log(GC_PACKAGE,'calc_treasury_spread/BEGIN','Казначейские спреды');

        -- Компенсирующий спред и комиссия за досрочное погашение
        c_t_s_advanced_repayment(p_fair_value);
        -- Комиссия за обязательство
        c_t_s_commission_liability(p_fair_value);
        -- Компенсирующий спред за фиксацию ставки
        c_t_s_fixation_rate(p_fair_value);
        -- Компенсирующий спред за отмену/отсутствие индикаторов
        c_t_s_compensate_indicator(p_fair_value);

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
             where LEASING_SUBJECT_TYPE_CD = p_fair_value.leasing_subject_type_cd
               and LGD_TYPE_CD = 'RES'
               and VALID_TO_DTTM = GC_EOW and p_fair_value.SNAPSHOT_DT between BEGIN_DT and END_DT;
        exception when no_data_found then
            dm.u_log(GC_PACKAGE,'calc_credit_risk_premium','no_data_found at DWH.REF_LGD for LEASING_SUBJECT_TYPE_CD='||p_fair_value.leasing_subject_type_cd
                                ||' LGD_TYPE_CD=''RES''');
            raise;
        end;
        begin
            select PD1_MACRO
              into v_PD1_MACRO
              from DWH.PD_CORP
             where RANK_MODEL_KEY = p_fair_value.rating_model_key
               and RAT_ON_DATE = p_fair_value.rating_nam
               and VALID_TO_DTTM = GC_EOW and p_fair_value.SNAPSHOT_DT between ST_DATE and END_DATE;
        exception when no_data_found then
            dm.u_log(GC_PACKAGE,'calc_credit_risk_premium','no_data_found at DWH.PD_CORP for RANK_MODEL_KEY(as rating)='||p_fair_value.rating_model_key
                                ||' RAT_ON_DATE='||p_fair_value.rating_nam);
            raise;
        end;

        p_fair_value.PKR_V := v_pd1_macro * v_lgd;

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

        v_n_reverse := normal_inv_cumulative_distrib(v_pd);
        v_n_reverse_999 := normal_inv_cumulative_distrib(.999);
        v_x := 1/sqrt(1 - v_r) * v_n_reverse + sqrt(v_r/(1 - v_r)) * v_n_reverse_999;
        v_n := normal_cumulative_distribution(v_x);
        v_s := power(.11852 - .05478 * ln(v_pd), 2);
        v_a := 1 / (1 - 1.5 * v_s);
        v_effective_term := pl_max(2.5, p_fair_value.term_amt/365);
        v_b := 1 + (v_effective_term - 2.5) * v_s;
        v_k := v_lgd * (v_n - v_pd) * v_a * v_b;

        begin
            select ROE
              into v_roe
              from DWH.ROE
             where valid_to_dttm = GC_EOW and p_fair_value.SNAPSHOT_DT between START_DT and END_DT;
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

    -- Справедливая эффективная ставка МСФО
    procedure calc_msfo_efficient_rate(p_fair_value in out nocopy t_fair_value) is
        v_commission number;
        v_fv_msfo_rate number;
        v_client_rate number;
        cursor cur_msfo_rates(cp_commission number) is
            select fv_msfo_rate
              from DWH.FV_MSFO_RATES
             where comission_rate >= cp_commission
               and term_year = round(p_fair_value.term_amt/365)
               and VALID_TO_DTTM = GC_EOW and p_fair_value.SNAPSHOT_DT between START_DT and END_DT
             order by comission_rate;
    begin
        dbms_application_info.set_action(action_name => 'calc_msfo_efficient_rate');
        dm.u_log(GC_PACKAGE,'calc_msfo_efficient_rate/BEGIN','Справедливая эффективная ставка МСФО');
        v_commission := p_fair_value.comission_amt / p_fair_value.msfo_balance_debt_amt;
        open cur_msfo_rates(v_commission);
        fetch cur_msfo_rates into v_fv_msfo_rate;
        close cur_msfo_rates;

        v_client_rate := nvl(p_fair_value.ftp_v, 0) -- Трансфертная ставка (FTP) п. 4.4.1
                         -- Компенсирующие спреды – сумма спредов п. 4.4.2:
                         + nvl(p_fair_value.early_spread_v, 0) -- Спред за досрочное погашение
                         + nvl(p_fair_value.fix_spread_v, 0) -- Спред за фиксацию ставки
                         + nvl(p_fair_value.cncl_spread_v, 0) -- Компенсирующий спред за отмену/отсутствие индикаторов
                         + nvl(p_fair_value.pec_v, 0) -- Плата за экономический капитал п. 4.4.3
                         + nvl(p_fair_value.pkr_v, 0) -- Премия за кредитный риск п 4.4.4
                         + nvl(p_fair_value.maintenence_costs_v, 0) -- Надбавка АХР п. 4.4.6
                         + nvl(p_fair_value.direct_costs_v, 0) -- Надбавка на прямые расходы п. 4.4.5
                         + nvl(p_fair_value.other_spread, 0); -- Прочие спреды
        p_fair_value.fv_msfo_v := nvl(v_commission, 0) * nvl(v_fv_msfo_rate, 0) + v_client_rate + .01;
        dm.u_log(GC_PACKAGE,'calc_msfo_efficient_rate/END','Справедливая эффективная ставка МСФО');
    exception
        when others then
            if cur_msfo_rates%isopen then close cur_msfo_rates; end if;
            dm.u_log(GC_PACKAGE,'calc_msfo_efficient_rate/error','Ошибка в расчёте "Справедливая эффективная ставка МСФО" '||sqlerrm); gv_exc_flag := 'N'; raise;
    end;

    procedure main(
        p_snapshot_dt date default trunc(sysdate) -- Дата расчета (на какую дату запускается расчет)
        ,p_client_name varchar2 --Лизингополучатель
        ,p_term_amt number -- Срок сделки
        ,p_rating_model_key number -- Ключ рейтинговой модели
        ,p_rating_nam varchar2 -- Рейтинг
        ,p_leasing_subject_type_cd varchar2 -- Типа лизингового имущества
        ,p_currency_letter_cd varchar2 -- Валюта типа ставки
        ,p_fixfloat varchar2 -- Признак фиксированной плавающей ставки
        ,p_contracts_terms_key number -- Ключ стандартных условий договора
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
        ,p_other_spread number -- Прочие спреды
        ,p_other_spread_comment varchar2 -- Комментарий к прочим спредам
        ,p_msfo_balance_debt_amt number -- Задолженность по графику МСФО
        ,p_comission_amt number -- Комиссия за организацию сделки
    ) is
        v_fair_value t_Fair_Value;
        v_fv_max_term number;

        procedure init_fair_record is
        begin
            v_fair_value.snapshot_dt := p_snapshot_dt;
            v_fair_value.client_name := p_client_name;
            v_fair_value.term_amt := p_term_amt;
            v_fair_value.rating_model_key := p_rating_model_key;
            v_fair_value.rating_nam := p_rating_nam;
            v_fair_value.leasing_subject_type_cd := p_leasing_subject_type_cd;
            v_fair_value.currency_letter_cd := p_currency_letter_cd;
            v_fair_value.fixfloat := p_fixfloat;
            v_fair_value.currate_type_key := get_rate_type(p_currency_letter_cd, p_fixfloat, p_contracts_terms_key);
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
            v_fair_value.other_spread := p_other_spread;
            v_fair_value.other_spread_comment := p_other_spread_comment;
            v_fair_value.msfo_balance_debt_amt := p_msfo_balance_debt_amt;
            v_fair_value.comission_amt := p_comission_amt;
            insert_fair(v_fair_value);
        end;

        procedure init_log_apex is
        begin
            v_fair_value.calculation_id := etl.sq_input_file.nextval;
            insert into ETL.LOAD_LOG_APEX(FILE_ID, USER_NAM, SNAPSHOT_DT, START_DT, END_DT, STATUS_DESC, STATUS_CD, FILE_NAME,
                                          FILE_SHORT_NAME, FILE_TYPE_CD, BLOB_CONTENT, MIME_TYPE, PARAM_1, PARAM_2, PARAM_3)
            select v_fair_value.calculation_id as FILE_ID,
                        v('APP_USER') as USER_NAM,
                        p_snapshot_dt  as SNAPSHOT_DT,
                        sysdate as START_DT,
                null as END_DT,
                'Витрина рассчитывается' as STATUS_DESC,
                '1' as STATUS_CD,
                null as FILE_NAME,
                null as FILE_SHORT_NAME,
                'DM_FAIR_VALUE' as FILE_TYPE_CD,
                null as BLOB_CONTENT,
                null as MIME_TYPE,
                p_client_name as PARAM_1,
                null as PARAM_2,
                null as PARAM_3
            from dual;
            commit;
        end;

        procedure update_log_apex is
        begin
            update ETL.LOAD_LOG_APEX
            set END_DT = sysdate,
                STATUS_DESC = 'Витрина успешно рассчитана',
                STATUS_CD = '3'
            where FILE_ID = v_fair_value.calculation_id;
            commit;
        end;
    begin
        gv_exc_flag := 'Y'; -- initial value for single run
        dm.u_log(GC_PACKAGE, 'main/BEGIN','Начало расчёта справедливой ставки. Дата расчёта '||to_char(p_snapshot_dt,'YYYY-MM-DD')
                                                                               ||' пользователь '||user);
        dbms_application_info.set_module(module_name => GC_PACKAGE, action_name => 'main');
        dbms_application_info.set_client_info(client_info => to_char(p_snapshot_dt,'yyyy-mm-dd'));
        init_log_apex;
        init_fair_record;
        if not p_schedule_file_name is null then
            dm.PKG_FV_LOAD.SCHEDULES_main(p_file_id => v_fair_value.calculation_id
                                          , p_file_name => p_schedule_file_name);
        end if;

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
        -- Справедливая эффективная ставка МСФО
        calc_msfo_efficient_rate(v_fair_value);

        update_fair_result(v_fair_value);
        update_log_apex;
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
