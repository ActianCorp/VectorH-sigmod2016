!echo ============================== Q11 START ====================================;
drop view q11_part_tmp_cached;
drop view q11_sum_tmp_cached;

create view q11_part_tmp_cached as
select
  ps_partkey, sum(ps_supplycost * ps_availqty) as part_value
from
  nation n join supplier s
  on
    s.s_nationkey = n.n_nationkey and n.n_name = 'JAPAN'
  join partsupp ps
  on
    ps.ps_suppkey = s.s_suppkey
group by ps_partkey;

create view q11_sum_tmp_cached as
select
  sum(part_value) as total_value
from
  q11_part_tmp_cached;

EXPLAIN
select
  ps_partkey, part_value as value
from
  (
    select ps_partkey, part_value, total_value
    from q11_part_tmp_cached join q11_sum_tmp_cached
  ) a
where part_value > total_value * 0.0000001000
order by value desc;

select
  ps_partkey, part_value as value
from
  (
    select ps_partkey, part_value, total_value
    from q11_part_tmp_cached join q11_sum_tmp_cached
  ) a
where part_value > total_value * 0.0000001000
order by value desc;
!echo ============================== Q11 END ====================================;
