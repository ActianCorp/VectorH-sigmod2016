create database if not exists ${DB};
use ${DB};

drop table if exists lineitem;

create table lineitem
(
 L_ORDERKEY INT ,
 L_PARTKEY INT ,
 L_SUPPKEY INT ,
 L_LINENUMBER INT ,
 L_QUANTITY DECIMAL(2,0),
 L_EXTENDEDPRICE DECIMAL(8,2),
 L_DISCOUNT DECIMAL(2,2),
 L_TAX DECIMAL(2,2),
 L_RETURNFLAG CHAR(1) ,
 L_LINESTATUS CHAR(1) ,
 L_SHIPDATE DATE ,
 L_COMMITDATE DATE ,
 L_RECEIPTDATE DATE ,
 L_SHIPINSTRUCT CHAR(25) ,
 L_SHIPMODE CHAR(10) ,
 L_COMMENT VARCHAR(44) 
)
CLUSTERED BY(L_ORDERKEY) INTO 180 BUCKETS
stored as ${FILE} tblproperties ("orc.compress"="SNAPPY");

insert overwrite table lineitem select * from ${SOURCE}.lineitem;
ANALYZE TABLE lineitem COMPUTE STATISTICS;
ANALYZE TABLE lineitem COMPUTE STATISTICS FOR COLUMNS;
alter table lineitem set TBLPROPERTIES("transactional"="true");
alter table lineitem set TBLPROPERTIES("NO_AUTO_COMPACTION"="true");

