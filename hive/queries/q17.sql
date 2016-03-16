!echo ============================== Q17 START ====================================;
EXPLAIN
select
   sum(l_extendedprice) / 7.0 as avg_yearly
from
   lineitem,
   part,
   (
      select
         l_partkey as l_partkey02, 0.2 * avg(l_quantity) as l_quantity02
      from
         lineitem
      group by
         l_partkey
   ) lq
where
   p_partkey = l_partkey
   and p_partkey = l_partkey02
   and p_brand = 'Brand#35'
   and p_container = 'SM PKG'
   and l_quantity < l_quantity02;

select
   sum(l_extendedprice) / 7.0 as avg_yearly
from
   lineitem,
   part,
   (
      select
         l_partkey as l_partkey02, 0.2 * avg(l_quantity) as l_quantity02
      from
         lineitem
      group by
         l_partkey
   ) lq
where
   p_partkey = l_partkey
   and p_partkey = l_partkey02
   and p_brand = 'Brand#35'
   and p_container = 'SM PKG'
   and l_quantity < l_quantity02;
!echo ============================== Q17 END ====================================;
