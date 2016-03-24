CREATE EXTERNAL TABLE ext_tpch.nation
(N_NATIONKEY INTEGER, --key
N_NAME CHAR(25), 
N_REGIONKEY INTEGER, --key
N_COMMENT VARCHAR(152),
dummy text)
LOCATION ('pxf://path/to/nation.tbl?PROFILE=HdfsTextSimple')
FORMAT 'TEXT' (DELIMITER '|');
