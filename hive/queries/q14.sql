!echo ============================== Q14 START ====================================;
EXPLAIN
select
   100.00 * sum(case
      when p_type like 'PROMO%'
         then l_extendedprice * (1 - l_discount)
      else 0
   end) / sum(l_extendedprice * (1 - l_discount)) as promo_revenue
from
   lineitem,
   part
where
   l_partkey = p_partkey
   and l_shipdate >= date '1997-11-01'
   and l_shipdate < date '1997-12-01';

select
   100.00 * sum(case
      when p_type like 'PROMO%'
         then l_extendedprice * (1 - l_discount)
      else 0
   end) / sum(l_extendedprice * (1 - l_discount)) as promo_revenue
from
   lineitem,
   part
where
   l_partkey = p_partkey
   and l_shipdate >= date '1997-11-01'
   and l_shipdate < date '1997-12-01';
!echo ============================== Q14 END ====================================;
