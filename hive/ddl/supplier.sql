create database if not exists ${DB};
use ${DB};

drop table if exists supplier;

create table supplier
(
 S_SUPPKEY INT ,
 S_NAME CHAR(25) ,
 S_ADDRESS VARCHAR(40) ,
 S_NATIONKEY INT ,
 S_PHONE CHAR(15) ,
 S_ACCTBAL FLOAT ,
 S_COMMENT VARCHAR(101) 
)
row format serde '${SERDE}'
stored as ${FILE} tblproperties ("orc.compress"="SNAPPY");

insert overwrite table supplier select * from ${SOURCE}.supplier;
ANALYZE TABLE supplier COMPUTE STATISTICS;
ANALYZE TABLE supplier COMPUTE STATISTICS FOR COLUMNS;
