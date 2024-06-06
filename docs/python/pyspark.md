# Pyspark

Following documentation from [Dap Cats pyspark intro](https://best-practice-and-impact.github.io/ons-spark/pyspark-intro/pyspark-intro.html)

## Overview

PySpark DataFrames are processed on the Spark cluster. This is a big pool of linked machines, called nodes. PySpark DataFrames are distributed into partitions, and are processed in parallel on the nodes in the Spark cluster. You can have much greater memory capacity with Spark and so is suitable for big data.

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

### Creating Spark Dataframes
Create spark session
```python
import pandas as pd
from pyspark.sql import SparkSession, functions as F

spark = (SparkSession.builder.master("local[2]")
         .appName("create-DFs")
         .getOrCreate())
```
One column df
```python
seed_no = 100
random_numbers = (spark.range(5)
                  .withColumn("rand_no", F.rand(seed_no)))

```
From pandas df
```python
winners_pd = pd.DataFrame(
    {"year": list(range(2017, 2022)),
     "winner": ["Minella Times", None, "Tiger Roll", "Tiger Roll", "One For Arthur"],
     "starting_price": ["11/1", None, "4/1 F", "10/1", "14/1"],
     "age": [8, None, 9, 8, 8],
     "jockey": ["Rachael Blackmore", None, "Davy Russell", "Davy Russell", "Derek Fox"]
})
winners_spark = spark.createDataFrame(winners_pd)
```

Manual creation of df
```python
winners_spark = spark.createDataFrame(data=[
    [2021, "Minella Times", "11/1", 8, "Rachael Blackmore"],
    [2020, None, None, None, None],
    [2019, "Tiger Roll", "4/1 F", 9, "Davy Russell"],
    [2018, "Tiger Roll", "10/1", 8, "Davy Russell"],
    [2017, "One For Arthur", "14/1", 8, "Derek Fox"]],
    schema=["year", "winner", "starting_price", "age", "jockey"])
```

### Quick reference

functions | description 
-|-
`spark.read.csv()`, `spark.read.table()` | Read in data from csv or hive tables
`.printSchema()` | Print schema
`.show()` | Show first few rows of df to terminal
`.toPandas()` | spark df to pandas df
`.select()` | sql query to select columns
`.count()` | counts rows
`.drop()` | drop columns
`.withColumnRenamed()` | rename column
`.filter()` | filter columns, use with `F.col()`


## Testing 

When creating dataframes during testing, you need to reference a spark session. Instead of creating a new sparksession inside each function, create a fixture for it.

```python title="conftest.py"
import pytest
from pyspark.sql import SparkSession

@pytest.fixture
def spark_fixture():
    spark = SparkSession.builder.appName("Testing PySpark Example").getOrCreate()
    yield spark

```


Use chispa library to check if 2 dfs are equal.
```python
from chispa import assert_df_equality
```