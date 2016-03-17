/** NOTE: these commands work when spark shell is started from the same directory as the one that contains this file */
val hdfsPrefix="hdfs://<namenode>:<port>/user/<username>"
val csvPath=s"$hdfsPrefix/csv_data/tpch/SF-1000"
val parquetPath=s"$hdfsPrefix/parquet_data/tpch/SF-1000"
val parallelismLevel=180

:load register_csv_temp_tables.scala 
registerCSVTempTables(csvPath)

:load gen_parquet.scala
genParquetFiles(parallelismLevel, parquetPath)

:load register_parquet_temp_tables.scala
registerTPCHTables(parquetPath)

:load run_queries.scala
runTPCH("/tmp/tpch_results")

