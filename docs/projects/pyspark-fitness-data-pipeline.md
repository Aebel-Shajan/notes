# Pyspark Fitness Data Pipeline

# Stuff to learn:
- [ ] Types of joins
- [x] Save Hive Tables
- [ ] Learn SQL Syntax
- [ ] Joins: Left, Inner, Anti-Join
- [ ] Window vs GroupBy

# Issues:

## Can't save hive table using datafile.write.saveAsTable()

The error is to do with write permissions when I attempt to save as a hive table. 

```bash
py4j.protocol.Py4JJavaError: An error occurred while calling o77.saveAsTable.
: org.apache.hadoop.security.AccessControlException: 
Permission denied: user=shajaa, access=WRITE, inode="/user/hive/warehouse":hive:hive:drwxrwx--x
```


**Solution**:
Modify the spark session builder to enable Hive.

```python
spark = (
    SparkSession.builder.appName("default-session")
    .config(
        "spark.sql.legacy.allowCreatingManagedTableUsingNonemptyLocation", "true"
    )
    .enableHiveSupport()
    # Enable writing to partitioned tables through Spark
    .config("hive.exec.dynamic.partition.mode", "nonstrict")
    .getOrCreate()
)
```
