\sql
set autocommit on
\g
\p\g
\sql
set session with privileges=all
\p\g

\nocontinue

ALTER TABLE orders   ADD CONSTRAINT pk_orders   PRIMARY KEY (o_orderkey); \p\g
ALTER TABLE partsupp ADD CONSTRAINT pk_partsupp PRIMARY KEY (ps_partkey, ps_suppkey); \p\g
ALTER TABLE part     ADD CONSTRAINT pk_part     PRIMARY KEY (p_partkey); \p\g
ALTER TABLE customer ADD CONSTRAINT pk_customer PRIMARY KEY (c_custkey); \p\g
ALTER TABLE supplier ADD CONSTRAINT pk_supplier PRIMARY KEY (s_suppkey); \p\g
ALTER TABLE nation   ADD CONSTRAINT pk_nation   PRIMARY KEY (n_nationkey); \p\g
ALTER TABLE region   ADD CONSTRAINT pk_region   PRIMARY KEY (r_regionkey); \p\g
--ALTER TABLE lineitem ADD CONSTRAINT pk_lineitem PRIMARY KEY (l_orderkey, l_linenumber); \p\g	--disabled to speed up loading

