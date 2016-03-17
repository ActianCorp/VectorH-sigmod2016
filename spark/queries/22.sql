with avg_customer as (
        select
                avg(c_acctbal) as avg_c_acctbal, 1 as join_key
            from
                customer
            where
                c_acctbal > 0.00
                and substring(c_phone, 1, 2) in
                    ('25', '22', '35', '20', '26', '21', '30')
    ), customers_without_orders as (
        select c_custkey, substring(c_phone, 1, 2) as cntrycode, c_acctbal, 1 as c_join_key
        from customer left outer join orders on (c_custkey = o_custkey)
        where o_custkey is null
        and substring(c_phone, 1, 2) in ('25', '22', '35', '20', '26', '21', '30')
    )
    select
        cntrycode,
        count(*) as numcust,
        sum(c_acctbal) as totacctbal
    from
        (
            select cntrycode, c_acctbal
            from
            customers_without_orders join
            avg_customer on (join_key = c_join_key)
            where
            c_acctbal > avg_c_acctbal
        ) customer
    group by cntrycode
    order by cntrycode 
