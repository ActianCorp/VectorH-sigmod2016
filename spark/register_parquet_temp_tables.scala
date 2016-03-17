def registerTPCHTables(path: String): Unit = {
    for (table <- List("region", "nation", "supplier", "part", "partsupp", "customer", "orders", "lineitem")) {
        sqlContext.read.parquet(s"${path}/${table}.parquet").registerTempTable(s"$table")
        /** See comment in run_queries.scala */
        // sqlContext.cacheTable(s"$table")
    }
}
