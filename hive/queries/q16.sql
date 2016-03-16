!echo ============================== Q16 START ====================================;
drop view supplier_tmp_cached;
drop view q16_tmp_cached;
drop table q16_parts_supplier_relationship_cached;

create view supplier_tmp_cached as
select
  s_suppkey
from
  supplier
where
  not s_comment like '%Customer%Complaints%';

create view q16_tmp_cached as
select
  p_brand, p_type, p_size, ps_suppkey
from
  partsupp ps join part p
  on
    p.p_partkey = ps.ps_partkey and p.p_brand <> 'Brand#53'
    and not p.p_type like 'PROMO POLISHED%'
  join supplier_tmp_cached s
  on
    ps.ps_suppkey = s.s_suppkey;

EXPLAIN
select
  p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
from
  (select
     *
   from
     q16_tmp_cached
   where p_size in (7, 30, 22, 14, 8, 33, 12, 13)
) q16_all
group by p_brand, p_type, p_size 
order by supplier_cnt desc, p_brand, p_type, p_size;

select
  p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
from
  (select
     *
   from
     q16_tmp_cached
   where p_size in (7, 30, 22, 14, 8, 33, 12, 13)
) q16_all
group by p_brand, p_type, p_size
order by supplier_cnt desc, p_brand, p_type, p_size;
!echo ============================== Q16 END ====================================;
