select
   c_name,
   c_custkey,
   o_orderkey,
   date(o_orderdate) as d_orderdate,
   o_totalprice,
   sum(l_quantity)
from
   customer,
   orders left semi join 
   (
      select
         l_orderkey as f_l_orderkey
      from
         lineitem
      group by
         l_orderkey
      having
         sum(l_quantity) > 315
   ) filteredorders on (o_orderkey = f_l_orderkey),
   lineitem
where 
   c_custkey = o_custkey
   and o_orderkey = l_orderkey
group by
   c_name,
   c_custkey,
   o_orderkey,
   o_orderdate,
   o_totalprice
order by
   o_totalprice desc,
   d_orderdate 
