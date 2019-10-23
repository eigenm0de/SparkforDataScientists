#! /bin/sh
mysql -ppassword -e "drop database metastore;"
mysql -ppassword -e "create database metastore;"
mysql -ppassword -e "grant all privileges on *.* to 'test'@'localhost' identified by 'password';"
schematool -initSchema -dbType mysql
hadoop fs -rm -r /regions
hadoop fs -rm -r /user
hadoop fs -mkdir /user
hadoop fs -mkdir /user/student
hadoop fs -mkdir /user/hive
hadoop fs -mkdir /user/hive/warehouse
hadoop fs -chown student:student /user/student
cat /home/student/ROI/Spark/regions.hql
hive --service metastore &
hive -i /home/student/ROI/Spark/regions.hql
