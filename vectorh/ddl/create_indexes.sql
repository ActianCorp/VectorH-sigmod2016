create index orders_idx on orders(o_orderdate)\p\g
create index lineitem_idx on lineitem(l_orderkey)\p\g
create index part_idx on part(p_partkey)\p\g
create index partsupp_idx on partsupp(ps_partkey)\p\g
create index region_idx on region(r_regionkey)\p\g
create index nation_idx on nation(n_regionkey)\p\g
--create index customer_idx on customer(c_nationkey)\p\g --disabled because the tables have incompatible partitioning
create index supplier_idx on supplier(s_nationkey)\p\g
