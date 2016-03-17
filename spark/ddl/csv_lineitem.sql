CREATE TEMPORARY TABLE csv_lineitem(
l_orderkey bigint, 
l_partkey bigint, 
l_suppkey bigint, 
l_linenumber int, 
l_quantity decimal(12,2), 
l_extendedprice decimal(12,2), 
l_discount decimal(12,2),
l_tax decimal(12,2),
l_returnflag string,
l_linestatus string,
l_shipdate string,
l_commitdate date,
l_receiptdate date,
l_shipinstruct string,
l_shipmode string,
l_comment string
) USING com.databricks.spark.csv
OPTIONS (path "<path_to_tpch_csv>/lineitem*", header "false", delimiter "|", parserLib "univocity") 
