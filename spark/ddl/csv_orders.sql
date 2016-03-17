 CREATE TEMPORARY TABLE csv_orders(
o_orderkey bigint,
o_custkey bigint,
o_orderstatus string,
o_totalprice decimal(12,2),
o_orderdate string,
o_orderpriority string,
o_clerk string,
o_shippriority int,
o_comment string
) USING com.databricks.spark.csv
OPTIONS (path "<path_to_tpch_csv>/orders*", header "false", delimiter "|", parserLib "univocity")
