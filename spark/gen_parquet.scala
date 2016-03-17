val tables = List("region", "nation", "supplier", "part", "partsupp", "customer", "orders", "lineitem")
trait PartitionType
case class Partitioned(key: String) extends PartitionType
case class NotPartitioned(nrFiles: Int) extends PartitionType

def tablesWithPartitioning(parallelismLevel: Int): List[(String, PartitionType)] = tables.map(table => (table, table match {
    case "region" => NotPartitioned(1)
    case "nation" => NotPartitioned(1)
    case "supplier" => NotPartitioned(5)
    case "part" => Partitioned("p_brand")
    case "partsupp" => NotPartitioned(parallelismLevel * 2)
    case "customer" => Partitioned("c_mktsegment")
    case "orders" => Partitioned("o_orderdate")
    case "lineitem" => Partitioned("l_shipdate")
    case _ => throw new Exception(s"Unrecognized table $table")
})
)

def genParquetFiles(parallelismLevel: Int, path: String) {
    import org.apache.spark.HashPartitioner
    val part = new HashPartitioner(parallelismLevel)
    for ((table, partitioningType) <- tablesWithPartitioning(parallelismLevel)) {
        var df = sqlContext.sql(s"select * from csv_$table")
        val writer = partitioningType match {
            case Partitioned(key) => 
                val rdd = df.rdd.map(row => (row.get(row.fieldIndex(key)), row)).partitionBy(part).values
                sqlContext.createDataFrame(rdd, df.schema).write.partitionBy(key)
            case NotPartitioned(nrFiles) => df.repartition(nrFiles).write
        }    
        writer.parquet(s"${path}/${table}.parquet")
    }
}
