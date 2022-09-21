#!/bin/bash

#print service time
date

#virtualenv is now active
source /mnt/e/dataengineer/project/hadoop_batchprocessing/venv/bin/activate

#running etl service
python  /mnt/e/dataengineer/project/hadoop_batchprocessing/app.py

filetime=$(date +"%Y%m%d")
echo "[INFO] Mapreduce is Running ....."
#running mapreduce on local
python /mnt/e/dataengineer/project/hadoop_batchprocessing/mapreduce.py /mnt/e/dataengineer/project/hadoop_batchprocessing/local/dim_orders_$filetime.csv > /mnt/e/dataengineer/project/hadoop_batchprocessing/output/totalorder_output_local_map.txt
#running mapreduce hadoop
python /mnt/e/dataengineer/project/hadoop_batchprocessing/mapreduce.py -r hadoop hdfs:///project/dim_orders_$filetime.csv > /mnt/e/dataengineer/project/hadoop_batchprocessing/output/totalorder_output_hadoop_map.txt

echo "[INFO] Mapreduce is Done ....."