# Pyspark

Following documentation from [Dap Cats pyspark intro](https://best-practice-and-impact.github.io/ons-spark/pyspark-intro/pyspark-intro.html)

## Overview


### Sessions

* Start a default session : `SparkSession.builder`/`spark_connect()`

```python
from pyspark.sql import SparkSession
spark = (
    SparkSession.builder.appName("default-session")
    .getOrCreate()
)
```

* Stop sessions by using : `spark.stop()`/`spark_disconnect() `

* Config `spark-defaults.conf` configuration file

* Two modes: local, cluster

* When using cdsw, spark config is already done for you when you launch the session.


### Data Types

* Types are inferred in Pyspark

* Import from `pyspark.sql.type`
```python
# Structural types
from pyspark.sql.types import StructType, StructField
# String type
from pyspark.sql.types import StringType
# Numeric types
from pyspark.sql.types import IntegerType, DecimalType, DoubleType
# Date types
from pyspark.sql.types import DateType, TimestampType
```

* Example scheme: 

```bash
root
|-- incident_number: string (nullable = true)
|-- date_time_of_call: string (nullable = true)
|-- cal_year: integer (nullable = true)
|-- fin_year: string (nullable = true)
```

* Can read data from parquet files (scheme included) and csvs (not included, scheme inferred or provided like below)
```python
from pyspark.sql.types import StructType, StructField, StringType, IntegerType

rescue_schema = StructType([
StructField("incident_number", StringType()),
StructField("date_time_of_call", StringType()),
StructField("cal_year", IntegerType()),
StructField("fin_year", StringType())
])
```

* Column methods `.cast()` or `.astype()` to change type of column

### Create DF manually

```python
import pandas as pd
from pyspark.sql import SparkSession, functions as F

spark = (SparkSession.builder.master("local[2]")
         .appName("create-DFs")
         .getOrCreate())

seed_no = 100
random_numbers = (spark.range(5)
                  .withColumn("rand_no", F.rand(seed_no)))

random_numbers.show()
```

## Introduction to Pyspark

PySpark DataFrames are processed on the Spark cluster. This is a big pool of linked machines, called nodes. PySpark DataFrames are distributed into partitions, and are processed in parallel on the nodes in the Spark cluster. You can have much greater memory capacity with Spark and so is suitable for big data.


functions | description 
-|-
`spark.read.csv()`, `spark.read.table()` | Read in data from csv or hive tables
`.printSchema()` | Print schema
`.show()` | Show first few rows of df to terminal
`.toPandas()` | spark df to pandas df
`.select()` | sql query to select columns
`.count()` | counts rows
`.drop()` | drop columns
`.withColumnRenamed` | rename column
`.filter()` | filter columns, use with `F.col()`

