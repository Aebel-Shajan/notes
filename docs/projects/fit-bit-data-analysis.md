# Fitbit data analysis

**timeline** : 5th July - 

The aim of this project is to export my fitbit data to gain insight on different health metrics.


## Data:

Data is recorded from 2022-12-04 to 2024-06-20 with some data missing because i didnt wear my fitbit.

###  /global-export-data

Data stored in json files. Each file contains time series data for a single day:

**important**
- Heart Rate (Track how heart rate fluctuates for each workout?)
- Calories 
- Sleep

**not important**
- Distance 
- Estimate oxygen variation
- Lightly active minutes
- Moderately active minutes
- Sedentary minutes
- Very active minutes
    
### /heart-rate-variablility
Csvs containing heart rate metrics for each day. Csvs only contain one row. 

Could read in all the different csvs and combine them into one csv/table/df.

### /sleep-score
Single csv containing time series data about sleep throughout each night.

Could maybe merge with workout dataframe to see correlation between sleep and workout performance??
    


## Ideas on what to do:
1) Some of the data from "global-export-data" has already been aggregated for us. 
    I could try the process of aggregating myself and check if my data matches their 
    data.
    
2) Add sleep score to each workout.

3) Track how heart rate fluctuates for each workout.

4) Create annual heatmaps for sleep, heartrate and steps.
