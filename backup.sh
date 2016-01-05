#!/bin/bash

# Manual Backup as root
# sh /backup/backup.sh >> /backup/logs 2>&1

###################################################
#       Manual Restore - USE WITH CAUTION !       #
###################################################
# tar -xf mongo-11-11-11.tar.gz -C mongo-11-11-11 #
# mongorestore --dir mongo-11-11-11               #
# tar -xf cfs-11-11-11.tar.gz -C cfs-11-11-11     #
# cp -r cfs-11-11-11 /opt/mywebsite/cfs           #
# rm -r mongo-11-11-11 cfs-11-11-11               #
###################################################

dbName="mydb"
cfsLoc="/opt/mywebsite/cfs"
curDate=`date +"%y-%m-%d"`
backupLoc="/backup"
cd backupLoc

# Mongo Backup
mongodump -d $dbName -o mongo-$curDate
tar -zcf mongo-$curDate.tar.gz mongo-$curDate
rm -r mongo-$curDate

# CFS backup
cp -r $cfsLoc cfs-$curDate
tar -zcf cfs-$curDate.tar.gz cfs-$curDate
rm -r cfs-$curDate
