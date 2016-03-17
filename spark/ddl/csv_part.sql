CREATE TEMPORARY TABLE csv_part(
p_partkey bigint, 
p_name string, 
p_mfgr string, 
p_brand string, 
p_type string, 
p_size int, 
p_container string, 
p_retailprice decimal(12,2),
p_comment string
) USING com.databricks.spark.csv
OPTIONS (path "<path_to_tpch_csv>/part.*", header "false", delimiter "|", parserLib "univocity") 
