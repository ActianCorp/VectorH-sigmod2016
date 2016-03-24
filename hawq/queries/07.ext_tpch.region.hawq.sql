CREATE EXTERNAL TABLE ext_tpch.region
(R_REGIONKEY INTEGER, --key
R_NAME CHAR(25),
R_COMMENT VARCHAR(152),
dummy text)
LOCATION ('pxf://path/to/region.tbl?PROFILE=HdfsTextSimple')
FORMAT 'TEXT' (DELIMITER '|');
