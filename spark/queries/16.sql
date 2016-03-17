select
   p_brand,
   p_type,
   p_size,
   count(distinct ps_suppkey) as supplier_cnt
from
   partsupp,
   part left outer join (
      select
         s_suppkey
      from
         supplier
      where
         s_comment like '%Customer%Complaints%'
   ) filteredsuplliers on (ps_suppkey = s_suppkey)
where
   p_partkey = ps_partkey
   and p_brand <> 'Brand#53'
   and p_type not like 'PROMO POLISHED%'
   and p_size in (7, 30, 22, 14, 8, 33, 12, 13)
   and s_suppkey is null
group by
   p_brand,
   p_type,
   p_size
order by
   supplier_cnt desc,
   p_brand,
   p_type,
   p_size 
