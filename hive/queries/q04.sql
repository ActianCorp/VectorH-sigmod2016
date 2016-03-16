!echo ============================== Q4 START ====================================;
EXPLAIN
 select
   o_orderpriority,
   count(*) as order_count
from
   orders left semi join
   (
      select 
         l_orderkey
      from
         lineitem
      where
         l_commitdate < l_receiptdate
   ) lineitem
   on (o_orderkey = l_orderkey)
where
   o_orderdate >= date '1993-10-01'
   and o_orderdate < date '1994-01-01'
group by
   o_orderpriority
order by
   o_orderpriority;

 select
   o_orderpriority,
   count(*) as order_count
from
   orders left semi join
   (
      select 
         l_orderkey
      from
         lineitem
      where
         l_commitdate < l_receiptdate
   ) lineitem
   on (o_orderkey = l_orderkey)
where
   o_orderdate >= date '1993-10-01'
   and o_orderdate < date '1994-01-01'
group by
   o_orderpriority
order by
   o_orderpriority;
!echo ============================== Q4 END ====================================;
