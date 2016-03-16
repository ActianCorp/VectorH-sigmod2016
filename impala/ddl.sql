CREATE TABLE nation (
n_nationkey BIGINT ,
n_name CHAR(25) ,
n_regionkey BIGINT ,
n_comment VARCHAR(152) 
) STORED AS PARQUET;

CREATE TABLE region (
r_regionkey BIGINT ,
r_name CHAR(25) ,
r_comment VARCHAR(152) 
) STORED AS PARQUET;

CREATE TABLE part (
p_partkey BIGINT ,
p_name VARCHAR(55) ,
p_mfgr CHAR(25) ,
p_brand CHAR(10) ,
p_type VARCHAR(25) ,
p_size INTEGER ,
p_container CHAR(10) ,
p_retailprice DECIMAL(12,2) ,
p_comment VARCHAR(23) 
) STORED AS PARQUET;

CREATE TABLE customer (
c_custkey BIGINT ,
c_name VARCHAR(25) ,
c_address VARCHAR(40) ,
c_nationkey BIGINT ,
c_phone CHAR(15) ,
c_acctbal DECIMAL(12,2) ,
c_mktsegment CHAR(10) ,
c_comment VARCHAR(117) 
) STORED AS PARQUET;

CREATE TABLE lineitem (
l_orderkey BIGINT ,
l_partkey BIGINT ,
l_suppkey BIGINT ,
l_linenumber INTEGER ,
l_quantity DECIMAL(12,2) ,
l_extendedprice DECIMAL(12,2) ,
l_discount DECIMAL(12,2) ,
l_tax DECIMAL(12,2) ,
l_returnflag CHAR(1) ,
l_linestatus CHAR(1) ,
l_commitdate TIMESTAMP,
l_receiptdate TIMESTAMP,
l_shipinstruct CHAR(25) ,
l_shipmode CHAR(10) ,
l_comment VARCHAR(44) 
) PARTITIONED BY (l_shipdate STRING) STORED AS PARQUET;

CREATE TABLE orders (
o_orderkey BIGINT ,
o_custkey BIGINT ,
o_orderstatus CHAR(1) ,
o_totalprice DECIMAL(12,2) ,
o_orderpriority CHAR(15) ,
o_clerk CHAR(15) ,
o_shippriority INTEGER ,
o_comment VARCHAR(79) 
) PARTITIONED BY (o_orderdate STRING) STORED AS PARQUET;

CREATE TABLE supplier (
s_suppkey BIGINT ,
s_name CHAR(25) ,
s_address VARCHAR(40) ,
s_nationkey BIGINT ,
s_phone CHAR(15) ,
s_acctbal DECIMAL(12,2) ,
s_comment VARCHAR(101) 
) STORED AS PARQUET;

CREATE TABLE partsupp (
ps_partkey BIGINT ,
ps_suppkey BIGINT ,
ps_availqty INTEGER ,
ps_supplycost DECIMAL(12,2) ,
ps_comment VARCHAR(199) 
) STORED AS PARQUET;
