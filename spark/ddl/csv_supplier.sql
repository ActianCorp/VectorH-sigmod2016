CREATE TEMPORARY TABLE csv_supplier(
s_suppkey bigint,
s_name string,
s_address string,
s_nationkey bigint,
s_phone string,
s_acctbal decimal(12,2),
s_comment string
) USING com.databricks.spark.csv
OPTIONS (path "<path_to_tpch_csv>/supplier*", header "false", delimiter "|", parserLib "univocity") 
