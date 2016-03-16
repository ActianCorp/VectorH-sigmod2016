!echo ============================== Q6 START ====================================;
EXPLAIN
select
   sum(l_extendedprice * l_discount) as revenue
from
   lineitem
where
   l_shipdate >= date '1995-01-01'
   and l_shipdate < date '1996-01-01'
   and l_discount between 0.02 - 0.01 and 0.02 + 0.01
   and l_quantity < 24;

select
   sum(l_extendedprice * l_discount) as revenue
from
   lineitem
where
   l_shipdate >= date '1995-01-01'
   and l_shipdate < date '1996-01-01'
   and l_discount between 0.02 - 0.01 and 0.02 + 0.01
   and l_quantity < 24;
!echo ============================== Q6 END ====================================;
