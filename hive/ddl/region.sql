create database if not exists ${DB};
use ${DB};

drop table if exists region;

create table region
(
 R_REGIONKEY INT ,
 R_NAME CHAR(25) ,
 R_COMMENT VARCHAR(152) 
)
row format serde '${SERDE}'
stored as ${FILE} tblproperties ("orc.compress"="SNAPPY");

insert overwrite table region select * from ${SOURCE}.region;
ANALYZE TABLE region COMPUTE STATISTICS;
ANALYZE TABLE region COMPUTE STATISTICS FOR COLUMNS;
