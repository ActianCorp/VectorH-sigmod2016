TRUNCATE TABLE tpch.region;
TRUNCATE TABLE tpch.nation;
TRUNCATE TABLE tpch.customer;
TRUNCATE TABLE tpch.supplier;
TRUNCATE TABLE tpch.part;
TRUNCATE TABLE tpch.partsupp;
TRUNCATE TABLE tpch.orders;
TRUNCATE TABLE tpch.lineitem;
DROP SCHEMA IF EXISTS tpch CASCADE;
DROP SCHEMA IF EXISTS ext_tpch CASCADE;
CREATE SCHEMA tpch;
CREATE SCHEMA ext_tpch;
