create database if not exists ${DB};
use ${DB};

drop table if exists nation;

create table nation
(
 N_NATIONKEY INT ,
 N_NAME CHAR(25) ,
 N_REGIONKEY INT ,
 N_COMMENT VARCHAR(25) 
)
row format serde '${SERDE}'
stored as ${FILE} tblproperties ("orc.compress"="SNAPPY");

insert overwrite table nation select * from ${SOURCE}.nation;
ANALYZE TABLE nation COMPUTE STATISTICS;
ANALYZE TABLE nation COMPUTE STATISTICS FOR COLUMNS;
