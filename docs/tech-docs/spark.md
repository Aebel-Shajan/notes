# Spark

## Aggregations 
The moment you introduce a global operation (distinct, groupBy, orderBy, joins):
* Spark loses the ability to stop early
* It must scan everything

