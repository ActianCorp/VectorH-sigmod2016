with revenue as (
select
   l_suppkey as supplier_no,
   sum(l_extendedprice * (1-l_discount)) as total_revenue
from
   lineitem
   where
   l_shipdate >= '1993-02-01'
   and l_shipdate < '1993-05-01'
group by
   l_suppkey
) select
   s_suppkey,
   s_name,
   s_address,
   s_phone,
   total_revenue
from
   supplier,
   revenue left semi join
   (
      select max(total_revenue) as max_total_revenue
      from revenue
   ) trevenue on (total_revenue = max_total_revenue)
where
   s_suppkey = supplier_no
order by
   s_suppkey 
