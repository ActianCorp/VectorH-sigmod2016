!echo ============================== Q15 START ====================================;
drop view revenue_cached;
drop view max_revenue_cached;
drop table q15_top_supplier_cached;

create view revenue_cached as
select
  l_suppkey as supplier_no, sum(l_extendedprice * (1 - l_discount)) as total_revenue
from
  lineitem
where
  l_shipdate >= date '1993-02-01' and l_shipdate < date '1993-05-01'
group by l_suppkey;

create view max_revenue_cached as
select
  max(total_revenue) as max_revenue
from
  revenue_cached;

EXPLAIN
select
  s_suppkey, s_name, s_address, s_phone, total_revenue
from supplier s join revenue_cached r
  on
    s.s_suppkey = r.supplier_no
  join max_revenue_cached m
  on
    r.total_revenue = m.max_revenue 
order by s_suppkey;

select
  s_suppkey, s_name, s_address, s_phone, total_revenue
from supplier s join revenue_cached r
  on
    s.s_suppkey = r.supplier_no
  join max_revenue_cached m
  on
    r.total_revenue = m.max_revenue
order by s_suppkey;
!echo ============================== Q15 END ====================================;
