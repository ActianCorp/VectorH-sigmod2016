!echo ============================== Q21 START ====================================;
EXPLAIN
 select
    s_name,
    count(*) as numwait
from
    supplier,
    lineitem l1 left outer join (
        select l_orderkey, max(l_suppkey) as max_lsuppkey, count(l_suppkey) as count_lsuppkey
        from lineitem
        group by l_orderkey
    ) l2 on (l1.l_orderkey = l2.l_orderkey)
    left outer join
    (
        select
            l_orderkey, max(l_suppkey) as max_lsuppkey, count(l_suppkey) as count_lsuppkey
        from
            lineitem
        where
            l_receiptdate > l_commitdate
        group by l_orderkey
    ) l3 on (l1.l_orderkey = l3.l_orderkey),
    orders,
    nation
where
    (l3.l_orderkey is null or (l3.count_lsuppkey = 1 and l1.l_suppkey = l3.max_lsuppkey))
    and (l2.count_lsuppkey > 1 or l1.l_suppkey <> l2.max_lsuppkey)
    and s_suppkey = l1.l_suppkey
    and o_orderkey = l1.l_orderkey
    and o_orderstatus = 'F'
    and l1.l_receiptdate > l1.l_commitdate
    and s_nationkey = n_nationkey
    and n_name = 'IRAN'
group by
    s_name
order by
    numwait desc,
    s_name
limit 100;

 select
    s_name,
    count(*) as numwait
from
    supplier,
    lineitem l1 left outer join (
        select l_orderkey, max(l_suppkey) as max_lsuppkey, count(l_suppkey) as count_lsuppkey
        from lineitem
        group by l_orderkey
    ) l2 on (l1.l_orderkey = l2.l_orderkey)
    left outer join
    (
        select
            l_orderkey, max(l_suppkey) as max_lsuppkey, count(l_suppkey) as count_lsuppkey
        from
            lineitem
        where
            l_receiptdate > l_commitdate
        group by l_orderkey
    ) l3 on (l1.l_orderkey = l3.l_orderkey),
    orders,
    nation
where
    (l3.l_orderkey is null or (l3.count_lsuppkey = 1 and l1.l_suppkey = l3.max_lsuppkey))
    and (l2.count_lsuppkey > 1 or l1.l_suppkey <> l2.max_lsuppkey)
    and s_suppkey = l1.l_suppkey
    and o_orderkey = l1.l_orderkey
    and o_orderstatus = 'F'
    and l1.l_receiptdate > l1.l_commitdate
    and s_nationkey = n_nationkey
    and n_name = 'IRAN'
group by  
    s_name
order by
    numwait desc,
    s_name   
limit 100;
!echo ============================== Q21 END ====================================;
