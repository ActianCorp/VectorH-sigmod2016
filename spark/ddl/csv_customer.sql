CREATE TEMPORARY TABLE csv_customer(
c_custkey bigint,
c_name string,
c_address string,
c_nationkey bigint,
c_phone string,
c_acctbal decimal(12,2),
c_mktsegment string,
c_comment string
) USING com.databricks.spark.csv
OPTIONS (path "<path_to_tpch_csv>/customer*", header "false", delimiter "|", parserLib "univocity") 
