# meteor-script-backup
Easy backup script for Meteor App

## Installation

1. Create a backup directory where you want to store your backup. EG. `/backup`
2. Change the variable of the script to your liking.
  - `dbName` is the name of the MongoDB base.
  - `cfsLoc` is the location of your CFS directory if needed.
  - `curdate` is the date command format you want to use.
  - `backupLoc` is the directory you've created to store your backup.
3. Set a cron to run the script when you want.

## Manual Backup

If your backup are store in `/backup`, as **root**, run the following command:

`sh /backup/backup.sh >> /backup/logs/`date +"%y-%m-%d"` 2>&1`

## Manual Restore
If your backup are store in `/backup`, as root, run the following commands where 11-11-11 is the backup date:

- `tar -xf mongo-11-11-11.tar.gz -C mongo-11-11-11`
- `mongorestore --dir mongo-11-11-11`
- `tar -xf cfs-11-11-11.tar.gz -C cfs-11-11-11`
- `cp -r cfs-11-11-11 /opt/mywebsite/cfs`
- `rm -r mongo-11-11-11 cfs-11-11-11`
