#!/bin/bash
export SCALE=1000
export DIR=
export DIR_RF=
export FILE="orc"
export SERDE="org.apache.hadoop.hive.ql.io.orc.OrcSerde"
export DB="tpch_orc_${SCALE}"
export SOURCE="tpch_text_${SCALE}"
