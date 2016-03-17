CREATE TEMPORARY TABLE csv_region(
r_regionkey bigint,
r_name string,
r_comment string
) USING com.databricks.spark.csv
OPTIONS (path "<path_to_tpch_csv>/region*", header "false", delimiter "|", parserLib "univocity")
