CREATE TEMPORARY TABLE csv_partsupp(
ps_partkey bigint,
ps_suppkey bigint,
ps_availqty int,
ps_supplycost decimal(12,2),
ps_comment string
) USING com.databricks.spark.csv
OPTIONS (path "<path_to_tpch_csv>/partsupp.*", header "false", delimiter "|", parserLib "univocity") 
