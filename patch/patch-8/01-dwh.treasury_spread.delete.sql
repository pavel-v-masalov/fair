delete from dwh.treasury_spread t
where t.contracts_terms_key=1
        and (
        (t.currency_letter_cd='RUB' and t.treasury_spread_type='EARLY_REPAYMENT_COMISSION')
        or (t.currency_letter_cd!='RUB' and t.treasury_spread_type='BARRIER')
    );
commit;