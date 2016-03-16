create database if not exists ${DB};
use ${DB};

drop table if exists partsupp;

create table partsupp
(
 PS_PARTKEY INT,
 PS_SUPPKEY INT,
 PS_AVAILQTY INT,
 PS_SUPPLYCOST DECIMAL(6,2),
 PS_COMMENT VARCHAR(199) 
)
CLUSTERED BY(PS_PARTKEY) INTO 180 BUCKETS
stored as ${FILE} tblproperties ("orc.compress"="SNAPPY");

insert overwrite table partsupp select * from ${SOURCE}.partsupp;
ANALYZE TABLE partsupp COMPUTE STATISTICS;
ANALYZE TABLE partsupp COMPUTE STATISTICS FOR COLUMNS;
alter table partsupp set TBLPROPERTIES("transactional"="true");
alter table partsupp set TBLPROPERTIES("NO_AUTO_COMPACTION"="true");
