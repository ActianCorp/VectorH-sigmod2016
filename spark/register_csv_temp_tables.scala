def registerCSVTempTables(path: String): Unit = {
    import scala.io.Source
    for (table <- List("region", "nation", "supplier", "part", "partsupp", "customer", "orders", "lineitem")) {
        val createSql = Source.fromFile(s"ddl/csv_${table}.sql").getLines.mkString("\n").replace("<path_to_tpch_csv>", path)
        sqlContext.sql(createSql)
    }
}
