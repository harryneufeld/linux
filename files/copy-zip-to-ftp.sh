#!/bin/bash
# Copies zip files to ftp server

# The directory containing the zip files
local_dir="./local_directory"

# The FTP server details
ftp_server="ftp.example.com"
ftp_user="ftp_username"
ftp_password="ftp_password"

# The remote directory to copy the files to
remote_dir="/backups"

# Connect to the FTP server
ftp -inv $ftp_server << EOF
user $ftp_user $ftp_password

# Change to the remote directory
cd $remote_dir

# Loop through all zip files in the local directory
for file in $local_dir/*.zip; do
    # Get the file name
    filename=$(basename "$file")
    # Upload the file to the remote directory
    put "$file" "$filename"
done

# Disconnect from the FTP server
bye
EOF
