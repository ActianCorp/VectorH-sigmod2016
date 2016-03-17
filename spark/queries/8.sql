select
   o_year,
   sum(case
      when nation = 'IRAN' then volume
      else 0
   end) / sum(volume) as mkt_share
from
   (
      select
         year(o_orderdate) as o_year,
         l_extendedprice * (1 - l_discount) as volume,
         n2.n_name as nation
      from
         part join 
         lineitem on (p_partkey = l_partkey) join
         supplier on (l_suppkey = s_suppkey) join
         orders on (o_orderkey = l_orderkey) join
         customer on (o_custkey = c_custkey),
         nation n1,
         nation n2,
         region
      where
         c_nationkey = n1.n_nationkey
         and n1.n_regionkey = r_regionkey
         and r_name = 'MIDDLE EAST'
         and s_nationkey = n2.n_nationkey
         and o_orderdate between '1995-01-01' and '1996-12-31'
         and p_type = 'MEDIUM ANODIZED TIN'
   ) as all_nations
group by
   o_year
order by
   o_year
