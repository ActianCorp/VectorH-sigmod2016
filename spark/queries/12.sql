 select
   l_shipmode,
   sum(case
      when o_orderpriority = '1-URGENT'
         or o_orderpriority = '2-HIGH'
         then 1
      else 0
   end) as high_line_count,
   sum(case
      when o_orderpriority <> '1-URGENT'
         and o_orderpriority <> '2-HIGH'
         then 1
      else 0
   end) as low_line_count
from
   orders join
   (select l_shipmode, l_receiptdate, l_commitdate, date(l_shipdate) as d_l_shipdate, l_orderkey
    from lineitem) lineitem on (l_orderkey = o_orderkey)
where
   l_shipmode in ('REG AIR', 'TRUCK')
   and d_l_shipdate < l_commitdate
   and l_commitdate < l_receiptdate
   and l_receiptdate >= date '1997-01-01'
   and l_receiptdate < date '1998-01-01'
group by
   l_shipmode
order by
   l_shipmode 
