CREATE TEMPORARY TABLE csv_nation(
n_nationkey bigint,
n_name string,
n_regionkey int,
n_comment string
) USING com.databricks.spark.csv
OPTIONS (path "<path_to_tpch_csv>/nation*", header "false", delimiter "|", parserLib "univocity")
