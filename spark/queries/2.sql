select
   s_acctbal,
   s_name,
   n_name,
   p_partkey,
   p_mfgr,
   s_address,
   s_phone,
   s_comment
from
   supplier join
   partsupp on (s_suppkey = ps_suppkey) join
   part on (p_partkey = ps_partkey) join
   nation on (s_nationkey = n_nationkey) join
   region on (n_regionkey = r_regionkey) join
   (
      select
         ps_partkey as st_partkey, MIN(ps_supplycost) as minsupplycost
      from
         partsupp,
         supplier,
         nation,
         region
      where
         s_suppkey = ps_suppkey
         and s_nationkey = n_nationkey
         and n_regionkey = r_regionkey
         and r_name = 'AFRICA'
      group by ps_partkey
   ) supplytable on (p_partkey = st_partkey)
where
   p_size = 15
   and p_type like '%BRASS'
   and r_name = 'AFRICA'
   and ps_supplycost = minsupplycost
order by
   s_acctbal desc,
   n_name,
   s_name,
   p_partkey
limit 100 
