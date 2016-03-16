!echo ============================== Q20 START ====================================;
EXPLAIN
select
   s_name,
   s_address
from
   supplier left semi join
   (
      select
         ps_suppkey as f_ps_suppkey
      from
         partsupp left semi join
         (
            select
               p_partkey as f_p_partkey
            from
               part
            where
               p_name like 'moccasin%'
         ) filteredparts on (ps_partkey = f_p_partkey),
         (
            select
               l_partkey as l_partkey05, l_suppkey as l_suppkey05, 0.5 * sum(l_quantity) as l_quantity05
            from
               lineitem
            where
               l_shipdate >= date '1995-01-01'
               and l_shipdate < date '1996-01-01'
            group by l_partkey, l_suppkey
         ) lq
      where
         ps_partkey = l_partkey05
         and ps_suppkey = l_suppkey05
         and ps_availqty > l_quantity05
   ) filteredsuppliers on (s_suppkey = f_ps_suppkey),
   nation
where
   s_nationkey = n_nationkey
   and n_name = 'ETHIOPIA'
order by
   s_name;

select
   s_name,
   s_address
from
   supplier left semi join
   (
      select
         ps_suppkey as f_ps_suppkey
      from
         partsupp left semi join
         (
            select
               p_partkey as f_p_partkey
            from
               part
            where
               p_name like 'moccasin%'
         ) filteredparts on (ps_partkey = f_p_partkey),
         (
            select
               l_partkey as l_partkey05, l_suppkey as l_suppkey05, 0.5 * sum(l_quantity) as l_quantity05
            from
               lineitem
            where
               l_shipdate >= date '1995-01-01'
               and l_shipdate < date '1996-01-01'
            group by l_partkey, l_suppkey
         ) lq
      where
         ps_partkey = l_partkey05
         and ps_suppkey = l_suppkey05
         and ps_availqty > l_quantity05
   ) filteredsuppliers on (s_suppkey = f_ps_suppkey),
   nation
where
   s_nationkey = n_nationkey
   and n_name = 'ETHIOPIA'
order by
   s_name;
!echo ============================== Q20 END ====================================;
