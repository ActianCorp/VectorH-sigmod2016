create database if not exists ${DB};
use ${DB};

drop table if exists customer;

create table customer
(
 C_CUSTKEY INT ,
 C_NAME VARCHAR(25) ,
 C_ADDRESS VARCHAR(40) ,
 C_NATIONKEY INT ,
 C_PHONE CHAR(15) ,
 C_ACCTBAL DECIMAL(7,2),
 C_MKTSEGMENT CHAR(10) ,
 C_COMMENT VARCHAR(117) 
)
CLUSTERED BY(C_CUSTKEY) INTO 180 BUCKETS
stored as ${FILE} tblproperties ("orc.compress"="SNAPPY");

insert overwrite table customer select * from ${SOURCE}.customer;
ANALYZE TABLE customer COMPUTE STATISTICS;
ANALYZE TABLE customer COMPUTE STATISTICS FOR COLUMNS;
alter table customer set TBLPROPERTIES("transactional"="true");
alter table customer set TBLPROPERTIES("NO_AUTO_COMPACTION"="true");
