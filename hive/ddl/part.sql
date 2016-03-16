create database if not exists ${DB};
use ${DB};

drop table if exists part;

create table part
(
 P_PARTKEY INT ,
 P_NAME VARCHAR(55),
 P_MFGR CHAR(25),
 P_BRAND CHAR(10),
 P_TYPE VARCHAR(25),
 P_SIZE INT,
 P_CONTAINER CHAR(10),
 P_RETAILPRICE DECIMAL(6,2),
 P_COMMENT VARCHAR(23) 
)
CLUSTERED BY(P_PARTKEY) INTO 180 BUCKETS
stored as ${FILE} tblproperties ("orc.compress"="SNAPPY");

insert overwrite table part select * from ${SOURCE}.part;
ANALYZE TABLE part COMPUTE STATISTICS;
ANALYZE TABLE part COMPUTE STATISTICS FOR COLUMNS;
alter table part set TBLPROPERTIES("transactional"="true");
alter table part set TBLPROPERTIES("NO_AUTO_COMPACTION"="true");
