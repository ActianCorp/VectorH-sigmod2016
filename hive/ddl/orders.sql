create database if not exists ${DB};
use ${DB};

drop table if exists orders;

create table orders
(
 O_ORDERKEY INT ,
 O_CUSTKEY INT ,
 O_ORDERSTATUS CHAR(1) ,
 O_TOTALPRICE DECIMAL(8,2),
 O_ORDERDATE DATE ,
 O_ORDERPRIORITY CHAR(15) ,
 O_CLERK CHAR(15) ,
 O_SHIPPRIORITY INT ,
 O_COMMENT VARCHAR(79) 
)
CLUSTERED BY(O_ORDERKEY) INTO 180 BUCKETS
stored as ${FILE} tblproperties ("orc.compress"="SNAPPY");

insert overwrite table orders select * from ${SOURCE}.orders;
ANALYZE TABLE orders COMPUTE STATISTICS;
ANALYZE TABLE orders COMPUTE STATISTICS FOR COLUMNS;
alter table orders set TBLPROPERTIES("transactional"="true");
alter table orders set TBLPROPERTIES("NO_AUTO_COMPACTION"="true");
