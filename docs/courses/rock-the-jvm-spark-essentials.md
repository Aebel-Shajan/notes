# Spark Essentials with Scala

1. Welcome
2. Spark Structured API with DataFrames
3. Spark Types and Datasets
4. Spark SQL
5. Spark Low-Level
6. Practical Spark
7. A Real Big Data Project


## 1. Welcome 
Welcome
* Github repo found here https://github.com/rockthejvm/spark-essentials
* Has docker compose for spark cluster and psql db

How to make the best of this course
* dedicated 1 or 2 hours of focus with breaks in
* course is challenging

Scala recap
* full notes here: https://github.com/rockthejvm/spark-essentials/blob/2.1-dataframes/src/main/scala/part1recap/ScalaRecap.scala
* key takeaways:
    * traits contain methods which can be given to a class
    * pattern matching is overpowered (lets you break down structure of input into switch statement)
    * futures exists, makes use of pattern matching
    * implicits do weird stuff. (compiler fills in arg for function when implicits around)


Spark first principles
* Replaced MapReduce
* phase 1: simple functioning programming api
* phase 2: interactive data science + spark shell + spark sql
* phase 3: ml, streaming, graphx
* The most popular data processing engine
* spark is not concerned with data sources
* spark is not part of hadoop


## 2. Spark Strucutured API with DataFrames

DataFrames Basics
* use jdk 11, jdk 17 bugs out bruh
* in practice don't use infer schema (dates can cause problems), define own schema
* create spark sessions using `sparkSession.builder().appName().config().getOrCreate()` (pseudo)
* use `import spark.implicits._` to make creating dfs easier

DataFrames Basics: Exercises
* implicitly read in df
* use `.option("inferSchema", "true")` to infer schema when reading in df

How Dataframes work
* Distrubuted collections of rows conforming to a schema
* Distributed => data too big for single computer/ takes too long
* partitioning => split data into files distributed between nodes in cluster
* Dataframes are immutable, can't be changed once created
* Transformations:
    * narrow: one input partition to on output partition
    * wide: one or more in to manay output
* Shuffle: data exchange between cluster nodes. Occurs in wide transformations
* Lazy evaluation: spark waits until last moment to execute df transformations
* Planning: spark compiles df transformations into graph before running code.
    * logical plan: df dependency graph + tx
    * physical plan: optimises sequence of steps
* Optimizations
* Transformations vs actions
    * transformations describe how dfs are obteained
    * actions start executing code

Data Sources
* read and write dataframe from various formats to various formats
* `.option("mode", "failFast")` fails if malformed record encountered
* writing data: `.save("src/main/resources/data/cars_dupe.json")`
    * writes to a folder `cars_dupe.json` which contains alot of files.
```
carsDf.write
    .format("json")
    .mode(SaveMode.Overwrite)
    .save("src/main/resources/data/cars_dupe.json")
```

Data Sources, Part 2 + Exercises:
* use `.option("dateFormat", "YYYY-MM-dd")` to specify date format, needs schema though, with a DateType field.
* instead of `df.write.format("json").load("path/to/json_file.json")` you can do `spark.write.json("path/to/json_file.json")`
* default `df.write.save()` saves to parquet.
* snappy parquet has bettter compression
* To connect to remote db:
```scala
 val employeesDf = spark.read
    .format("jdbc")
    .option("driver", "org.postgresql.Driver")
    .option("url", "jdbc:postgresql://localhost:5432/rtjvm")
    .option("user", "docker")
    .option("password", "docker")
    .option("dbtable", "public.employees")
    .load()
```
* this should be ran after docker container containing postgresql db is exposed on port 5432.
* check from terminal that db is accessible by doing: `psql -h localhost -p 5432 -U docker -d rtjvm` (checking on host: localhost and port: 5432)

DataFrame Columns and Expressions
* various select methods, difference comes later in joins.
* selecting is a narrow transformation. every input partion has one output partition
* not equal operator for columns: `=!=` or `===` for equality
* multiple ways of filtering: `.filter` or `.where`
* `.and()` same as `and` same as `&&`

DataFrame columns and expressions exercises
* summing nullable columns naively returns null. Need to use `coalesce`, which will be introduced later

Dataframe aggregations
* aggs:
    * `count`
    * `countDistinct`
    * `approx_count_distinct`
    * `min` and `max`
    * `sum`
    * `avg`
    * `mean`
    * `stddev`
* after grouping you get a `RelationalGroupedDataset`, not working with dataframe. call aggregation on groupby.
* `agg` allows you to calculate multiple aggregations at once from same dataset which has been grouped
* can use `    .orderBy(col("average_rating").desc_nulls_last)` to order by descending
* aggregations and grouping are examples of wide transformations => one or more to one or more partitions
* shuffling is expensive, better to do groupings at the ending


## 3. Spark Types and Datasets
Working with Spark Types
* pearson correlation coefficient `df.stat.corr`
* capitalise: `initcap`, `lower`, `upper`
* regex: `regexp_extract`, `regexp_replace`

Advanced Spark Types

