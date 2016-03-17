select ps_partkey, value
  from
  (
         select
            sum(ps_supplycost * ps_availqty) * 0.0000001000 as supplycost10
         from
            partsupp,
            supplier,
            nation
         where
            ps_suppkey = s_suppkey
            and s_nationkey = n_nationkey
            and n_name = 'JAPAN'
   ) part_sum_cached,
   (
    select
      ps_partkey,
      sum(ps_supplycost * ps_availqty) as value
    from
      partsupp,
      supplier,
      nation
    where
      ps_suppkey = s_suppkey
      and s_nationkey = n_nationkey
      and n_name = 'JAPAN'
    group by
      ps_partkey
   ) partsupp
   where 
     value > supplycost10
   order by
    value desc 
