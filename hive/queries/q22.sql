!echo ============================== Q22 START ====================================;
EXPLAIN
select
    cntrycode,
    count(*) as numcust,
    sum(c_acctbal) as totacctbal
from
    (
        select
            substring(c_phone, 1, 2) as cntrycode,
            c_acctbal
        from
            customer left outer join orders on (o_custkey = c_custkey),
            (
                select
                    avg(c_acctbal) as avg_c_acctbal
                from
                    customer
                where
                    c_acctbal > 0.00
                    and substring(c_phone, 1, 2) in
                        ('25', '22', '35', '20', '26', '21', '30')
            ) c3
        where
            o_custkey is null
            and substring(c_phone, 1, 2) in
                ('25', '22', '35', '20', '26', '21', '30')
            and c_acctbal > avg_c_acctbal
    ) as custsale
group by
    cntrycode
order by
    cntrycode;

select
    cntrycode,
    count(*) as numcust,
    sum(c_acctbal) as totacctbal
from
    (
        select
            substring(c_phone, 1, 2) as cntrycode,
            c_acctbal
        from
            customer left outer join orders on (o_custkey = c_custkey),
            (
                select
                    avg(c_acctbal) as avg_c_acctbal
                from
                    customer
                where
                    c_acctbal > 0.00
                    and substring(c_phone, 1, 2) in
                        ('25', '22', '35', '20', '26', '21', '30')
            ) c3
        where
            o_custkey is null
            and substring(c_phone, 1, 2) in
                ('25', '22', '35', '20', '26', '21', '30')
            and c_acctbal > avg_c_acctbal
    ) as custsale
group by
    cntrycode
order by
    cntrycode;
!echo ============================== Q22 END ====================================;
