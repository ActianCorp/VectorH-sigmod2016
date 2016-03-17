def profile[T](f: => T)(prefix: String = "Command") = {
    val start = System.nanoTime()
    val ret = f
    val time = (System.nanoTime().toDouble - start) / 1000000000
    println(f"$prefix took ${time}%.6fs.")
    (ret, time)
}


val df_queries = {
    import scala.io.Source
    (1 to 22).map { case id =>
        sqlContext.sql(Source.fromFile(s"queries/${id}.sql").getLines.mkString("\n"))
    }
}

/** Need to manually specify which tables to cache because Spark cannot prune partitions if Parquet tables are cached in memory in 1.5.2. Obviously, not TPC-H legal, but tried to get the best performance out of SparkSQL */
val tablesToCache: Map[Int, List[String]] = Map(
1 -> List("lineitem"),
2 -> List("part", "supplier", "partsupp"),
3 -> List.empty[String],
4 -> List("lineitem"),
5 -> List("lineitem", "customer"),
6 -> List.empty[String],
7 -> List("orders", "customer"),
8 -> List("part", "lineitem", "customer"),
9 -> List("lineitem", "orders"),
10 -> List("lineitem", "customer"),
11 -> List("partsupp", "supplier"),
12 -> List("lineitem", "orders"),
13 -> List("orders", "customer"),
14 -> List("part"),
15 -> List("supplier"),
16 -> List("partsupp", "supplier"),
17 -> List("lineitem"),
18 -> List("lineitem", "orders", "customer"),
19 -> List("lineitem"),
20 -> List("supplier", "partsupp"),
21 -> List("lineitem", "supplier"),
22 -> List("orders", "customer")
)

def runTPCH(outputPath: String, numRuns: Int = 3) = {
    import java.io._
    val fw = new FileWriter(new File(s"${outputPath}/results.txt"))
    fw.write("Spark SQL results for the 22 TPC-H queries\nQuery\t")
    (1 to numRuns).foreach { nr => fw.write(s"Run $nr\t") }
    fw.write("\n")
    fw.flush
    (1 to 22).foreach { case id => 
        val q = df_queries(id - 1)
        
        val c = tablesToCache(id)
        c.foreach { sqlContext.cacheTable(_) }
        
        fw.write(s"Q${id}\t")
        q.explain()
        for (i <- 1 to numRuns) {
            val cfw = new FileWriter(new File(s"${outputPath}/q${id}_${i}.result"))
            val ret = try {
                Some(profile(q.collect())(s"Query ${id}"))
            } catch {
                case e: Exception => None
            }
            ret match {
                case Some((result, time)) => 
                    result.foreach { case row => cfw.write(s"""${row.toSeq.map(_.toString).mkString("\t")}\n""") }
                    fw.write(s"${time}\t")
                case None =>
                    cfw.write("<error>\n")
                    fw.write(s"<error>\t")
            }
            fw.flush
            cfw.close
        }
        fw.write("\n")
        fw.flush
        c.foreach { sqlContext.uncacheTable(_) }
    }
    fw.close
}

