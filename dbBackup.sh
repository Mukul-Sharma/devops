#!/bin/sh
now="$(date +'%d_%m_%Y_%H_%M_%S')"
filename="db_backup_$now".gz
backupfolder="/var/www/vhosts/example.com/httpdocs/backups"
fullpathbackupfile="$backupfolder/$filename"
mysqldump --user=mydbuser --password=mypass --default-character-set=utf8 mydatabase | gzip > "$fullpathbackupfile"
chown myuser "$fullpathbackupfile"

//delete old files
find "$backupfolder" -name db_backup_* -mtime +8 -exec rm {} \;

exit 0
