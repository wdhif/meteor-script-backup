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

# Container default values are for MupX
containerName="mongodb"
containerBackupLoc="/data/db/backup"
dbName="manager"
cfsLoc="/opt/mywebsite/cfs"
curDate=`date +"%y-%m-%d"`
backupLoc="/backup/backup"

## Mongo Backup ##

# dump db - inside container
docker exec -it $containerName mongodump -d $dbName -o $containerBackupLoc/$dbName-$curDate
# copy dump from container to file system
docker cp mongodb:$containerBackupLoc/$dbName-$curDate $backupLoc
echo 'Data extracted from the Docker Container - Compressing...'
# compress
tar -zcf $backupLoc/$dbName-$curDate.tar.gz $backupLoc/$dbName-$curDate
echo 'Compression complete - Deleting temporary data...'
# To avoid rm -r / issue, do not use variable below
rm -r /backup/backup/$dbName-$curDate

# CFS backup
#cp -r $cfsLoc $mydb-$curDate
#tar -zcf $mydb-$curDate.tar.gz $mydb-$curDate
#rm -r $mydb-$curDate

# Add here your SCP
