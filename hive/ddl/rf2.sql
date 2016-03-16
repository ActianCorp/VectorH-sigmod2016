use ${DB};

drop table if exists deletes;
create external table deletes (
 D_ORDERKEY BIGINT
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE
LOCATION '${LOCATION_RF}/delete.u1/';

delete from lineitem where exists (select d_orderkey from deletes where lineitem.l_orderkey = deletes.d_orderkey);
delete from orders where exists (select d_orderkey from deletes where orders.o_orderkey = deletes.d_orderkey);
