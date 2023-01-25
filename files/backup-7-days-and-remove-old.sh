#!/bin/bash
# Backing up directory for 7 days
# Removing backups in backup folder, that are older than 7 days

# The directory to be backed up
original_dir="./original"

# The directory to save the backup to
backup_dir="../backup"

# The date and time to append to the backup file
date_time=`date +%Y-%m-%d-%H-%M-%S`

# The name of the backup file
backup_file="$backup_dir/backup-$date_time.zip"

# Create the backup directory if it doesn't exist
if [ ! -d "$backup_dir" ]; then
  mkdir "$backup_dir"
fi

# Compress and archive the original directory
zip -r "$backup_file" "$original_dir"

# Remove backups older than 7 days
find "$backup_dir" -name "backup-*.zip" -mtime +7 -exec rm {} \;

# Print confirmation message
echo "Directory $original_dir has been backed up to $backup_file"
